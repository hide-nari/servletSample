<!DOCTYPE html>
<html>
<head>
    <title>Person</title>
</head>
<body>
<%!
    private String outputHr() {
        return "<hr>";
    }
%>
<div>
    <%= request.getAttribute("initMsg") %>
</div>
<div>
    ${initMsg}
</div>
<div>
    ${conParam}
</div>
<%= outputHr() %>
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
    <c:if test="${flg}">true</c:if>
    <c:if test="${!flg}">false</c:if>
</div>
<div>
    <c:choose>
        <c:when test="${flg}">true</c:when>
        <c:otherwise>false</c:otherwise>
    </c:choose>
</div>
<%= outputHr() %>
<c:forEach items="${lists}" var="list">
    <div>
        <c:out value="${list}"/>
    </div>
</c:forEach>
<c:forEach var="i" begin="1" end="5" varStatus="status">
    <div>
        <c:out value="${i} -> ${status.current}"/>
    </div>
</c:forEach>

<c:forTokens items="${numbersStr}" delims="," var="number">
    <div>
        <c:out value="${number}"/>
    </div>
</c:forTokens>
<%= outputHr() %>
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
    <%--    <% pageContext.setAttribute("date", new Date()); %>--%>
    <jsp:useBean id="date" class="java.util.Date"/>
    <fmt:formatDate value="${date}" type="DATE"/><br>
    <fmt:formatDate value="${date}" type="TIME"/><br>
    <fmt:formatDate value="${date}" type="BOTH"/><br>
    <fmt:formatDate value="${date}" pattern="yyyyMMdd_HHmmss"/><br>
    <c:set var="today" value="2026-12-31"/>
    <fmt:parseDate value="${today}" pattern="yyyy-MM-dd" var="tmpToday"/>
    ${tmpToday}
</div>
<%= outputHr() %>

<div>
    <%= application.getAttribute("listenerStr") %><br>
    <c:out value="${applicationScope.listenerStr}"/><br>
    <c:out value="${listenerStr}"/><br>
</div>
<br/>
<div>
    ${ pageContext }
    <%
        var headers = request.getHeaderNames();
        while (headers.hasMoreElements()) {
            out.println(headers.nextElement());
        }
//        response.setStatus(HttpServletResponse.SC_MOVED_TEMPORARILY);
//        response.setHeader("Location", "https://laravel.com");
    %>
</div>

<div>
    <sql:setDataSource var="db" dataSource="jdbc/testdb"/>
    <sql:query var="result" dataSource="${db}">
        SELECT * FROM department WHERE id in ( ? , ? )
        <sql:param value="1"/>
        <sql:param value="2"/>
    </sql:query>
    <c:forEach items="${result.rows}" var="row">
        ${row.id} : ${row.name}
    </c:forEach>
</div>

<div>
    <c:set var="functionVar" value="aiueo"/>
    length : ${fn:length(functionVar)}
</div>

<a href="index.jsp">index</a>
</body>
</html>