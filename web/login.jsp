<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%-- 
    Document   : login
    Author     : guidotti
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String aviso= "";
    if(request.getAttribute("status")!=null){
        aviso = (String) request.getAttribute("status");
    }else{
        aviso = "";
    }
%>
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
   <title>OracleDrone login</title>

	<!---------- CSS ------------>
	<link rel="stylesheet" type="text/css" href="./css/style.css">

</head>

<body id="home" class="scrollspy">
<!-- Navbar -->
<div class="navbar-fixed">
  <nav class="teal">
    <div class="container">
      <div class="nav-wrapper">
        <a href="#" class="brand-logo">OracleDrone</a>
        <a href="#" data-target="mobile-nav" class="sidenav-trigger">
          <i class="material-icons">menu</i>
        </a>
        <ul class="right hide-on-med-and-down">
          <li>
            <a href="index.jsp#home">Home</a>
          </li>
          <li>
            <a href="index.jsp#fotos">Galeria de Fotos</a>
          </li>
          <li>
            <a href="index.jsp#contato">Contato</a>
          </li>
          <li>
            <a href="login.jsp">Login</a>
          </li>
        </ul>
      </div>
    </div>
  </nav>
</div>
<ul class="sidenav" id="mobile-nav">
  <li>
    <a href="index.jsp#home">Home</a>
  </li>
  <li>
    <a href="index.jspindex.jsp#fotos">Galeria de Fotos</a>
  </li>
  <li>
    <a href="index.jsp#contato">Contato</a>
  </li>
  <li>
      <a href="login.jsp">Login</a>
    </li>
</ul>
        

    <!--BEGIN #signup-form -->
    <div id="signup-form">
        
        <!--BEGIN #subscribe-inner -->
        <div id="signup-inner">
        
        	<div class="clearfix" id="header">
        	
        		<img id="signup-icon" src="./images/drone.png" alt="" />
        
                <h1>Bem Vindo!</h1>

            
            </div>
            <p>Para entrar no sistema é necessário informar o Login(e-mail) e Senha.</p>

            
           <!-- <form id="send" action="logar.jsp" method="POST">-->
            <form action="AutenticaLogin" method="post">
            	   <input type="hidden" name="tipoRequisicao" value="Login">
                <p>

                <label for="name">E-mail:</label>
                <input id="name" type="text" name="frm_email_user"  />
                </p>
                
                <p>
                <label for="company">Senha:</label>
                <input id="company" type="password" name="frm_pass_user"  />
                </p>
               
                <p>
                  <button class="submit" type="submit">Entrar</button>
                </p>
                
                <p>
                  <a href="cadastroUser.jsp" ><button class="submit" type="button">Cadastrar Usuário</button></a>
                </p> 
                       
            </form>
            
            </div>
        
        <!--END #signup-inner -->
        </div>
        
    <!--END #signup-form -->   
    </div>

    <footer>
<div class="container">
           <div class="row">
                <div class="col s10">
© <script type="text/javascript">document.write(new Date().getFullYear());</script>-OracleDrone, All rights reserved - Hosted by <a href="http://infra.lasdpc.icmc.usp.br/">LaSDPC</a>
              <a class="grey-text text-darken-1 right">Design and Developed by Fernanda Pereira Guidotti</a>
                </div>

                </div>
            </div>
   </footer> 
   
    <% if(aviso != ""){%>
    <script>
      window.onload = function(e){ 
        alert("<%=aviso%>");
      }      
    </script>
    <%}%>

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


