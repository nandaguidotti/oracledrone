/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
*/

// Organizando...
var requests_names = Array();
requests_names["btn-cadastrar-rota"] = "cadastrar_rota";
requests_names["btn-select-route-plot"] = "select_route_plot";
requests_names["btn-cadastrar-mosaico"] = "cadastro-mosaico";
requests_names["btn-select-linha-cultivo"] = "selecionar_linha_cultivo";
//requests_names["btn-cadastrar-user"] = "cadastro-user";


var validar_forms = Array();
validar_forms["cadastrar_rota"] = validarFormCadastrarRota;
validar_forms["select_route_plot"] = validarFormSelecionarRota;
validar_forms["cadastro-mosaico"] = validarFormCadastroMosaico;
validar_forms["selecionar_linha_cultivo"] = validarFormSelecionarMosaico;
//validar_forms["cadastro-user"] = validarFormCadastrarUser;

var success_requests_forms = Array();
success_requests_forms["cadastrar_rota"] = successCadastrarRota;
success_requests_forms["cadastro-mosaico"] = successMosaico;
success_requests_forms["gerar_linha_cultivo"] = successLinhaCultivo;
success_requests_forms["upload_linha_cultivo"] = successUploadLinhaCultivo;


$(".progress").hide();

$(function(){
    var options_ajax = {
        "beforeSubmit": beforeSubmitAjaxRequest,
        "success": successAjaxRequest,
        "error": errorAjaxRequest,
        "uploadProgress": uploadProgress
    }
    var btn_forms = $('.btn-form-ps');

    for (var i = 0; i < btn_forms.length; i++){
        var key = btn_forms[i].getAttribute("data-form-parent");
        if(key === "" || requests_names[key] === undefined){
            console.log("Erro ao preparar ajax para o btn-form. Campo id vazio ou invalido.");
            console.log("Id recebido:", key);
        } else{
            $("#"+requests_names[key]).ajaxForm(options_ajax);
        }
    }
});

function uploadProgress(event, position, total, percentComplete){
    /*console.log("======= uploadProgress => ()==========");
    console.log(event);
    console.log(position);
    console.log(total);
    console.log(percentComplete);
    console.log("====== uploadProgress => () ======");*/
    //$(".progress_bar").css("width", `${percentComplete}%`);
}

function beforeSubmitAjaxRequest(data, form, options){
    //console.log("options=>");
    //console.log(options);            
    //data.forEach(function(v, i){
    //    console.log(v, i)
    //});
    // Funcao para verificar dados antes de enviar
    // validação pode ser realizada aqui
    console.log("Form =>", form[0].id);
    return validar_forms[form[0].id](data);
}

function successAjaxRequest(response){
    //alert("Rota cadastrada com sucesso!");
    $('.progress_bar').addClass('determinate').removeClass('indeterminate');
    $(".progress_bar").css("width", `100%`);
    console.log("successAjaxRequest() => Tipo de resposta da requisição ajax", typeof(response));

    console.log(response);
    var obj;
    try{
        obj = JSON.parse(response);
        console.log(obj);
        alert(obj.message);

        //Resetando formulario
        var type_request = obj["tipoRequisicao"];
        
        if(type_request !== "gerar_linha_cultivo" && type_request !== "upload_linha_cultivo"){
            f = $("#"+type_request)[0];
            for(i = 0; i < f.length;i++){
                if(f[i].tagName === "INPUT" || f[i].tagName === "SELECT"){
                    f[i].value=""
                }
            }
            f[0].value = type_request;
        }

        //parte adicional para tratar individualmente cada requisição com sucesso
        success_requests_forms[type_request](obj);

    } catch(ex){
        console.log("Exception gerada => ", ex.message);
        alert("Operação não realizada, tente novamente.")
    }

    // Caso as mensagens de confirmação não estejam funcionando comentar a instrução dentro de try/catch e remover comentario da proxima linha
    //alert("Operação Realizada com Sucesso!");


    //var elems = document.querySelectorAll('.modal');
    //var instances = M.Modal.init(elems, options);
}

