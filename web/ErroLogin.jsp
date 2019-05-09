<%-- 
    Document   : ErroLogin
    Created on : 11/05/2018, 12:04:50
    Author     : guidotti
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>

<head>
    
    <meta charset="UTF-8">
  <!--Import Google Icon Font-->
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
  <!--Import materialize.css-->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-beta/css/materialize.min.css">
  <link rel="stylesheet" href="css/main.css">
  <script defer src="https://use.fontawesome.com/releases/v5.0.9/js/all.js" integrity="sha384-8iPTk2s/jMVj81dnzb/iFR2sdA7u06vHJyyLlAd4snFpCl/SnyUjRrbdJsw1pGIl"
    crossorigin="anonymous"></script>
  <!--Let browser know website is optimized for mobile-->
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>OracleDrone</title>
</head>

<body id="home" class="scrollspy">
<!-- Navbar web -->
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
            <a href="index.jsp#home">Voltar</a>
          </li>
        </ul>
      </div>
    </div>
  </nav>
</div>
<!-- Navbar mobile -->
<ul class="sidenav" id="mobile-nav">
          <li>
            <a href="index.jsp#home">Voltar</a>
    </li>
</ul>  
<center>
        <h5>É necessário realizar o Login !</h5>
</center>        
        
        
    <!-- Footer -->
  <footer class="section teal darken-2 white-text center">
    <p class="flow-text">OracleDrone &copy; 2019 - Desenvolvido por: Fernanda Pereira Guidotti </p>
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


    
  </script>  
</body>
</html>
    