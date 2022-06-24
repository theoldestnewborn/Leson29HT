package com.example.leson29ht.Servlet;

import com.example.leson29ht.DB.TvDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet (name = "productsServlet", value = "/products")
public class ProductsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("tvs", new TvDao().getAll());
        getServletContext().getRequestDispatcher("/products.jsp").forward(req, resp);

    }
}
