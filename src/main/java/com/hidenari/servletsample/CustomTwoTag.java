package com.hidenari.servletsample;

import jakarta.servlet.jsp.JspContext;
import jakarta.servlet.jsp.JspException;
import jakarta.servlet.jsp.JspWriter;
import jakarta.servlet.jsp.tagext.DynamicAttributes;
import jakarta.servlet.jsp.tagext.SimpleTagSupport;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

public class CustomTwoTag extends SimpleTagSupport implements DynamicAttributes {
    private Map<String,String> map = new HashMap<>();
    @Override
    public void doTag() throws JspException, IOException {
        JspContext context = getJspContext();
        JspWriter out = context.getOut();
        for (String name : map.keySet()) {
            out.print(name + ":" + map.get(name) + "<br>");
        }
    }

    @Override
    public void setDynamicAttribute(String uri, String localName, Object value) throws JspException {
        map.put(localName, value.toString());
    }
}
