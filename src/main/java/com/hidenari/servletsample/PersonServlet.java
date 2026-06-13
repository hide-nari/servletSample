package com.hidenari.servletsample;

import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

public class PersonServlet extends HttpServlet {

    @Override
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        ServletContext context = getServletContext();
        context.log("init");
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        ServletContext context = getServletContext();
        context.log("doGet");
        List<String> lists = List.of("one1", "two2", "three3");
        String numbersStr = "one,two,three";
        request.setAttribute("initMsg", getServletConfig().getInitParameter("initMsg"));
        request.setAttribute("conParam", getServletContext().getInitParameter("conParam"));
        request.setAttribute("flg", Boolean.TRUE);
        request.setAttribute("lists", lists);
        request.setAttribute("numbersStr", numbersStr);
        request.getRequestDispatcher("person.jsp").forward(request, response);
    }

}