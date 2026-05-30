package com.hidenari.servletsample;

import jakarta.servlet.*;

import java.io.IOException;

public class FilterSample implements Filter {
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        System.out.println("doFilter");
        chain.doFilter(request, response);
    }
}
