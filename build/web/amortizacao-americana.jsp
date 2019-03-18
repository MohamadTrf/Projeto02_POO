<%-- 
    Document   : amortizacao-americana
    Created on : 14/03/2019, 20:17:40
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
         <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       
        <%@include file="WEB-INF/jspf/menu.jspf"%> <br>
         <h2>Amortização Americana</h2>
        <form>
            Empréstimo R$ <input type="number" name="divida">
            Prazo: <input type="number" name="n">
            Taxa de Juros%: <input type="number" name="juros" placeholder="Em porcentagem">
            <input type="submit" value="Calular" name="calulo">
        </form>
        <%try{ %>
            <%if(request.getParameter("calculo")!= null){%>
            <%    double valor = Double.parseDouble(request.getParameter("valor"));
                int meses = Integer.parseInt(request.getParameter("meses"));
                double taxaJuros = Double.parseDouble(request.getParameter("juros")); 
                double jurosTotal;
                double totalAmortizacao;
                taxaJuros = taxaJuros/100;%>
                
                <table border="2">
                    <tr>
                        <th> Saldo </th>
                        <th> Mês   </th>
                        <th> Juros </th>
                        <th> Prestação </th>
                    </tr>
                    <%jurosTotal = taxaJuros * valor;%>
                   <% for (int i=1;i<=meses;i++){ %>
                    <tr>
                        <td> <%=valor%> </td>
                        <td> <%=i%> </td>
                        <td> <%=jurosTotal%> </td>
                        <td> <%=jurosTotal%> </td>
                    </tr>
                 <%  }%>
                 <%jurosTotal = jurosTotal*meses;%>
                 <% totalAmortizacao = valor+jurosTotal;%>
                 <h1> Total <%=totalAmortizacao%> </h1>
                </table>
               
            <%}%>
        <% } catch(Exception ex){ %>
        <h1 style = 'color:red;'> Erro ao fazer amortazição americana</h1>
        <%} %>
         <%@include file="WEB-INF/jspf/rodape.jspf" %>
    </body>
</html>
