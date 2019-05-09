<%-- 
    Document   : cadastroUser
    Author     : guidotti
--%>

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
   <title>Cadastro de usuário</title>

	<!---------- CSS ------------>
	<link rel="stylesheet" type="text/css" href="./css/style.css">

</head> 

 <body id="home" class="scrollspy">
<!-- Navbar web-->
<div class="navbar-fixed">
  <nav class="teal">
    <div class="container">
      <div class="nav-wrapper">
        <a href="./" class="brand-logo">OracleDrone</a>
        <a href="./" data-target="mobile-nav" class="sidenav-trigger">
          <i class="material-icons">menu</i>
        </a>
        <ul class="right hide-on-med-and-down">
          <li>
            <a href="index.jsp">Home</a>
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
<!-- Navbar mobile-->
<ul class="sidenav" id="mobile-nav">
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
      <a href="login.jsp#logar">Login</a>
    </li>
</ul>  

	   
	   <div id="signup-form">     
        <!--BEGIN #subscribe-inner -->
        <div id="signup-inner">        
        	<div class="clearfix" id="header">        	
        		<img id="signup-icon" src="./images/drone.png" alt="" />        
                <h1>Cadastro de Usuários</h1>            
            </div>
            <p>Preencha com seus dados</p>  
	
	<form id="cadastro-user" class="container" action="AutenticaCadastroUser" method="post">
            
  <input type="hidden" name="tipoRequisicao" id="tipoRequisicao" value="cadastro_user">
            
		Nome: <input type="text" value="" name="name_user" required />
		<div class="row">
			<div class="input-fild col s12">
				Email: <input type="text" value="" name="email_user" required />
			</div>
			<div class="input-fild col s12">
				Nascimento: <input type="text" value="" name="year_user" required />
			</div>
			<div class="input-fild col s12">	
				Senha: <input type="password" value="" name="pass_user" required />
			</div>
			<div class="input-fild col s12">
				País: <input type="text" value="" name="country_user" required />
			</div>
		</div>
	
		<button class="waves-effect waves-light btn btn-form-ps" data-form-parent="btn-cadastrar-user" type="submit"> Salvar</button>

		
	</form>
        </div>
        </div>
 

	<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="materialize/js/materialize.min.js"></script>

   <!-- Footer -->
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
        