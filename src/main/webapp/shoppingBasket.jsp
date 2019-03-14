<%@ page import="model.Cupcake" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="WEB-INF/include/header.jsp"%>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
        integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
        crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
        crossorigin="anonymous"></script>

    <%
        int totalPrice = 0;
        int totalCupcakes = 0;
        int x = 0;
        StringBuilder stringBuilder;
        String button = "";
        if (session.getAttribute("basket") != null) {
            ArrayList<Cupcake> shopList = (ArrayList<Cupcake>) session.getAttribute("basket");
            stringBuilder = new StringBuilder();
            for (Cupcake cupcake : shopList) {

                String template = "<tr>\n" +
                        "    <td>_base_</td>\n" +
                        "    <td>_topping_</td> \n" +
                        "    <td style=\"text-align: right\">_amount_ stk.</td> \n" +
                        "    <td style=\"text-align: right\">_price_ ,-</td>\n" +
                        "    <td style=\"text-align: right\">_total_ ,-</td>\n" +
                        "    <td style=\"width: 75.8px\"><form style=\"margin-block-end: 0; width: 85px; text-align: right; \"action=\"shopcontroller\" method=\"post\">\n" +
                        "            <input type=\"hidden\" name=\"source\" value=\"deleteOrder\"/>\n" +
                        "\n" +
                        "            <button type=\"submit\" name=\"orderRow\" value=\""+x+"\" class=\"btn btn-danger\">Fjern</input>\n" +
                        "        </form></td>" +
                        "  </tr>";

                template = template.replace("_base_", cupcake.getBase());
                template = template.replace("_topping_", cupcake.getTop());
                template = template.replace("_amount_", Integer.toString(cupcake.getAmount()));
                template = template.replace("_price_", Integer.toString(cupcake.getPrice()));
                template = template.replace("_total_", Integer.toString(cupcake.getPrice() * cupcake.getAmount()));
                stringBuilder.append(template);
                totalPrice = totalPrice + cupcake.getPrice() * cupcake.getAmount();
                totalCupcakes = totalCupcakes + cupcake.getAmount();

                x++;
                button = "<button type=\"button\" class=\"btn btn-primary\" onclick=\"window.location.href = 'shopcontroller?source=order';\" value=\"order\">Bestil cupcakes</button>";
            }
        } else {
            stringBuilder = new StringBuilder();
            stringBuilder.append("<p>Din indkøbskurv er tom!</p>");
            button = "<button type=\"button\" class=\"btn btn-primary\" onclick=\"window.location.href = 'shopcontroller?source=order';\" value=\"order\" disabled>Bestil cupcakes</button>";
        }

    %>

    <div class="container" style="padding-bottom: 200px">
        <h3>Indkøbskurv</h3>
        <table class='table table-condensed table-striped table-hover'>
            <tr>
                <th>Bund</th>
                <th>Topping</th>
                <th style="text-align: right">Antal</th>
                <th style="text-align: right">Pris</th>
                <th style="text-align: right">Total</th>
                <th></th>
            </tr>
            <%=stringBuilder.toString()%>
            <tr>
            <tr>
                <td><b>Total:</b></td>
                <td></td>
                <td style="text-align: right"><%=totalCupcakes%> stk.</td>
                <td></td>
                <td style="text-align: right"><%=totalPrice%> ,-</td>
                <td></td>
            </tr>
            <tr>
            </tr>
        </table>
        <%=button%>
    </div>
<%@include file="WEB-INF/include/footer.jsp"%>