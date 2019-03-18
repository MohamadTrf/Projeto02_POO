<%-- 
    Document   : amortizacao-constante
    Created on : 15/03/2019, 11:19:54
    Author     : Gabi
--%>

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
        <title>Amortização Constante</title>
        
    </head>
    <body>

        <%@include file="WEB-INF/jspf/menu.jspf" %> <br/>
            <h2>Amortização Constante</h2>

            <p>Sistema de Amortização Constante (SAC) é uma forma de amortização de um empréstimo por prestações que incluem os juros, amortizando assim partes iguais do seu valor total.</p>

            <p>Neste sistema o saldo devedor é reembolsado em valores de amortização iguais.</p>

            <p>Desta forma, no sistema SAC o valor das prestações é decrescente, já que os juros diminuem a cada prestação.</p>

            <p>O valor da amortização é calculada dividindo-se o valor do principal pelo número de períodos de pagamento, ou seja, de parcelas.</p>

            <hr>
            <form>
                Empréstimo R$ <input type="text" name="valor">
                Prazo em Meses <input type="text" name="meses">
                Taxa de Juros % <input type="text" name="juros" placeholder="Em porcentagem">
                <input type="submit" value="Calcular" name="calculo">
            </form>
            <% if (request.getParameter("calculo")!= null ){%>
                <%try{ %>
                    <%
                        double valor = Double.parseDouble(request.getParameter("valor"));
                        int meses = Integer.parseInt(request.getParameter("meses"));
                        double taxaJuros = Double.parseDouble(request.getParameter("juros"));
                        taxaJuros = taxaJuros/100;
                        double amortizacao ;
                        amortizacao = valor/meses;
                        double jurosTotal;
                        double prestacao;
                        double totalPrestacao;
                        double totalJuros = 0;
                    %>
                    <table border = "2">
                     <tr>
                        <th> Mês </th>
                        <th> Saldo Devedor   </th>
                        <th> Amortizacao </th>
                        <th> Juros </th>
                        <th> Prestacao </th>
                    </tr>
                        <%for (int i=1; i<=meses;i++) {  %>
                        <% jurosTotal = valor * taxaJuros; %>
                        <% valor = valor - amortizacao; %>
                        <% prestacao = amortizacao + jurosTotal; %>
                        <tr>
                            <td> <%=i%> </td>  
                            <td> <%=Math.round(valor)%> </td> 
                            <td> <%=Math.round(amortizacao)%> </td> 
                            <td> <%=Math.round(jurosTotal)%> </td> 
                            <td> <%=Math.round(prestacao)%> </td> 
                        </tr>
                            <%totalJuros = totalJuros +jurosTotal; %>
                        <%}%>
                            <% totalPrestacao = (amortizacao*meses)+totalJuros; %>
                    </table>
                       <h2> Total das prestações <%=Math.round(totalPrestacao)%> </h2>

                <%} catch (Exception ex) { %>
                <h1><%=ex%> </h1>
                    <h2 style = 'color:red;'> Erro ao fazer amortazição americana</h2>
              <%  } %> 

            <% } %>
            <%@include file="WEB-INF/jspf/rodape.jspf" %>
    </body>    
</html>


