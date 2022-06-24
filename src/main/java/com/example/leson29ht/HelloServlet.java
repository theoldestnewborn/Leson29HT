package com.example.leson29ht;

import java.io.*;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "tvSets", value = "/hello")
public class HelloServlet extends HttpServlet {



    public void init() {
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        request.getRequestDispatcher("products.jsp").forward(request,response);
    }

    public void destroy() {
    }
}