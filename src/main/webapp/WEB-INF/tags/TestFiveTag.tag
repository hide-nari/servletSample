<%@ tag language="java" pageEncoding="UTF-8" body-content="empty" %>
<%@ attribute name="msg" required="true" rtexprvalue="true" %>
<%@ attribute name="hr" required="false" rtexprvalue="true" %>

<%
    String msg = (String) jspContext.getAttribute("msg");
    String hr = (String) jspContext.getAttribute("hr");
    out.println(msg);
    if (hr.equals("1")) {
        out.print("<hr>");
    }
%>
