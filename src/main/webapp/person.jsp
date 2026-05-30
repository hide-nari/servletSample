<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<!DOCTYPE html>
<html>
<head>
    <title>Person</title>
</head>
<body>
<div>
    <%= request.getAttribute("initMsg") %>
</div>
<div>
    ${ initMsg }
</div>
<div>
    ${ conParam }
</div>
<div>
    <%
        if ((boolean) request.getAttribute("flg")) {
            out.println("true");
        } else {
            out.println("false");
        }
    %>
</div>
<div>
    <% String str = (boolean) request.getAttribute("flg") ? "true" : "false"; %>
    <%= str %>
</div>
<div>
    <c:if test="${ flg }">true</c:if>
</div>
<div>
    <c:choose>
        <c:when test="${ flg }">true</c:when>
        <c:otherwise>false</c:otherwise>
    </c:choose>
</div>

<c:forEach items="${lists}" var="list">
    <div>
        <c:out value="${list}"/>
    </div>
</c:forEach>

<c:forTokens items="${numbersStr}" delims="," var="number">
    <div>
        <c:out value="${number}"/>
    </div>
</c:forTokens>

<div>
    <c:set var="name" value="taro"/>
    <c:out value="${name}"/>
    <c:remove var="name"/>
    <c:out value="${name}"/>
</div>

<div>
    <fmt:formatNumber value="1234567890" pattern="###,###"/>
</div>

<div>
    <jsp:useBean id="date" class="java.util.Date"/>
    <fmt:formatDate value="${date}" type="DATE"/><br>
    <fmt:formatDate value="${date}" type="TIME"/><br>
    <fmt:formatDate value="${date}" type="BOTH"/><br>
    <fmt:formatDate value="${date}" pattern="yyyyMMdd_HHmmss"/><br>
</div>

<br/>
<a href="index.jsp">index</a>
</body>
</html>