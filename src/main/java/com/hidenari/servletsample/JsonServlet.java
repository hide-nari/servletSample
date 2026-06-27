package com.hidenari.servletsample;

import com.google.gson.Gson;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(urlPatterns = "/json")
public class JsonServlet extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        Gson gson = new Gson();
        String input_number = request.getParameter("input_number");
        String json = gson.toJson("{\"one\":" + input_number + ",\"two\":456,\"three\":789}");
        response.setContentType("application/json;charset=UTF-8");
        response.getWriter().print(json);
    }

}