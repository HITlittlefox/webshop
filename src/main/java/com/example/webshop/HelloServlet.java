package com.example.webshop;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.nio.file.FileStore;

@WebServlet(name = "helloServlet", value = "/hello-servlet")
public class HelloServlet extends HttpServlet {
    private static final long serialVersionUID = 3642177431870348721L;
    private String message;


    @Override
    public void init() {
        this.message = "Hello World!";
    }

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        //设置编码
        request.setCharacterEncoding("UTF-8");
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        request.setAttribute("id", id);
        request.setAttribute("name", name);
        String userid = (String) request.getParameter("userid");
        System.out.println("thisistheUseridAtHelloServlet:" + userid);
        request.getRequestDispatcher("/product.jsp" + "?userid=" + userid).forward(request, response);


    }

    @Override
    public void destroy() {
    }
}