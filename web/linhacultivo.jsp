<%-- 
    Document   : linhacultivo
    Created on : 18/12/2018, 16:25:30
    Author     : guidotti
--%>
<%@page import="models.Usuario"%>
<%
     HttpSession sessao = request.getSession();
        Usuario usuario = new Usuario();
        if(sessao.getAttribute("usuario")==null){
           //request.getRequestDispatcher("index.jsp").forward(request, response);
            System.err.println("DEU PT bem aqui!!!!!");
        }else{
            usuario =  (Usuario) sessao.getAttribute("usuario");
        }
        
        int id_user   =  usuario.getId_user();
%>

<%@page import="models.Mosaico"%>
<%@page import="java.util.List"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page language="java" import="java.io.*,java.sql.*,javax.sql.*,javax.naming.*" %> 


<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
 <!--Import Google Icon Font-->
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
  <!--Import materialize.css-->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-beta/css/materialize.min.css">
  <link rel="stylesheet" href="css/main.css">
  <script defer src="https://use.fontawesome.com/releases/v5.0.9/js/all.js" integrity="sha384-8iPTk2s/jMVj81dnzb/iFR2sdA7u06vHJyyLlAd4snFpCl/SnyUjRrbdJsw1pGIl"
    crossorigin="anonymous"></script>
  <!--Let browser know website is optimized for mobile-->
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />

     <link rel="shortcut icon" href="images/drone.png">  
   <title>Linha de cultivo</title>

	<!---------- CSS ------------>
	<link rel="stylesheet" type="text/css" href="./css/style.css">

</head>

 <body id="home" class="scrollspy">
    <div id="signup-form">
        
        
        <div id="signup-inner">
        
        	<div class="clearfix" id="header">
        	
        		<img id="signup-icon" src="./images/drone.png" alt="" />
        
                <h1>Linhas de cultivo</h1>
            
            </div>
                            
             <form action="AjaxRequest" method="post" id="selecionar_linha_cultivo">
            	   <input type="hidden" id="linhacultivo_tipo_requisicao" name="tipoRequisicao" value="gerar_linha_cultivo">
                    <p>Por favor selecione a opção desejada.</p>  
                    <p>
                      <label>
                        <input name="group1" id="radiobtnupload" type="radio" />
                        <span>Upload do Mosaico</span>
                      </label>
                    </p>
                    <p>
                      <label>
                        <input name="group1" id="radiobtnselectmosaico" type="radio" checked/>
                        <span>Busca de Mosaico</span>
                      </label>
                    </p>
                    <p>Por favor selecione o mosaico.</p>
                       <div class="input-field col s12">
                <p>
                    <ul id="ul-seleciona-mosaico">
                       <li> <select class="browser-default" name ="sltnomemosaico" id ="slc_mosaico" data-user-id="<%=id_user%>">

                      
                               <option value="" disabled selected>Selecione a Imagem</option>
                               <%
                                   Mosaico mosaico = new Mosaico();
                                   List<Mosaico> mosaicos = mosaico.visualizar(id_user);
                                   for (Mosaico m : mosaicos) {
                               %>                               
                               <option value=<%=m.getId_mosaico()%>><%=m.getName_mosaico()%></option>
                               <!--
                                A linha acima esta como a de baixo, alterei o value
                                <option value=<%=m.getId_mosaico()%>><%=m.getName_mosaico()%></option>
                               -->
                               
                               <%}                             
                               
                               %>
                                        
  
                           </select></li>
                   </ul>
                   <ul id="ul-upload-mosaico">
                       <input id="path_linhacultivo" type="file" name="frm_up_file">
                    </ul> 
                </p>
                </div>
                <p>
                  <button data-form-parent="btn-select-linha-cultivo" class="btn-form-ps submit" type="submit">Ver Linhas de Cultivo</button>
                </p>  
            </form>
            <div class="progress">
                <div class="determinate progress_bar"></div>
              </div>
            </div>
            <div class="row" id="resultado_linha_cultivo">
              <form class="col s12">
                  <div class="input-field col s6">
                    <input placeholder="" id="input_qtd_arbole" type="text" disabled class="validate">
                    <label for="qtd_arbole">Quantidade de Árvores</label>
                  </div>          
                  <div class="input-field col s6">
                    <input placeholder="" id="input_qtd_fruto" type="text" disabled class="validate">
                    <label for="qtd_fruto">Previsão de Colheita</label>
                  </div> 
                     
                  <div>
                      <img id="img-linha-cultivo" src="" class="responsive-img" alt="" />
                  </div> 
              </form>
            </div>      
        
        </div> 


  <!--JavaScript at end of body for optimized loading-->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-beta/js/materialize.min.js"></script>

  <script>
    // Sidenav
    const sideNav = document.querySelector('.sidenav');
    M.Sidenav.init(sideNav, {});

    // ScrollSpy
    const ss = document.querySelectorAll('.scrollspy');
    M.ScrollSpy.init(ss, {});


    // Material Boxed
    const mb = document.querySelectorAll('.materialboxed');
    M.Materialbox.init(mb, {}); 
  </script> 


  <script src="./js/jquery.form.js"></script> 
  <script src="./js/request_main.js"> </script>

  <script type="text/javascript">
    $(function(){
      var form = $("#selecionar_linha_cultivo");
      //console.log(form)
      var radio_btn = document.getElementById("radiobtnupload");
      $("#path_linhacultivo").hide();
      form.change(function(event){
          //console.log(event.target.id);
          if(event.target.id === "radiobtnupload"){
              $("#linhacultivo_tipo_requisicao").val("upload_linha_cultivo");
              $("#ul-seleciona-mosaico").hide();
              $("#path_linhacultivo").show();
              $(this).attr("enctype","multipart/form-data");
          } else if(event.target.id === "radiobtnselectmosaico"){
              $("#linhacultivo_tipo_requisicao").val("gerar_linha_cultivo");
              $("#ul-seleciona-mosaico").show();
              $("#path_linhacultivo").hide();
              $(this).removeAttr("enctype");
          }
      });
      $("#resultado_linha_cultivo").hide(); 
    });
    
  </script>
</body>
</html>
