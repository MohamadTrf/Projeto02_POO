<%-- 
    Document   : tabelaprice
    Created on : 17/03/2019, 00:12:59
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tabela Price</title>
        
    </head>
    <body>
        <%@include file="WEB-INF/jspf/menu.jspf"%><br>  
        <h2>Tabela Price</h2>
        
        <form>
                Empréstimo R$ <input type="text" name="valor"/> 
                Prazo em Meses <input type="text" name="meses"/> 
                Taxa de Juros % <input type="text" name="juros" placeholder="Em porcentagem"/>
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
        <h2 style = 'color:red;'> Erro ao fazer tabela price</h2>
        <%} %>
         <%@include file="WEB-INF/jspf/rodape.jspf" %>
    </body>
</html>
