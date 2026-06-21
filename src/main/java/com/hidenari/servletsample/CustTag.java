package com.hidenari.servletsample;

import jakarta.servlet.jsp.JspException;
import jakarta.servlet.jsp.JspWriter;
import jakarta.servlet.jsp.tagext.TagSupport;

public class CustTag extends TagSupport {
    private String msg = "init";
    private String hr = "0";

    @Override
    public int doStartTag() throws JspException {
        JspWriter out = pageContext.getOut();
        try {
            out.print(msg);
            if (hr == "1") {
                out.print("<hr>");
            }
        } catch (Exception e) {
            throw new JspException(e);
        }
        return SKIP_BODY;
    }

    public void setMsg(String msg) {
        this.msg = "<div>" + msg + "</div>";
    }

    public void setHr(String hr) {
        this.hr = hr;
    }
}
