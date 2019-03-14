<%@ page import="model.Order" %>
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
        User user = (User) request.getAttribute("user");
        StringBuilder stringBuilder = new StringBuilder();

        for (Order order :
                user.getOrders()) {
            //todo lav linket
            String template = "<tr class=\"table-row\" data-href=\"OrderPageController?orderid=_orderid_\">\n" +
                    "    <td>_orderid_</a></td>\n" +
                    "    <td>_date_</td> \n" +
                    "    <td>_total_</td>\n" +
                    "  </tr>";
            template = template.replace("_orderid_", Integer.toString(order.getOrderID()));
            template = template.replace("_date_", order.getDateTime());
            template = template.replace("_total_",  Integer.toString(order.getTotalprice()));
            stringBuilder.append(template);
        }
    %>


<div class="container">
    <h3><%=user.getEmail()%>
    </h3>
    <table class="table table-bordered table-condensed table-striped table-hover">
        <tr>
            <th>Ordre-ID</th>
            <th>Dato</th>
            <th>Total</th>
        </tr>
        <%=stringBuilder.toString()%>
    </table>
</div>

<%@include file="WEB-INF/include/footer.jsp"%>