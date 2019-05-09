<%-- 
    Document   : index
    Author     : guidotti
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
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
      <link rel="shortcut icon" href="images/drone.png" >  
  <title>OracleDrone</title>
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
            <a href="index.jsp">Home</a>
          </li>
          <li>
              <a href="#fotos">Galeria de Fotos</a>
          </li>
          <li>
            <a href="#contato">Contato</a>
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
    <a href="index.jsp">Home</a>
  </li>
  <li>
    <a href="#fotos">Galeria de Fotos</a>
  </li>
  <li>
    <a href="#contato">Contato</a>
  </li>
  <li>
      <a href="login.jsp">Login</a>
    </li>
</ul>

  <section class="video">
     <video class="responsive-video" align-content:center autoplay loop muted allowfullscreen >
       <source src="img/voocotove.mp4" type="video/mp4" >
    </video>
  </section>   
      

<style>
    
video {
    position: absolute;
    left: 0;
    top: 0px;
    width: 100%;
    height: 480px;
    z-index: -100;
}

</style>

<br><br><br><br><br><br><br><br><br><br><br>

  <!-- Section: Icon Boxes -->
  <section class="section-popular lighten-4 scrollspy center">
      <div class="container">
        <div class="row">
          <div class="col s12 m3">
            <div class="card-panel">
              <i class="material-icons medium teal-text">room</i>
              <h5>Rotas</h5>
              <p>Faça planos de voos e visualize sua rota em tempo real</p>
            </div>
          </div>
          <div class="col s12 m3">
            <div class="card-panel">
              <i class="material-icons medium teal-text">devices</i>
              <h5>Dispositivos</h5>
              <p>Compativel com seu Smartphone, Tablet e Desktop</p>
            </div>
          </div>
          <div class="col s12 m3">
            <div class="card-panel">
              <i class="material-icons medium teal-text"> network_cell network_wifi </i>
              <h5>Comunicação</h5>
              <p>Seja no wi-fi ou 4G, você sempre conectado</p>
            </div>
          </div>
          <div class="col s12 m3">
              <div class="card-panel">
                <i class="material-icons medium teal-text">airplanemode_active</i>
                <h5>IoT</h5>
                <p>Seus drones sempre em ação, em um só lugar</p>
              </div>
            </div>          
        </div>
      </div>
    </section>
  
