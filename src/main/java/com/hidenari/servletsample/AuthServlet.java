package com.hidenari.servletsample;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(urlPatterns = "/auth")
public class AuthServlet extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        String user = request.getParameter("j_username");
        String password = request.getParameter("j_password");
        try {
            request.login(user, password);
            out.println("auth success");
        } catch (ServletException e) {
            e.printStackTrace();
            out.println("auth ng");
        }
    }
}