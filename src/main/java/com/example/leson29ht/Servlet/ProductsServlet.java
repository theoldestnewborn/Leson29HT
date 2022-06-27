package com.example.leson29ht.Servlet;

import com.example.leson29ht.DB.TvDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet (name = "productsServlet", value = "/products")
public class ProductsServlet extends HttpServlet {


    @Override
    public void init() throws ServletException {
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        int page = Integer.parseInt(req.getParameter("page"));
        req.setAttribute("pageAttribute", page);
        req.setAttribute("tvs", new TvDao().getPage(page, 4));
        req.getRequestDispatcher("/products.jsp").forward(req, resp);
    }
}
