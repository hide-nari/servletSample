<%@ tag language="java" pageEncoding="UTF-8" dynamic-attributes="items" %>
<%@ variable name-given="key" %>
<%@ variable name-given="value" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<c:forEach items="${items}" var="item">
    <c:set var="key" value="${item.key}"/>
    <c:set var="value" value="${item.value}"/>
    <jsp:doBody/>
</c:forEach>
