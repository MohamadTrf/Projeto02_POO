<%-- 
    Document   : amortizacao-americana
    Created on : 14/03/2019, 20:17:40
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Amortização Americana!</h1>
        <%@include file="WEB-INF/jspf/menu.jspf"%> <br>
        <form>
                Valor R$<input type="text" name="valor"/> <br>
                Meses <input type="text" name="meses"/> <br>
                Juros <input type="text" name="juros" placeholder="Em porcentagem"/> <br>
                <input type ="submit" value="Calcular" name="calculo"/> <br>
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
    </body>
</html>
