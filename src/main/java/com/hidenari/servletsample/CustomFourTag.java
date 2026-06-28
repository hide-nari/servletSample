package com.hidenari.servletsample;

import jakarta.servlet.jsp.JspContext;
import jakarta.servlet.jsp.JspException;
import jakarta.servlet.jsp.tagext.DynamicAttributes;
import jakarta.servlet.jsp.tagext.JspFragment;
import jakarta.servlet.jsp.tagext.SimpleTagSupport;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

public class CustomFourTag extends SimpleTagSupport implements DynamicAttributes {
    private JspFragment row;

    public void setRow(JspFragment row) {
        this.row = row;
    }

    private Map<String, String> map = new HashMap<>();

    @Override
    public void doTag() throws JspException, IOException {
        JspContext context = getJspContext();
        for (String key : map.keySet()) {
            context.setAttribute("key", key);
            context.setAttribute("value", map.get(key));
            row.invoke(null);
        }
    }

    @Override
    public void setDynamicAttribute(String uri, String localName, Object value) throws JspException {
        map.put(localName, value.toString());
    }
}
