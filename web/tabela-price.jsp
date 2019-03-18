<%-- 
    Document   : tabelaprice
    Created on : 17/03/2019, 00:12:59
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tabela Price</title>
        <%@include file="WEB-INF/jspf/cabecalho.jspf" %>
    </head>
    <body>
        <h1>Tabela Price!</h1>
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
                double prestacao;
                double divisaoPrestacao;
                double raiz;
                
                taxaJuros = taxaJuros/100;
                raiz = Math.pow(1+taxaJuros,meses);
                divisaoPrestacao = (raiz *taxaJuros) /  (raiz -1);
                prestacao = valor*divisaoPrestacao;
                
                double jurosTabela;
                double amortizacao;
            %>
                <table border="2">
                    <tr>
                        <th> Prestação </th>
                        <th> Valor da Prestação</th>
                        <th> Juros </th>
                        <th> Amortização </th>
                        <th> Salvo devedor </th>
                    </tr>
                 
                   <% for (int i=1;i<=meses;i++){ %>
                   <%jurosTabela = valor*taxaJuros;%>
                   <%amortizacao = prestacao - jurosTabela;%>
                   <%valor = valor  - amortizacao;%>
                   <tr>
                        <td> <%=i%> </td>
                        <td> <%=Math.round(prestacao)%> </td>
                        <td> <%=Math.round(jurosTabela)%> </td>
                        <td> <%=Math.rint(amortizacao)%> </td>
                        <td> <%=Math.round(valor)%> </td>
                    </tr>
                 <%  }%>
           
             
                </table>
               
            <%}%>
        <% } catch(Exception ex){ %>
        <h1 style = 'color:red;'> Erro ao fazer tabela price</h1>
        <%} %>
        
    </body>
</html>