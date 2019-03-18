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
         <p>O Sistema de Amortização Americano é uma forma de pagamento de empréstimos que se caracteriza pelo pagamento apenas dos juros da dívida,deixando o valor da dívida constante, que pode ser paga em apenas um único pagamento.</p>

         <p>Esse sistema de amortização tem a vantagem em relação ao sistema de pagamento único, pois nele não há incidência de juros sobre juros. Os juros sempre incidem sobre o valor original da dívida. Com isso o devedor pode quitar sua dívida quando quiser.</p>

         <p>Tem como desvantagem que o pagamento de juros pode, em tese, ser perpétuo mesmo quando já se pagou o equivalente à dívida em si. Para isso, basta que o número de prestações exceda 100% quando da soma dos juros simples.</p>
        <form>
                Empréstimo R$<input type="text" name="valor"/> 
                Prazo em Meses <input type="text" name="meses"/> 
                Taxa de Juros % <input type="text" name="juros" placeholder="Em porcentagem"/> 
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
                 <h2> Total <%=totalAmortizacao%> </h2>
                </table>
               
            <%}%>
        <% } catch(Exception ex){ %>
        <h1 style = 'color:red;'> Erro ao fazer amortazição americana</h1>
        <%} %>
         <%@include file="WEB-INF/jspf/rodape.jspf" %>
    </body>
</html>
