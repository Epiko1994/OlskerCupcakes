<%@ page import="model.Order" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="WEB-INF/include/header.jsp" %>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
        integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
        crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
        crossorigin="anonymous"></script>
<div class="container">
    <h3>Ordreliste</h3>
    <%
        ArrayList<User> users = (ArrayList<User>) request.getAttribute("users");

        StringBuilder stringBuilder = new StringBuilder();

        for (User user :
                users) {
            for (Order order :
                    user.getOrders()) {

                String template = "<tr class=\"table-row\" data-href=\"OrderPageController?orderid=_orderid_\">\n" +
                        "    <td>_orderid_</td>\n" +
                        "    <td>_userid_</td> \n" +
                        "    <td>_date_</td> \n" +
                        "    <td style=\"text-align: right\">_totalpris_ ,-</td>\n" +
                        "  </tr>";
                template = template.replace("_orderid_", Integer.toString(order.getOrderID()));
                template = template.replace("_userid_", user.getEmail());
                template = template.replace("_date_", order.getDateTime());
                template = template.replace("_totalpris_", Integer.toString(order.getTotalprice()));
                stringBuilder.append(template);
            }
        }
    %>

    <table class='table table-condensed table-striped table-hover'>
        <tr>
            <th>Ordre-ID</th>
            <th>Kunde-ID</th>
            <th>Date</th>
            <th style="text-align: right">Total</th>
        </tr>
        <%=stringBuilder.toString()%>
    </table>
</div>

<%@include file="WEB-INF/include/footer.jsp" %>
