<%-- 
    Document   : amortizacao-constante
    Created on : 15/03/2019, 11:19:54
    Author     : Gabi
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
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
            Empréstimo R$ <input type="number" name="divida">
            Prazo: <input type="number" name="n">
            Taxa de Juros%: <input type="number" name="juros" placeholder="Em porcentagem">
            <input type="submit" value="Calular" name="calulo">
            <% if (request.getParameter("juros")!= null && request.getParameter("divida") != null && request.getParameter("n") != null){%>
                <%try{ %>
                    <%    double i = 0, n = 0, divida = 0, amortizacao = 0, juros = 0, totala = 0, totalj = 0, prestacao = 0, totalp = 0;
                    DecimalFormat formato = new DecimalFormat ("#.##");
                    i = Double.parseDouble(request.getParameter("juros")) / 100;
                    divida = Double.parseDouble(request.getParameter("divida"));
                    n = Double.parseDouble(request.getParameter("n"));
                    amortizacao = divida / n; %>
                    <table border="2">
                        <thead>
                             <tr>
                                <th>Período(meses)</th>
                                <th>Prestação</th>
                                <th>Juros</th>
                                <th>Amortização</th>
                                <th>Saldo Devedor</th>
                            </tr>
                        </thead>
                        <tr>
                            <td> 0 </td>
                            <td> - </td>
                            <td> - </td>
                            <td> - </td>
                            <td> R$ <%= formato.format(divida)%> </td>
                        </tr>   
                        <% for (int x = 1; x <= n; x++) {%>
                            <tr>
                                <td><%=x%></td>
                                <%prestacao = amortizacao + (divida * i);%>
                                <td>R$ <%=formato.format(prestacao)%></td>
                                <%totalp = prestacao + totalp;
                                  juros = divida *i;
                                  totalj = juros + totalj;
                                  totala = amortizacao + totala; %>
                                <td>R$ <%=formato.format(juros)%></td>
                                <td> R$ <%=formato.format(amortizacao)%></td>  
                                <% divida = divida - amortizacao; %>
                                <td>R$ <%=formato.format(divida) %></td>
                            </tr>
                        <% } %>
                        <tr>
                            <td>∑ →</td>
                            <td>R$ <%=formato.format(totalp) %></td>
                            <td>R$ <%=formato.format(totalj) %></td>
                            <td>R$ <%=formato.format(totala) %></td>
                            <td> - </td>
                        </tr>
                    </table>
                <%} catch (Exception ex) {
                        if(request.getParameter("juros") != null) {
                        }
                } %> 
            <% } %>
    <%@include file="WEB-INF/jspf/rodape.jspf" %>
    </body>    
</html>



