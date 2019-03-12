<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Goodbye</title>
</head>
<body>

<%
    String s = "Request is not null";
    if (session!=null) {
        //session.removeAttribute("basket");
        //session.invalidate();
        //response.sendRedirect("http://www.javatpoint.com");
        //response.sendRedirect("shopController");
        if (request != null && response != null) {
            request.getRequestDispatcher("shopcontroller?source=logout").forward(request, response);
        }
        else {s = "Request is null";}
    }
%>

<%=s%>

</body>
</html>
