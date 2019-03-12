<%@ page import="model.Cupcake" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.User" %><%--
  Created by IntelliJ IDEA.
  User: Emil
  Date: 05-03-2019
  Time: 11:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Indkøbskurv</title>

    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <!-- Optional JavaScript: jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
            integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
            crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
            integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
            crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
            integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
            crossorigin="anonymous"></script>
    <link href="css/cupcake.css" rel="stylesheet" type="text/css">
</head>
<body>
<div class="container">

    <img src="img/cupcakeBanner.png" alt="Logo" class="img-fluid"/>

    <div class="navbar navbar-expand-lg navbar-light">
        <a class="navbar-brand" href="index.jsp">
            <img src="img/cupcake.svg" width="30" height="30" class="d-inline-block align-top" alt="logo">
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav mr-auto">
                <a class="active" href="indexController">Shop</a>
                <a href="servlet?destination=customers.jsp">Kunder</a>
                <a href="servlet?destination=orders.jsp">Ordrer</a>
            </ul>

            <!-- Login popup -->

            <%
                String loginForm;
                if (session.getAttribute("login") != null && (boolean) session.getAttribute("login")) {
                    User user = (User) session.getAttribute("userData");
                    loginForm =
                            "<div class=\"html-editor-align-right\">\n" +
                                    "                <a href=\"userAccount.jsp\">" + user.getEmail() + "</a>\n" +
                                    "                <a href=\"userPurchases.jsp\">" + user.getBalance() + ",-</a>\n" +
                                    "            </div>" +
                                    "<form method=\"post\" action=\"logout.jsp\">\n" +
                                    "                <button class=\"cancelbtn\">Logout</button>\n" +
                                    "            </form>";

                } else {
                    loginForm =
                            "<button onclick=\"document.getElementById('id01').style.display='block'\" style=\"width:auto;border: 1px solid green;\">Login</button>\n" +
                                    "            \n" +
                                    "            <div id=\"id01\" class=\"modal\">\n" +
                                    "                \n" +
                                    "                <form class=\"modal-content animate\" action=\"shopcontroller\">\n" +
                                    "\n" +
                                    "                    <input type=\"hidden\" name=\"source\" value=\"login\"/>\n" +
                                    "\n" +
                                    "                    <div class=\"container\">\n" +
                                    "                    <span onclick=\"document.getElementById('id01').style.display='none'\" class=\"close\"\n" +
                                    "                          title=\"Close Modal\">&times;</span>\n" +
                                    "\n" +
                                    "                        <label for=\"email\"><b>Email</b></label>\n" +
                                    "                        <input type=\"text\" placeholder=\"Enter Email\" name=\"email\">\n" +
                                    "                        <label for=\"psw\"><b>Password</b></label>\n" +
                                    "                        <input type=\"password\" placeholder=\"Enter Password\" name=\"psw\" required>\n" +
                                    //"                        <label>\n" +
                                    //"                            <input type=\"checkbox\" checked=\"checked\" name=\"remember\"> Remember me\n" +
                                    //"                        </label>\n" +
                                    "                           <br><br>" +
                                    "                        <button type=\"submit\">Login</button>\n" +
                                    "                        <button type=\"button\" onclick=\"document.getElementById('id01').style.display='none'\"\n" +
                                    "                                class=\"cancelbtn\">Cancel\n" +
                                    "                        </button>\n" +
                                    "\n" +
                                    "                    </div>\n" +
                                    "\n" +
                                    "                </form>\n" +
                                    "            </div>\n" +
                                    "\n" +
                                    "        <script>\n" +
                                    "            // Get the modal\n" +
                                    "            var modal = document.getElementById('id01');\n" +
                                    "\n" +
                                    "            // When the user clicks anywhere outside of the modal, close it\n" +
                                    "            window.onclick = function (event) {\n" +
                                    "                if (event.target == modal) {\n" +
                                    "                    modal.style.display = \"none\";\n" +
                                    "                }\n" +
                                    "            }\n" +
                                    "        </script>";
                }
            %>

            <%=loginForm%>


            <a class="nav-link" href="shopcontroller?source=shopicon">
                <img src="img/shopping-basket.svg" width="30" height="30" class="d-inline-block align-top"
                     alt="logo">
            </a>
        </div>

    </div>

    <%
        int totalPrice = 0;
        int totalCupcakes = 0;
        int x = 0;
        String listElement;
        StringBuilder stringBuilder;
        if (session.getAttribute("basket") != null) {
            ArrayList<Cupcake> shopList = (ArrayList<Cupcake>) session.getAttribute("basket");
            stringBuilder = new StringBuilder();
            for (Cupcake cupcake : shopList) {
                listElement = Integer.toString(x);

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
            }
        } else {
            stringBuilder = new StringBuilder();
            stringBuilder.append("<p>Din indkøbskurv er tom!</p>");
        }

    %>

    <div class="container-fluid">
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
        <button type="button" class="btn btn-primary" onclick="window.location.href = 'shopcontroller?source=order';" value="order">Bestil cupcakes</button>
    </div>



</div>
</body>
</html>
