<%-- 
    Document   : mosaico
    Author     : guidotti
--%>

<%@page import="models.Usuario"%>
<%@page import="models.Mosaico"%>

<%
     HttpSession sessao = request.getSession();
        Usuario usuario = new Usuario();
        if(sessao.getAttribute("usuario")==null){

        }else{
            usuario =  (Usuario) sessao.getAttribute("usuario");
        }
        
        int id_user   =  usuario.getId_user();
%>

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

  <link rel="shortcut icon" href="images/drone.png" >
   <title>Mosaico</title>

	<!---------- CSS ------------>
	<link rel="stylesheet" type="text/css" href="./css/style.css">

</head>

 <body id="home" class="scrollspy">

    
    <div id="signup-form">
        
        
        <div id="signup-inner">
        
        	<div class="clearfix" id="header">
        	
        		<img id="signup-icon" src="./images/drone.png" alt="" />
        
                <h1>Mosaico das imagens</h1>

            
            </div>            
             <form id="cadastro-mosaico" action="AjaxRequest" enctype="multipart/form-data" method="post"> 
            	  <input type="hidden" name="tipoRequisicao" id="mosaico_tipo_requisicao" value="visualizar-mosaico">
                <p>Por favor selecione a opção desejada.</p>  
                  <p>
                    <label>
                      <input name="group1" id="radiobtnupload" type="radio" />
                      <span>Upload  Mosaico</span>
                    </label>
                  </p>
                  <p>
                    <label>
                      <input name="group1" id="radiobtnselectmosaico" type="radio" checked/>
                      <span>Visualizar Mosaico</span>
                    </label>
                </p>
                <div class="input-field col s12">
                <p>
                    <ul id="ul-seleciona-mosaico">
                       <li><select class="browser-default" name ="sltnomemosaico" id ="nome_mosaico" data-user-id="<%=id_user%>">
                               <option value="" disabled selected>Selecione a Imagem</option>
                               <%
                                   Mosaico mosaico = new Mosaico();
                                   List<Mosaico> mosaicos = mosaico.visualizar(id_user);
                                   for (Mosaico m : mosaicos) {
                               %>                               
                               <option value=<%=m.getName_mosaico()%>><%=m.getName_mosaico()%></option>
                               <%}                             
                               
                               %>
                                        
  
                           </select></li>
                   </ul>
                </p>
                </div>
                <div class="input-field col s12" id="div-upload-mosaico">
                <p>
                <label for="name">Nome do Mosaico:</label>
                <input id="txt_name" type="text" name="frm_name_mosaico"  />
                </p>
                
                <p>
                <input id="path_mosaico" type="file" name="frm_up_file">
                </p>  
                                                            
                </div>
                       
                <p>
                  <button data-form-parent="btn-cadastrar-mosaico" id="btn-form-mosaico" type="submit" class="btn-form-ps submit">Gerar Mosaico</button>
                </p>  
            </form>
              <div class="progress">
                <div class="determinate progress_bar"></div>
              </div>
            </div> 
              <div class="row" id="resultado_mosaico">                       
                <div>
                  <img id="img-mosaico" src="" class="responsive-img" style=" " alt="" />


                </div> 
              </div>
            </div>        
        
        </div>       

    </div>


  <!--JavaScript at end of body for optimized loading-->

  <script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.js"></script>
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
      var form = $("#cadastro-mosaico");
      //console.log(form)
      var radio_btn = document.getElementById("radiobtnupload");
      $("#div-upload-mosaico").hide();
      $("#btn-form-mosaico").html("Visualizar Mosaico");
      form.change(function(event){
          //console.log(event.target.id);
          if(event.target.id === "radiobtnupload"){
              $("#mosaico_tipo_requisicao").val("cadastro-mosaico");
              $("#ul-seleciona-mosaico").hide();
              $("#div-upload-mosaico").show();
              $("#btn-form-mosaico").html("Gerar Mosaico");
              $(this).attr("enctype","multipart/form-data");
          } else if(event.target.id === "radiobtnselectmosaico"){
              $("#mosaico_tipo_requisicao").val("visualizar-mosaico");
              $("#ul-seleciona-mosaico").show();
              $("#div-upload-mosaico").hide();
              $("#btn-form-mosaico").html("Visualizar Mosaico");
              $(this).removeAttr("enctype");
          }
      });
      $("#resultado_mosaico").hide(); 
    });
  </script>
</body>
</html>