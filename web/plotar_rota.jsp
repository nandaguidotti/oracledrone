<%-- 
    Document   : plotar_rota
    Author     : guidotti
--%>

<%@page import="models.Usuario"%>
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
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="conexao.MysqlDB"%>
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

 
   <title>Sistema Log UAV - Página de Upload de Imagens</title>

	<!---------- CSS ------------>
	<link rel="stylesheet" type="text/css" href="./css/style.css">
            
    <style>
      #map {
        height: 100%;
      }
      html, body {
        height: 100%;
        margin: 0;
        padding: 0;
      }
    </style>
  </head>
    
  
    
    
 <body id="home" class="scrollspy">
     
<div class="content">
    <div class="row">    
        <div id="map">     
    
            <%

    MysqlDB banco = new MysqlDB();               
    banco.connect();
    PreparedStatement ps = null;
    ResultSet rs = null;
    String sql = null;  
    
     String latitude = new String("");
     String longitude = new String("");
     
    List<String> listaLong = new ArrayList<String>();  
    List<String> listaLat = new ArrayList<String>();  
    
      String route_id;// = Integer.toString(id_user);
      route_id =  request.getParameter("sltnomepais");
    
    response.setContentType("text/html");       
    
    
    try {
          
                   
       sql = "SELECT `lat`,`lng` FROM `logidrone` WHERE `routeidrone_user_id_user` = " + id_user + " and `routeidrone_id_routeidrone` =" + route_id;
              
        
        
        ps = banco.conn.prepareStatement(sql);        
        rs = ps.executeQuery(sql);
       
       
        while(rs.next()){
                    
            latitude = rs.getString(1);
            longitude = rs.getString(2);                       
            
            listaLat.add(latitude);
            listaLong.add(longitude);
        } // Fim do Laço da Consulta
       
    }catch(Exception e){
       out.println("Exception is ;"+e);
    }

    out.println("<script>");            
  
 
out.println("function initMap() {");
        out.println("var map = new google.maps.Map(document.getElementById('map'), {");
          out.println("zoom: 18,");
          // adapatção para funcionar com rotas de qualquer pais
          out.println("center: {lat: "+listaLat.get(0)+", lng: "+listaLong.get(0)+"},");
          out.println("mapTypeId: 'satellite'");
        out.println("});");


    out.println("pontosLat = [];");
     out.println("pontosLong = [];");
    out.println("var locations = [];");

 for (int i = 0; i < listaLat.size();i++){
     
     out.println("pontosLat["+i+"]=" + listaLat.get(i)+ ";");
     out.println("pontosLong["+i+"]=" + listaLong.get(i)+ ";");    
 
	  
 } 
 
 
   
   out.println("locations = [");

     for (int i = 0; i < listaLat.size();i++){ 
         
        if( i == listaLat.size()-1){  
            out.println("{lat: " + listaLat.get(i)+", lng: "+ listaLong.get(i)+"},");
            out.println("{lat: " + listaLat.get(i)+", lng: "+ listaLong.get(i)+"},");
            out.println("{lat: " + listaLat.get(i)+", lng: "+ listaLong.get(i)+"},");
            out.println("{lat: " + listaLat.get(i)+", lng: "+ listaLong.get(i)+"}");
        }else{
            out.println("{lat: " + listaLat.get(i)+", lng: "+ listaLong.get(i)+"},");
            out.println("{lat: " + listaLat.get(i)+", lng: "+ listaLong.get(i)+"},");
            out.println("{lat: " + listaLat.get(i)+", lng: "+ listaLong.get(i)+"},");
            out.println("{lat: " + listaLat.get(i)+", lng: "+ listaLong.get(i)+"},");       
        
        }
        
     }
   out.println("];");
   
   
          out.println("var flightPath = new google.maps.Polyline({");
          out.println("path: locations,");
          out.println("geodesic: true,");
          out.println("strokeColor: '#FF0000',");
          out.println("strokeOpacity: 0.5,");
          out.println("strokeWeight: 3");
        out.println("});");

    out.println("flightPath.setMap(map);");
    
    out.println("}");

    out.println("</script>"); 
    
    out.println("<script async defer "
            + "src=\"https://maps.googleapis.com/maps/api/js?key=suachave>");               
    out.println("</script>");

   
%>       

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