function errorAjaxRequest(response){
    console.log("Erro ao cadastrar rota!");
    console.log("ErrorerrorAjaxRequest()=> Tipo de resposta da requisição ajax", typeof(response));
    console.log(response);
    var obj;
    if(typeof(response) === "object"){
        obj = JSON.parse(response);
        console.log(obj);
    }
}
function validarFormCadastrarRota(data){
    if(data[1]["value"] === "" || data[2]["value"] === ""){
        alert("Preencha todos os campos corretamente.");
        return false;

    }
    var type_request = data[0]["name"];
    //var nome = data[1]["name"];
    var nome_value = data[1]["value"];
    var param = `frm_name=${nome_value}&objname=rota&${type_request}=validar_name`; 

    var response = $.ajax({
        async: false,
        url: "AjaxRequest",
        dataType: "json",
        method: "POST",
        data: param
    }).responseText

    var obj = JSON.parse(response);
    if(!obj["isValid"]){
        alert("Nome invalido. Já existe uma rota cadastrada com o mesmo nome salvo em seu usuario.")
    } else{
        $(".progress").show();
        $('.progress_bar').addClass('indeterminate').removeClass('determinate');
    }
    //console.log(obj["isValid"])
    return obj["isValid"];
}
function validarFormSelecionarRota(data){
    return true;
}
function validarFormCadastroMosaico(data){
    var result = false;
    var type_request_value = data[0]["value"];
    if(type_request_value === "cadastro-mosaico"){
        if(data[3]["value"] == "" || data[4]["value"] == ""){
            if(data[3]["value"] == ""){
                alert("Digite um nome para o mosaico");
            } else{
                alert("Selecione um arquivo zip que deseja fazer upload para gerar o mosaico.");
            }
            result = false;
        } else{    
            var type_request = data[0]["name"];
            var nome_value = data[3]["value"];
            //var param = `${nome}=${nome_value}&${type_request}=validar_name_mosaico`; 

            var param = `frm_name=${nome_value}&objname=mosaico&${type_request}=validar_name`; 

            var response = $.ajax({
                async: false,
                url: "AjaxRequest",
                dataType: "json",
                method: "POST",
                data: param
            }).responseText

            var obj = JSON.parse(response);
            if(!obj["isValid"]){
                alert("Nome invalido. Já existe um mosaico com o mesmo nome salvo em seu usuario.")
            }
            result = obj["isValid"];
        }
    } else{
        if(data[2]["value"] == ""){
            alert("Selecione o mosaico que deseja visualizar");
        } else{
            nome_mosaico = data[2]["value"];
            id_usuario = document.getElementById('nome_mosaico').getAttribute("data-user-id");
            path = `home/od_images_mosaico/${id_usuario}/${nome_mosaico}`;
            path = `images/img_mosaico/${id_usuario}/${nome_mosaico}`;
            $("#img-mosaico").attr("src", path);
            $("#cadastro-mosaico").hide();
            $("#resultado_mosaico").show();
            $(".progress").hide();

//  f1.2.jpg.png
//  img/img_linha_cultivo/1/f1.2.jpg.png
//

            //console.log(`\n=====Path====\n${path}\n=======`);
        }
        result = false;
    }
    if(result){
        $(".progress").show();
        $('.progress_bar').addClass('indeterminate').removeClass('determinate');
    }
    return result;
}

function validarFormSelecionarMosaico(data){
    console.log(data);
    var type_request_value = data[0]["value"];
    
    if(type_request_value === "gerar_linha_cultivo"){
        if(data[2]["value"] == ""){
            alert("Selecione um mosaico.");
            return false;
        }
    } else if(data[3]["value"] === ""){
        alert("Selecione o mosaico que deseja enviar para processamento.");
        return false;
    } else{
        var type_request = data[0]["name"];
        var name_mosaico_value = data[3]["value"]["name"];
        var param = `frm_name=${name_mosaico_value}&objname=mosaico&${type_request}=validar_name`; 
        //console.log(name_mosaico_value);
        
        var response = $.ajax({
        async: false,
        url: "AjaxRequest",
        dataType: "json",
        method: "POST",
        data: param
        }).responseText

        var obj = JSON.parse(response);
        if(!obj["isValid"]){
            alert("Nome invalido. Já existe um mosaico com o mesmo nome salvo em seu usuario.");
            return false;
        }
    }
    $(".progress").show();
    $('.progress_bar').addClass('indeterminate').removeClass('determinate');
    return true;
}
/*
function validarFormCadastroUser(data){
    return true;
}
*/


function successCadastrarRota(json){

}

function successMosaico(json){
    console.log(json);
    try{
        mosaico_nome = json["name_mosaico"];
        opt = `<option value="${mosaico_nome}">${mosaico_nome}</option>`;
        $("#nome_mosaico").append(opt);
    } catch(ex){
        console.log("Exception gerada => ", ex.message);
        alert("Operação não realizada, tente novamente.")
    }
}

function successLinhaCultivo(json){
    // Exibir Informações na tela
    console.log("successLinhaCultivo() => Tipo de resposta da requisição ajax", typeof(json));
    $("#signup-inner").hide();
    $("#resultado_linha_cultivo").show();
    $("#input_qtd_arbole").val(json["qtd_arbole"]);
    $("#input_qtd_fruto").val(json["qtd_arbole"] * 975);
    var src_img = `images/img_linha_cultivo/${json["path_name_linhacultivo"]}.png`;
    $("#img-linha-cultivo").attr("src", src_img);

}

function successUploadLinhaCultivo(json){
    var param = "tipoRequisicao=gerar_linha_cultivo&id_mosaico="+json["id_mosaico"];
    var response = $.ajax({
        async: false,
        url: "AjaxRequest",
        dataType: "json",
        method: "POST",
        data: param
    }).responseText
    console.log("successUploadLinhaCultivo() => Tipo de resposta da requisição ajax", typeof(response));
    var obj;
    try{
        obj = JSON.parse(response);
        console.log(obj);
        alert(obj.message);

        $("#signup-inner").hide();
        $("#resultado_linha_cultivo").show();
        $("#input_qtd_arbole").val(obj["qtd_arbole"]);
        $("#input_qtd_fruto").val(obj["qtd_arbole"] * 975);
        var src_img = `images/img_linha_cultivo/${obj["path_name_linhacultivo"]}.png`;
        $("#img-linha-cultivo").attr("src", src_img);
    } catch(ex){
        console.log("Exception gerada => ", ex.message);
        alert("Operação não realizada, tente novamente.")
    }
}