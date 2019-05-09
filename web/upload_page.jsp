<%-- 
    Document   : upload_page
    Author     : guidotti
--%>

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

 
   <title>Sistema Log UAV - Página de Upload de Logs</title>

	<!---------- CSS ------------>
	<link rel="stylesheet" type="text/css" href="./css/style.css">

</head>

 <body id="home" class="scrollspy">
    
    <div id="signup-form">
        
        
        <div id="signup-inner">
        
        	<div class="clearfix" id="header">
        	
        		<img id="signup-icon" src="./images/signup.png" alt="" />
        
                <h1>Rotas</h1>

            
            </div>
            <p>Por favor escolha um log por vez.</p>

            
            <form id="send" action="ProcessaUploadFile" enctype="multipart/form-data" method="POST">
            	                
                     <input type="hidden" name="tipoRequisicao" value="Upload"></input>
               
                     
                <p>
                <label for="name">Arquivo de Log:</label>
                <input type="file" name="frm_up_file">
                </p>
                                
                <p>
		<label for="company">Clique no Botão Enviar para fazer Upload:</label>				  
                <button id="submit" type="submit">Enviar</button>
                </p>
                
            </form>            

            </div>        
        
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
</body>
</html>
