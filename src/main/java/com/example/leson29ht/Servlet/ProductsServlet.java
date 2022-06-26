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
    public void init() throws ServletException {

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


        int page = Integer.parseInt(req.getParameter("page"));
//        int recordsPerPage = Integer.parseInt(request.getParameter("recordsPerPage"));
//
//        var countryService = new CountryService();
//
//        List<Country> countries = countryService.findCountries(currentPage,
//                recordsPerPage);
//
//        request.setAttribute("countries", countries);
//
//        int rows = countryService.getNumberOfRows();
//
//        int nOfPages = rows / recordsPerPage;
//
//        if (nOfPages % recordsPerPage > 0) {
//
//            nOfPages++;
//        }
//
//        request.setAttribute("noOfPages", nOfPages);
//        request.setAttribute("currentPage", currentPage);
//        request.setAttribute("recordsPerPage", recordsPerPage);
//
//        RequestDispatcher dispatcher = request.getRequestDispatcher("listCountries.jsp");
//        dispatcher.forward(request, response);
//    }
//



        int total;
        if(page==1){
            req.setAttribute("tvs", new TvDao().getPage(page,4));
            req.getRequestDispatcher("/products.jsp").forward(req, resp);
        }
        else{
            TvDao td = new TvDao();
            req.setAttribute("tvs",
                    td.getPage(page,4));
            req.getRequestDispatcher("/products.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

}
