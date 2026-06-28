<%@ page import="java.util.Enumeration" %>
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

    private String parseNumber(int number) {
        return java.text.NumberFormat.getCompactNumberInstance().format(number);
    }
%>
<div>
    <%= request.getAttribute("initMsg") %>
</div>
<div>
    ${initMsg}
</div>
<div>
    1: + ${conParam}
</div>
<div>
    2: + ${initParam['conParam']}
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
        Enumeration<String> headers = request.getHeaderNames();
        while (headers.hasMoreElements()) {
            out.println(headers.nextElement());
        }
//        response.setStatus(HttpServletResponse.SC_MOVED_TEMPORARILY);
//        response.setHeader("Location", "https://laravel.com");
    %>
</div>

<div>
    <sql:setDataSource var="db" dataSource="jdbc/testdb"/>
    <%--    <sql:query var="result" dataSource="${db}">--%>
    <%--        SELECT * FROM department WHERE id in ( ? , ? )--%>
    <%--        <sql:param value="1"/>--%>
    <%--        <sql:param value="2"/>--%>
    <%--    </sql:query>--%>
    <%--    <c:forEach items="${result.rows}" var="row">--%>
    <%--        ${row.id} : ${row.name}--%>
    <%--    </c:forEach>--%>
</div>

<div>
    <c:set var="functionVar" value="aiueo"/>
    length : ${fn:length(functionVar)}
</div>

<cs:testOne msg="メッセージone" hr="1"/>
<cs:testOne msg="メッセージtwo"/>

<cs:testTwo one="ichi" two="ni" three="san"/>

<div>
    <ul>
        <cs:testThree one="いち" two="に" three="さん">
            <li>${key} : ${value}</li>
        </cs:testThree>
    </ul>
</div>

<div>
    <table border="1">
        <cs:testFour four="よん" five="ご" six="ろく">
            <jsp:attribute name="row">
            <tr>
                <td>${key}</td>
                <td>${value}</td>
            </tr>
            </jsp:attribute>
        </cs:testFour>
    </table>
</div>

<div>
    <csTag:TestFiveTag msg="あいうえお" hr="1"/>
</div>

<csTag:TestSixTag seven="なな" eight="はち" nine="きゅう"/>

<div>
    <table border="1">
        <csTag:TestSevenTag ten="じゅう" eleven="じゅういち" twelve="じゅうに">
            <tr>
                <td>${key}</td>
                <td>${value}</td>
            </tr>
        </csTag:TestSevenTag>
    </table>
</div>

<div>
    <table border="1">
        <csTag:TestEightTag thirteen="じゅうさん" fourteen="じゅうよん" fifteen="じゅうご">
            <jsp:attribute name="row">
            <tr>
                <td>${key}</td>
                <td>${value}</td>
            </tr>
            </jsp:attribute>
        </csTag:TestEightTag>
    </table>
</div>

<div>
    <%= parseNumber(100000000) %>
</div>

<div>
    <div id="number_text">none</div>
    <input type="text" id="input_number" value="10">
    <input type="submit" id="testOne" value="view">
</div>
<a href="index.jsp">index</a>
<script>
    document.getElementById("testOne").addEventListener("click", function () {
        let input_number = document.getElementById("input_number").value;
        fetch("./json?input_number=" + input_number)
            .then(response => response.json())
            .then(data => {
                resultObj = JSON.parse(data)
                document.getElementById("number_text").innerHTML = resultObj.one;
            })
    })
</script>

<div>
    ${cs:getTestOne("taro")}
</div>
</body>
</html>