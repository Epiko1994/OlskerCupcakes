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
    <%
        ArrayList<User> users = (ArrayList<User>) request.getAttribute("users");
        StringBuilder stringBuilder = new StringBuilder();

        for (User user :
                users) {
            String template = "<tr class=\"table-row\"data-href=\"customerPageController?userid=_userid_\">" +
                    "    <td>_email_</td>\n" +
                    "    <td>_userid_</td> \n" +
                    "    <td style=\"text-align: right\">_balance_ ,-</td>\n" +
                    "  </tr>";
            template = template.replace("_email_", user.getEmail());
            template = template.replace("_userid_", Integer.toString(user.getUserID()));
            template = template.replace("_balance_", Integer.toString(user.getBalance()));
            stringBuilder.append(template);
        }
    %>
    <h3>Kundeliste</h3>
    <table class='table table-condensed table-striped table-hover'>
        <tr>
            <th>E-mail</th>
            <th>Kunde-ID</th>
            <th style="text-align: right">Saldo</th>
        </tr>
        <%=stringBuilder.toString()%>
    </table>
</div>
<%@include file="WEB-INF/include/footer.jsp" %>