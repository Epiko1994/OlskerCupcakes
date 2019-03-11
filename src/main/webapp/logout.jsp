<%@ page import="model.Cupcake" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Goodbye</title>
</head>
<body>

<%
    if (session!=null) {
        ArrayList<Cupcake> shopList;
        shopList = (ArrayList<Cupcake>) session.getAttribute("basket");
        shopList.clear();
        session.invalidate();
        response.sendRedirect("indexController");
    }
%>

</body>
</html>
