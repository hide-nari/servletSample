<%@ tag language="java" pageEncoding="UTF-8" body-content="empty" %>
<%@ attribute name="msg" required="true" rtexprvalue="true" %>
<%@ attribute name="hr" required="false" rtexprvalue="true" %>

<%
    out.println(msg);
    if (hr.equals("1")) {
        out.print("<hr>");
    }
%>
