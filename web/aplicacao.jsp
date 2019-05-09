<%-- 
    Document   : aplicacao
    Author     : guidotti
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="models.Usuario"%>
<% 
    HttpSession sessao = request.getSession();
    Usuario usuario = new Usuario();
    if(sessao.getAttribute("usuario")==null){
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }else{
        usuario =  (Usuario) sessao.getAttribute("usuario");
    }

%>

<!DOCTYPE html>
<html>

    <head>
         <script src="script.js"></script>
        <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
  <!--Import Google Icon Font-->
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
  <!--Import materialize.css-->
  <link type="text/css" rel="stylesheet" href="css/materialize.min.css" media="screen,projection" />
  <link type="text/css" rel="stylesheet" href="css/main.css" />

  <!--Let browser know website is optimized for mobile-->
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <script type='text/javascript' src='https://www.gstatic.com/charts/loader.js'></script>
    <link rel="shortcut icon" href="images/drone.png" >
  <title>OracleDrone</title>
  <style>
      
      .hidden {
          display: none
      }
    
    header, main, footer,.content {
      padding-left: 300px;
    }

    @media only screen and (max-width : 992px) {
      header, main, footer,.content {
        padding-left: 0;
      }
    }
  </style>
</head>

<body>
<nav class="teal">
  <div class="nav wrapper">
    <div class="container">
<a href="" class="brand-logo center">OracleDrone</a>
<a href="" class="button-collapse show-on-large" data-activates="sidenav"><i class="material-icons">menu</i></a>
<ul class="right collection hide-on-small-and-down" style="margin:0px;
      border: 0px solid transparent">
        <li class="collection-item avatar" style="background-color: transparent;min-height: 60px;">
          <a href="" class="tooltipped" data-tooltip="Notifications" data-position="top">
            <i class="material-icons circle white teal-text">notifications_active</i></a>
        </li>
        
      </ul>
    </div>
  </div>
</nav>

<ul class="side-nav fixed" id="sidenav">
  <li>
    <div class="user-view">
<div class="background">
  <img src="img/drone9.jpg" alt="" class="responsive-img">
</div>
<a href="">
  <img src="img/person.png" alt="" class="circle">
</a>
<span class="white-text name"><%=usuario.getName_user()%></span>
<span class="white-text email"><%=usuario.getEmail_user()%></span>
    </div>
  </li>
<li>
  <a href="dashboard"><i class="material-icons teal-text">dashboard</i>Dashboard
  </a>
</li>

<li>
    <a  href="cadastro_rota"> <i class="material-icons teal-text">add_location</i>Cadastrar Rota</a>

 
</li>

<li>
    <a href="select_route_plot"><i class="material-icons teal-text">my_location</i>Plotar Rota
</a>
</li>
<!--    
<li>
    <a href="voo_real"><i class="material-icons teal-text">navigation</i>Acompanhar voo
    </a>
</li>
-->
<li>
    <a href="mosaico"><i class="material-icons teal-text">panorama</i>Mosaico
    </a>
</li>

<li>
    <a href="linhacultivo"><i class="material-icons teal-text">polymer</i>Linhas de cultivo
    </a>
</li>
<div class="divider"></div>
<li>
    <a href="sobre"><i class="material-icons teal-text">info</i>Sobre
    </a>
</li>

<li>
    <a href="logout"><i class="material-icons teal-text">exit_to_app</i>Logout
    </a>
</li>
</ul>


<!--SideNav Finished-->

<div id="content" >
    
        
    
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


  <!--Import jQuery before materialize.js-->
  <script type="text/javascript" src="js/jquery.js"></script>
  
  <script type="text/javascript" src="js/materialize.min.js"></script>
  <script>
    $(document).ready(function () {
      // Custom JS & jQuery here
      $('.button-collapse').sideNav();
    });
  </script>
 <script type='text/javascript'>
  google.charts.load('current', {
    'packages': ['geochart'],
    // Note: you will need to get a mapsApiKey for your project.
    // See: https://developers.google.com/chart/interactive/docs/basic_load_libs#load-settings
    'mapsApiKey': 'colocarsuachave'
  });


 </script>
 
 <script>
 $(document).ready(function(){

$('#content').load('dashboard.jsp');

$('a').click(function(e){
  var page = $(this).attr('href');
  
  $('#content').load(page + '.jsp');
  //$('#map').load(page + '.jsp');
  return false; 
    
});


});     
 </script>

 

</body>

</html>