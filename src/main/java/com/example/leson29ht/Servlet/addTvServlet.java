package com.example.leson29ht.Servlet;

import com.example.leson29ht.DB.tvDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.apache.tomcat.util.http.fileupload.FileItem;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;
import org.apache.tomcat.util.http.fileupload.servlet.ServletRequestContext;

import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;

@WebServlet (name = "addServlet", value = "/addTv")
@MultipartConfig
public class addTvServlet extends HttpServlet {
    private String filePath = "D:\\JAVA\\tasks\\Leson29HT\\src\\main\\webapp\\";
    static final int FILE_MAX_SIZE = 1000*1024;
    static final int MEM_MAX_SIZE = 1000*1024;
    private File file;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req,resp);
    }
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        DiskFileItemFactory diskFileItemFactory = new DiskFileItemFactory();
        diskFileItemFactory.setRepository(new File(filePath));
        diskFileItemFactory.setSizeThreshold(MEM_MAX_SIZE);

        ServletFileUpload upload = new ServletFileUpload(diskFileItemFactory);
        upload.setSizeMax(FILE_MAX_SIZE);
        try {
            List<FileItem> fileItems = upload.parseRequest(new ServletRequestContext(req));
            Iterator<FileItem> iterator = fileItems.iterator();
            while (iterator.hasNext()) {
                FileItem fileItem = iterator.next();
                if (!fileItem.isFormField()) {
                    String fileName = fileItem.getName();
                    if (fileName.lastIndexOf("\\") >= 0) {
                        file = new File(filePath +
                                fileName.substring(fileName.lastIndexOf("\\")));
                    } else {
                        file = new File(filePath +
                                fileName.substring(fileName.lastIndexOf("\\") + 1));
                    }
                    fileItem.write(file);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

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
