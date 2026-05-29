<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Person</title>
</head>
<body>
<h1>
    <%= request.getAttribute("initMsg") %>
</h1>
<h1>
    ${ initMsg }
</h1>
<h1>
    ${ conParam }
</h1>
<h1>
    <%
        if ((boolean) request.getAttribute("flg")) {
            out.println("true");
        } else {
            out.println("false");
        }
    %>
</h1>
<h1>
    <% String str = (boolean) request.getAttribute("flg") ? "true" : "false"; %>
    <%= str %>
</h1>
<h1>
    <c:if test="${ flg }">true</c:if>
</h1>
<h1>
    <c:choose>
        <c:when test="${ flg }">true</c:when>
        <c:when test="!${ flg }">false</c:when>
    </c:choose>
</h1>

<br/>
<a href="index.jsp">index</a>
</body>
</html>