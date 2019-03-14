<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Map.Entry" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="model.User" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map.Entry" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="WEB-INF/include/header.jsp"%>

<div class="container">
    <div class="jumbotron">
        <h1>Velkommen ombord</h1>
        <h4>Øens bedste cupcakes. Vælg og bestil her:</h4>

        <%
            HashMap<String, Integer> topHash = (HashMap<String, Integer>) request.getAttribute("topHash");
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
            } else {
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

<%@include file="WEB-INF/include/footer.jsp"%>