<%-- 
    Document   : select_rout_plot
    Author     : guidotti
--%>

<%@page import="models.Usuario"%>

<%
     HttpSession sessao = request.getSession();
        Usuario usuario = new Usuario();
        if(sessao.getAttribute("usuario")==null){
            System.err.println("DEU PT bem aqui!!!!!");
        }else{
            usuario =  (Usuario) sessao.getAttribute("usuario");
        }
        
        int id_user   =  usuario.getId_user();
%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="conexao.MysqlDB"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page language="java" import="java.io.*,java.sql.*,javax.sql.*,javax.naming.*" %> 

<%@page import="java.util.List"%>
<%@page import="models.Rota"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">




<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
 <!--Import Google Icon Font-->
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
  
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-beta/css/materialize.css">

      
      <!--Import materialize.css     
-->

 
  <link rel="stylesheet" href="css/main.css">
  <script defer src="https://use.fontawesome.com/releases/v5.0.9/js/all.js" integrity="sha384-8iPTk2s/jMVj81dnzb/iFR2sdA7u06vHJyyLlAd4snFpCl/SnyUjRrbdJsw1pGIl"
    crossorigin="anonymous"></script>
  <!--Let browser know website is optimized for mobile-->
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <!--<script src = "jquery-1.7.1.js"></script>
  <script src = "ajax.js"></script>-->
  
<title>OracleDrone</title>

	<!---------- CSS ------------>
	<link rel="stylesheet" type="text/css" href="./css/style.css">
        
</head>
<body id="home" class="scrollspy">

    <!--BEGIN #signup-form -->
    <div id="signup-form">
        
        <!--BEGIN #subscribe-inner -->
        <div id="signup-inner">
        
            <div class="clearfix" id="header">        	
        	<img id="signup-icon" src="./images/drone.png" alt="" />        
                <h1>Selecione a Rota que deseja Plotar</h1>            
            </div>
         
            <form action="plotar_rota.jsp" target="_blank" id="select_route_plot" method="post">
            	   <input type="hidden" name="tipoRequisicao" value="plotar_rota">
               
                       <div class="input-field col s12">
                <p>
                   
                   <ul>

                       <li><select class="browser-default" name ="sltnomepais" id ="nomerota">
                               <option value="" disabled selected>Seleccione o Nome da Rota</option>
                               <%
                                   Rota pd = new Rota();
                                   List<Rota> lp = pd.visualizar(Integer.toString(id_user));
                                   for (Rota p : lp) {
                               %>                               
                               <option value=<%=p.getId_routeidrone()%>><%=p.getName_routeidrone()%></option>
                               
                               <%}                             
                               
                               %>
                           </select></li>

                   </ul>
                    
                </p>
                
                </div>
                
                <p>
                  <button data-form-parent="btn-select-route-plot" class="btn-form-ps submit" type="submit">Plotar Rota</button>
                </p> 
                       
            </form>
            
            </div>
        
        <!--END #signup-inner -->
        </div>
        
    <!--END #signup-form -->   
    </div>
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.js"></script>


	<script type="text/javascript" src="materialize/js/materialize.js"></script>


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
    
    $(document).ready(function() {
    $('select').material_select();
  });
         
  </script>
</body>
</html>