<script type="text/javascript" src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script></section>
    
  <!-- Section: Popular Places -->
  <section id="mineracao" class="section section-popular grey lighten-4 scrollspy">
      <div class="container">
        <div class="row">
          <h4 class="center">
            <span class="teal-text">Cidades </span> em foco </h4>
          <div class="col s12 m4">
            <div class="card">
              <div class="card-image">                  
                <a href="https://www.amazon.com/b?node=8037720011">
                <img src="img/prime-air_02.jpg" alt="" height="200px">
                </a>
                <span class="card-title">Inglaterra</span>
              </div>
              <div class="card-content">
                Amazon Prime Air - Sistema de entregas com drone.
              </div>
            </div>
          </div>
          <div class="col s12 m4">
            <div class="card">
              <div class="card-image">
                  <a href="http://g1.globo.com/rio-de-janeiro/noticia/2015/12/bombeiros-vao-usar-drone-para-resgates-em-praias-do-rj-no-verao.html">
                  <img src="img/bombeiro.jpg" alt="" height="200px">            
                  </a>
                  <span class="card-title">Rio de Janeiro</span>
               </div>
              <div class="card-content">
                Bombeiros usam drone para resgates no verão.
              </div>
            </div>
          </div>
          <div class="col s12 m4">
            <div class="card">
              <div class="card-image">
                 <a href="https://www.washingtonpost.com/world/2019/02/23/kalashnikov-assault-rifle-changed-world-now-theres-kalashnikov-kamikaze-drone/?fbclid=IwAR1dADiKug9DYiECZf6cYxNY---FOybJurfQFFj2k-9iZD0bAkCKCdAdAe8&noredirect=on&utm_term=.6e8c0eddc133">
                <img src="img/russia.jpg" alt="" height="200px">
                <span class="card-title">Abu Dhabi</span>
                 </a>
              </div>
              <div class="card-content">
                Drone "suicida" auxiliará a guerra.
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

  <!-- Section: Follow -->
  <section class="section section-follow teal darken-2 white-text center">
      <div class="container">
        <div class="row">
          <div class="col s12">
            <h4>Siga OracleDrone</h4>
            <p>Siga-nos nas redes sociais</p>
            <a href="#" class="white-text">
              <i class="fab fa-facebook fa-4x"></i>
            </a>
            <a href="#" class="white-text">
              <i class="fab fa-twitter fa-4x"></i>
            </a>
            <a href="#" class="white-text">
              <i class="fab fa-linkedin fa-4x"></i>
            </a>
            <a href="#" class="white-text">
              <i class="fab fa-google-plus fa-4x"></i>
            </a>
            <a href="#" class="white-text">
              <i class="fab fa-pinterest fa-4x"></i>
            </a>
          </div>
        </div>
      </div>
    </section>  

    <!-- Section: Gallery -->
  <section id="fotos" class="section section-gallery scrollspy">
      <div class="container">
        <h4 class="center">
          <span class="teal-text">Galeria</span> de Fotos
        </h4>
        <div class="row">
          <div class="col s12 m3">
            <img src="img/d12.png" alt="" class="materialboxed responsive-img">
          </div>
          <div class="col s12 m3">
            <img src="img/d11.png" alt="" class="materialboxed responsive-img">
          </div>
          <div class="col s12 m3">
            <img src="img/d10.png" alt="" class="materialboxed responsive-img">
          </div>
          <div class="col s12 m3">
              <img src="img/d7.jpg" alt="" class="materialboxed responsive-img ">
          </div>
        </div>
  
        <div class="row">
          <div class="col s12 m3">
            <img src="img/d8.jpg" alt="" class="materialboxed responsive-img">
          </div>
          <div class="col s12 m3">
            <img src="img/d9.jpg" alt="" class="materialboxed responsive-img">
          </div>
          <div class="col s12 m3">
            <img src="img/d6.jpg" alt="" class="materialboxed responsive-img">
          </div>
          <div class="col s12 m3">
            <img src="img/d5.png" alt="" class="materialboxed responsive-img">
          </div>
        </div>
  
        <div class="row">
          <div class="col s12 m3">
            <img src="img/d4.jpg" alt="" class="materialboxed responsive-img">
          </div>
          <div class="col s12 m3">
            <img src="img/d3.png" alt="" class="materialboxed responsive-img">
          </div>
          <div class="col s12 m3">
            <img src="img/d2.jpg" alt="" class="materialboxed responsive-img">
          </div>
          <div class="col s12 m3">
            <img src="img/d1.jpg" alt="" class="materialboxed responsive-img">
          </div>
        </div>
      </div>
    </section>


<!-- Section: Contact -->
<section id="contato" class="section section-contact scrollspy">
    <div class="container">
      <div class="row">
        <div class="col s12 m6">
          <div class="card-panel teal white-text center">
            <a href="mailto:guidotti@usp.br"><i class="material-icons" alt="guidotti@usp.br">email</i></a>
            <h5>Entre em contato conosco</h5>
            <p>Se quiser saber mais sobre nossos serviços, entre em contato conosco.</p>
          </div>
          <ul class="collection with-header">
            <li class="collection-header">
                <h6><span class="teal-text">Grupo de Sistemas Distribuídos e Programação Concorrente &</span> <br>
                   Sistemas Embarcados, Evoluídos </h6>
            </li>
            <p class="collection-item">INSTITUTO DE CIÊNCIAS MATEMÁTICAS E DE COMPUTAÇÃO </p>
            <p class="collection-item">Avenida Trabalhador São-carlense, 400 - Centro </p>
             <p class="collection-item">CEP: 13566-590 - São Carlos - SP </p>
          </ul>
        </div>
        <div class="col s12 m6">
          <div class="card-panel"> 

              <h5>Para informações nos mande uma mensagem.</h5>
              
