package com.hidenari.servletsample;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

public class PersonServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        request.setAttribute("initMsg", getServletConfig().getInitParameter("initMsg"));
        request.setAttribute("conParam", getServletContext().getInitParameter("conParam"));
        request.getRequestDispatcher("person.jsp").forward(request, response);
    }

}