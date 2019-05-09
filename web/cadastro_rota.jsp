<%-- 
    Document   : cadastro_rota
    Author     : guidotti
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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

   <title>Rotas</title>

	<!---------- CSS ------------>
	<link rel="stylesheet" type="text/css" href="./css/style.css">

</head>
 <body id="home" class="scrollspy">
     
    <div id="signup-form">
        
        
        <div id="signup-inner">
        
        	<div class="clearfix" id="header">
        	
        		<img id="signup-icon" src="./images/drone.png" alt="" />
        
                <h1>Rotas</h1>

            
            </div>
            <p>Por favor escolha um log por vez.</p>

            
            <form id="cadastrar_rota" action="AjaxRequest" method="post" enctype="multipart/form-data">
            	   <input type="hidden" name="tipoRequisicao" id="tipoRequisicao" value="cadastrar_rota" />   

                <p>
                <label for="name">Nome da Rota:</label>
                <input id="txt_name" type="text" name="frm_name_routeidrone"  />
                </p>
                     
                <p>
                <label for="name">Arquivo de Log:</label>
                <input type="file" name="frm_up_file" id="frm_up_file">
                </p>
                                
                <p>
		<label for="company">Clique no Botão Enviar para fazer Upload:</label>				  
                <button data-form-parent="btn-cadastrar-rota" type="submit" class="btn-form-ps submit">Enviar</button>
                </p>
                
            </form>            
            <div class="progress">
                <div class="determinate progress_bar"></div>
              </div>
            </div>        
        
        </div>       
        


    </div>
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="materialize/js/materialize.min.js"></script>
 
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



  <script type="text/javascript">

  </script>


  <script src="./js/jquery.form.js"></script> 
  <script src="./js/request_main.js"> </script>
</body>
</html>

