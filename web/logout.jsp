<%-- 
    Document   : logout
    Created on : Feb 9, 2019, 3:10:43 PM
    Author     : guidotti
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    HttpSession sessao = request.getSession();
    sessao.removeAttribute("usuario");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <script>
            window.location.href="./";
        </script>
    </body>
</html>
