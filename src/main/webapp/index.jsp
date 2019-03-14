<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Map.Entry" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="model.User" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map.Entry" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Olsker Cupcake Webshop</title>
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
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
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
                            "<button onclick=\"document.getElementById('id01').style.display='block'\" style=\"width:auto; border: 1px solid green;\">Login</button>\n" +
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
                                    "                           <br><br>" +
                                    "                        <button type=\"submit\">Login</button>\n" +
                                    "                        <button type=\"button\" onclick=\"document.getElementById('id01').style.display='border: 1px solid green;'\"\n" +
                                    "                                class=\"cancelbtn\">Cancel\n" +
                                    "                        </button>\n" +
                                    "                        <!-- Button to open the create user modal -->\n" +
                                    "                    </div>\n" +
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
                                    "        </script>" +
                                    "<button onclick=\"document.getElementById('id02').style.display='block'\" style=\"width:auto;border: 1px solid green;\">Ny bruger</button>\n" +
                                    "            <!-- The Modal (contains the Sign Up form) -->\n" +
                                    "            <div id=\"id02\" class=\"modal\">\n" +
                                    "                <span onclick=\"document.getElementById('id02').style.display='none'\" class=\"close\" title=\"Close Modal\">times;</span>\n" +
                                    "                <form class=\"modal-content\" action=\"shopcontroller\">\n" +
                                    "                    <input type=\"hidden\" name=\"source\" value=\"create\"/>\n" +
                                    "                    <div class=\"container\">\n" +
                                    "                        <h1>Sign Up</h1>\n" +
                                    "                        <p>Please fill in this form to create an account.</p>\n" +
                                    "                        <hr>\n" +
                                    "                        <label for=\"email\"><b>Email</b></label>\n" +
                                    "                        <input type=\"text\" placeholder=\"Enter Email\" name=\"email\" required>\n" +
                                    "\n" +
                                    "                        <label for=\"psw\"><b>Password</b></label>\n" +
                                    "                        <input type=\"password\" placeholder=\"Enter Password\" name=\"psw\" required>\n" +
                                    "\n" +
                                    "                        <label for=\"psw-repeat\"><b>Repeat Password</b></label>\n" +
                                    "                        <input type=\"password\" placeholder=\"Repeat Password\" name=\"psw-repeat\" required>\n" +
                                    "\n" +
                                    "                        <div class=\"clearfix\">\n" +
                                    "                            <button type=\"button\" onclick=\"document.getElementById('id02').style.display='border: 1px solid green;'\" class=\"cancelbtn\">Cancel</button>\n" +
                                    "                            <button type=\"submit\" class=\"signup\">Sign Up</button>\n" +
                                    "                        </div>\n" +
                                    "                    </div>\n" +
                                    "                </form>\n" +
                                    "            </div>\n" +
                                    "            <script>\n" +
                                    "                // Get the modal\n" +
                                    "                var modal = document.getElementById('id02');\n" +
                                    "\n" +
                                    "                // When the user clicks anywhere outside of the modal, close it\n" +
                                    "                window.onclick = function(event) {\n" +
                                    "                    if (event.target == modal) {\n" +
                                    "                        modal.style.display = \"none\";\n" +
                                    "                    }\n" +
                                    "                }\n" +
                                    "            </script>";
                }
            %>

            <%=loginForm%>

            <a class="nav-link" href="shopcontroller?source=shopicon">
                <img src="img/shopping-basket.svg" width="30" height="30" class="d-inline-block align-top"
                     alt="logo">
            </a>
        </div>

    </div>

    <!-- ALARM -->
    <%  String besked = (String) request.getAttribute("message");
        String status = (String) request.getAttribute("status");
        if (besked != null && status != null) {
            String alert = "";
            if (status.equals("ok")) {
                alert = "<div class=\"alert alert-success\">_message_</div>";
            } else {
                alert = "<div class=\"alert alert-danger\">_message_</div>";
            }
            alert = alert.replace("_message_", besked);
            out.println(alert);
        }
    %>

    <div class="jumbotron">
        <h1>Velkommen ombord</h1>
        <h4>Øens bedste cupcakes. Vælg og bestil her:</h4>

        <%
            HashMap<String, Integer> topHash = (HashMap<String, Integer>)request.getAttribute("topHash");
            HashMap<String, Integer> baseHash = (HashMap<String, Integer>) request.getAttribute("baseHash");

            StringBuilder top = new StringBuilder();
            StringBuilder base = new StringBuilder();

            if (topHash != null && baseHash != null) {
                for (Entry<String, Integer> entry :
                        topHash.entrySet()) {
                    String template = "<option value=\"_name_\">_name_: _price_ ,-</option>";
                    template = template.replace("_name_", entry.getKey());
                    template = template.replace("_price_", entry.getValue().toString());
                    top.append(template);
                }

                for (Entry<String, Integer> entry :
                        baseHash.entrySet()) {
                    String template = "<option value=\"_name_\">_name_: _price_ ,-</option>";
                    template = template.replace("_name_", entry.getKey());
                    template = template.replace("_price_", entry.getValue().toString());
                    base.append(template);
                }
            }else {
                request.getRequestDispatcher("/indexController").forward(request, response);
            }
        %>

        <form action="shopcontroller" method="post">

            <input type="hidden" name="source" value="addtocart"/>

            <div id="cupcakeselectionbox" class="row">

                <div class="col-sm-3 dropdown_box">
                    <select name="base" class="form-control">
                        <option selected disabled>Vælg bund</option>
                        <%=base.toString()%>
                    </select>
                </div>

                <div class="col-sm-3 dropdown_box">
                    <select name="top" class="form-control">
                        <option selected disabled>Vælg top</option>
                        <%=top.toString()%>
                    </select>
                </div>

                <div class="col-sm-3 dropdown_box">
                    <select name="amount" class="form-control">
                        <option selected disabled>Vælg antal</option>
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                        <option value="6">6</option>
                        <option value="7">7</option>
                        <option value="8">8</option>
                        <option value="9">9</option>
                        <option value="10">10</option>
                    </select>
                </div>

                <div class="col-sm-3 dropdown_box">
                    <input type="submit" name="selectcupcake" value="Læg i kurv" class="btn btn-success form-control"/>
                </div>
            </div>
        </form>
    </div>
</div>
</div>
</body>
</html>