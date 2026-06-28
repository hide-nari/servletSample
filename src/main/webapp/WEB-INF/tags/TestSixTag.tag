<%@ tag language="java" pageEncoding="UTF-8" body-content="empty" dynamic-attributes="items" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<div>
    <c:forEach items="${items}" var="item">
        <c:out value="${item.key}:${item.value}"/><br>
    </c:forEach>
</div>
<hr>
