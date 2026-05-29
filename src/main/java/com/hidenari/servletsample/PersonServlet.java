package com.hidenari.servletsample;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;

public class PersonServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html");

        PrintWriter out = response.getWriter();
        out.println("<html><body>");
        out.println("<h1>" + getServletConfig().getInitParameter("initMsg") + "</h1>");
        out.println("<h1>" + getServletContext().getInitParameter("conParam") + "</h1>");
        out.println("</body></html>");
    }

}