<form name="mail" action="mailto:guidotti@usp.br" method="post" enctype="text/plain" onSubmit="return isMailReady(this);">
<input type="hidden" name="info">
<table border=0 cellpadding=5 cellspacing=0>
	<tr>
	<td>
		Nome
		<input type="text" name="fullname" onFocus="getValue(this)" onBlur="setValue(this)">
	</td>
	<td>
		E-mail
		<input type="text" name="email" onFocus="getValue(this)" onBlur="setValue(this)">
	</td>
	</tr>
        <tr> <br>
	<td colspan="2">
		Mensagem
		<textarea rows="8" cols="38" name="message"></textarea>
	</td>
	</tr>
	<tr>
	<td colspan="2">
		<input type="submit" value="Enviar" class="btn">
		<input type="reset" value="Cancelar" class="btn">
	</td>
	</tr>
</table>
</form>
            
          
<script language="JavaScript">
<!--
function getCookie(name){
	var cname=name + "=";
	var dc=document.cookie;
	if (dc.length > 0){
		begin=dc.indexOf(cname);
		if (begin != -1){
			begin += cname.length;
			end=dc.indexOf(";", begin);
			if (end == -1) end=dc.length;
			return unescape(dc.substring(begin, end));
		}
	}
	return null;
}
 
function setCookie(name, value){
	var now=new Date();
	var then=new Date(now.getTime() + 31536000000);
	document.cookie=name + "=" + escape(value) + "; expires=" + then.toGMTString() + "; path=/";
}
 
function getInfo(form){
	form.info.value="Browser Information: " + navigator.userAgent;
}
 
function getValue(element){
	var value=getCookie(element.name);
	if (value != null) element.value=value;
}
 
function setValue(element){
	setCookie(element.name, element.value);
}
 
function fixElement(element, message){
	alert(message);
	element.focus();
}
 
function isMailReady(form){
	var passed=false;
	if (form.fullname.value == ""){
	fixElement(form.fullname, "Insira seu nome.");
	}
	else if (form.email.value.indexOf("@") == -1 || form.email.value.indexOf(".") == -1){
		fixElement(form.email, "Insira um e-mail válido.");
	}
	else if (form.message.value == ""){
		fixElement(form.message, "Insira uma mensagem.");
	}
	else{
		getInfo(form);
		passed=true;
	}
	return passed;
}
// End -->
</script>


                     </div>
        </div>
      </div>
        <div class="img center">
             <a href="http://www.icmc.usp.br/"><img src="img/icmc.png" height="50" width="150"></a>             
             <a href="https://minas.medellin.unal.edu.co/"><img src="img/escudoUnal.png" height="50" width="150"></a>  
             <a href="http://lasdpc.icmc.usp.br/"><img src="img/lasdpc-logo1.png" height="50" width="150"></a>  
             <a href="http://lcr.icmc.usp.br/web/"><img src="img/lcr5.png" height="50" width="150"></a>            
             <a href="http://www.cemeai.icmc.usp.br/"><img src="img/cemeai.png" height="50" width="150"></a> 
        </div>     
    </div>
  </section>

   <!-- Footer -->
  <footer class="section teal darken-2 white-text center">
      <div class="footer-copyright">
          <div class="container">
              <span>
                   © <script type="text/javascript">document.write(new Date().getFullYear());</script>-OracleDrone, All rights reserved - Hosted by <a href="http://infra.lasdpc.icmc.usp.br/">LaSDPC</a>
              </span>
              <span class="right hide-on-small-only">
                  Design and Developed by Fernanda Pereira Guidotti                
              </span>           
          </div>         
      </div>
  </footer>

  <!--JavaScript at end of body for optimized loading-->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-beta/js/materialize.min.js"></script>

  <script>
    // Sidenav
    const sideNav = document.querySelector('.sidenav');
    M.Sidenav.init(sideNav, {});

    // Slider
    const slider = document.querySelector('.slider');
    M.Slider.init(slider, {
      indicators: false,
      height: 500,
      transition: 500,
      interval: 6000
    });

    // Autocomplete
    const ac = document.querySelector('.autocomplete');
    M.Autocomplete.init(ac, {
      data: {
        "São Carlos Brasil": null,
        "São Paulo Brasil": null,
        "Rio de Janeiro Brasil": null,
        " Medellin Colombia": null,
        "California": null,
        "Jamaica": null,
        "Europa": null,
      }
    });

    // ScrollSpy
    const ss = document.querySelectorAll('.scrollspy');
    M.ScrollSpy.init(ss, {});


    // Material Boxed
    const mb = document.querySelectorAll('.materialboxed');
    M.Materialbox.init(mb, {});
  </script>  
</body>
</html>
