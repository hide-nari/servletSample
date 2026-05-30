<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

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
        <c:otherwise>false</c:otherwise>
    </c:choose>
</h1>

<c:forEach items="${lists}" var="list">
    <h1>
        <c:out value="${list}"/>
    </h1>
</c:forEach>

<c:forTokens items="${numbersStr}" delims="," var="number">
    <h1>
        <c:out value="${number}"/>
    </h1>
</c:forTokens>

<h1>
    <c:set var="name" value="taro"/>
    <c:out value="${name}"/>
    <c:remove var="name"/>
    <c:out value="${name}"/>
</h1>

<h1>
    <fmt:formatNumber value="1234567890" pattern="###,###"/>
</h1>

<h1>
    <jsp:useBean id="date" class="java.util.Date"/>
    <fmt:formatDate value="${date}" type="DATE"/><br>
    <fmt:formatDate value="${date}" type="TIME"/><br>
    <fmt:formatDate value="${date}" type="BOTH"/><br>
    <fmt:formatDate value="${date}" pattern="yyyyMMdd_HHmmss"/><br>
</h1>

<br/>
<a href="index.jsp">index</a>
</body>
</html>