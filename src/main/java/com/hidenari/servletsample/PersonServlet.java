package com.hidenari.servletsample;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

public class PersonServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        List<String> lists = List.of("1", "2", "3");
        String numbersStr = "one,two,three";
        request.setAttribute("initMsg", getServletConfig().getInitParameter("initMsg"));
        request.setAttribute("conParam", getServletContext().getInitParameter("conParam"));
        request.setAttribute("flg", Boolean.TRUE);
        request.setAttribute("lists", lists);
        request.setAttribute("numbersStr", numbersStr);
        request.getRequestDispatcher("person.jsp").forward(request, response);
    }

}