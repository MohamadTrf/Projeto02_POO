<%-- 
    Document   : amortizacao-constante
    Created on : 15/03/2019, 11:19:54
    Author     : Gabi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Amortizações</title>
        <%@include file="WEB-INF/jspf/cabecalho.jspf" %>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/menu.jspf" %>
            <h2>Amortização Constante</h2>

            <p>Sistema de Amortização Constante (SAC) é uma forma de amortização de um empréstimo por prestações que incluem os juros, amortizando assim partes iguais do seu valor total.</p>

            <p>Neste sistema o saldo devedor é reembolsado em valores de amortização iguais.</p>
            
            <p>Desta forma, no sistema SAC o valor das prestações é decrescente, já que os juros diminuem a cada prestação.</p>
            
            <p>O valor da amortização é calculada dividindo-se o valor do principal pelo número de períodos de pagamento, ou seja, de parcelas.</p>

            <hr>

        <form>
            Empréstimo R$ <input type="number" name="emprestimo">
            Prazo: <input type="number" name="prazo">
            Taxa de Juros%: <input type="number" name="jutos" placeholder="Em porcentagem">
            <input type="submit" value="Calular" name="calulo">
            
            
            
            
            
            
            
            
            
        </form>

            <%@include file="WEB-INF/jspf/rodape.jspf" %>
    </body>
</html>
