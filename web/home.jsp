<%-- 
    Document   : home
    Created on : 14/03/2019, 20:10:57
    Author     : Daniel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/cabecalho.jspf" %>
        <h1>Home</h1>
        <%@include file="WEB-INF/jspf/menu.jspf" %>
        <br>

        <h3>Integrantes</h3>
        <ul>
            <li>Daniel Rares</li>
            <li>Allan José</li>
            <li>Mohamad Tariff</li>
            <li>Gabriela</li>
        </ul>

        <%@include file="WEB-INF/jspf/rodape.jspf" %>
    </body>
</html>