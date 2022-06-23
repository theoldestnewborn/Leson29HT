package com.example.leson29ht.Servlet;

import com.example.leson29ht.DB.tvDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet (name = "addServlet", value = "/addTv")
public class addTvServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req,resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        tvDao tv = new tvDao();
        String brand = req.getParameter("brand");
        String model = req.getParameter("model");
        String info = req.getParameter("info");
        Integer price = Integer.valueOf(req.getParameter("price"));

        if (brand == null || model == null || info == null || price == null) {
            getServletContext().getRequestDispatcher("/addTv.jsp").forward(req, resp);
        } else {
            tv.addOne(brand, model, info, price);
            req.setAttribute("tv", new tvDao().getAll());
            getServletContext().getRequestDispatcher("/products.jsp").forward(req, resp);
        }
    }
}
