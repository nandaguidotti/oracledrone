<%-- 
    Document   : dashboard
    Author     : guidotti
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="conexao.MysqlDB"%>
<%@page import="models.Usuario"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page language="java" import="java.io.*,java.sql.*,javax.sql.*,javax.naming.*" %> 

<%@page import="models.Mosaico"%>


<%
    HttpSession sessao = request.getSession();
        Usuario usuario = new Usuario();
        if(sessao.getAttribute("usuario")==null){
           //request.getRequestDispatcher("index.jsp").forward(request, response);
            }else{
            usuario =  (Usuario) sessao.getAttribute("usuario");
        }
        
        int id_user   =  usuario.getId_user();
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

  <link rel="shortcut icon" href="images/drone.png" >
   <title>OracleDrone</title>

	<!---------- CSS ------------>
	<link rel="stylesheet" type="text/css" href="./css/style.css">

</head>

 <body id="home" class="scrollspy">

     <div class="content">
  
         <div class="row">
                       
    <div id="consulta">

      <div class="col s12 m5">
          <ul class="collection with-header">
              <li class="collection-header teal">
                <h5 class="white-text">Tempo por rotas</h5>
                
              </li>
              <li class="collection-item">
                <br>
                <%

    MysqlDB banco = new MysqlDB();               
    banco.connect();
    PreparedStatement ps = null;
    ResultSet rs = null;
    String sql = null;  
    
   
      sql = "SELECT r.name_routeidrone as 'name', MAX(CAST(l.time as time)) as 'tempo' FROM routeidrone r, logidrone l WHERE r.id_routeidrone = l.routeidrone_id_routeidrone AND routeidrone_user_id_user = " + id_user + " GROUP BY name_routeidrone";

   
    ps = banco.conn.prepareStatement(sql); 
    rs = ps.executeQuery(sql);
              
        out.println("<script>alert('"+sql+"');</script>");
        
        
      
    
    %>
       
    <div>
    <table class="bordered striped centered highlight responsive-table">
         <tr>
            <td>Nome da Rota</td>
            <td>Tempo total de percurso</td>
        </tr>
        <%
            while(rs.next()){
        %>
       
        
        <tr>
            <td><%= rs.getString("name") %></td>
            <td><%= rs.getTime("tempo")%></td> 
          
        </tr>
       <% } 
       %>
    </table>

    </div>   
                    

                
              </li>
              </ul>
      </div>
    
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