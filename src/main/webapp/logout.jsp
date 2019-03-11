<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Goodbye</title>
</head>
<body>

<%
    if (session!=null){
        session.invalidate();
        response.sendRedirect("indexController");
    }
%>

</body>
</html>
