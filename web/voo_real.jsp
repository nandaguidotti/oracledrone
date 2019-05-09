<%-- 
    Document   : voo_real
    Author     : guidotti
--%>

<%@page import="models.Usuario"%>
<%@page import="uav.od.*"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="conexao.MysqlDB"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
   <link rel="shortcut icon" href="images/drone.png">  
       <title>Voo em tempo Real</title>

	<!---------- CSS ------------>
	<link rel="stylesheet" type="text/css" href="./css/style.css">



</head>


 <body id="home" class="scrollspy">
      

     


<%
    
   
    
     HttpSession sessao = request.getSession();
        Usuario usuario = new Usuario();
     
        if(sessao.getAttribute("usuario") == null){
           //request.getRequestDispatcher("index.jsp").forward(request, response);
            System.err.println("Erro");
        }else{
            usuario =  (Usuario) sessao.getAttribute("usuario");
            
            out.println("Usuário: " + usuario.getName_user());
        }
    
    
    
    
        MysqlDB banco = new MysqlDB();               
        banco.connect();
        PreparedStatement ps = null;
        ResultSet rs = null;
        String sql = null;  
    
       String latitude = new String("");
       String longitude = new String("");
       String email_user = usuario.getEmail_user();
       String nome_rota = "route-2018-05-11";   
     
       List<String> listaLong = new ArrayList<String>();  
       List<String> listaLat = new ArrayList<String>(); 
    
        try {
            
       // Essa é a consulta real
       sql = "SELECT `lat`,`lng` FROM `logidronereal` WHERE `email_user` = '" + email_user + "' and `nome_rota` ='" + nome_rota+"';";

       
        
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
        out.println("var map = new google.maps.Map(document.getElementById('content'), {");
          out.println("zoom: 18,");
          out.println("center: {lat: -22.006243, lng: -47.898435},");
          out.println("mapTypeId: 'satellite'");
        out.println("});");


    out.println("pontosLat = [];");
     out.println("pontosLong = [];");
    out.println("var locations = [];");

    for (int i = 0; i < listaLat.size();i++)
    {     
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

    out.println("flightPath.setMap(content);");
    
    out.println("}");

    out.println("</script>"); 
    
    out.println("<script async defer "
            + "src=\"https://maps.googleapis.com/maps/api/js?key=suasenha>");               
    out.println("</script>");



%>


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
