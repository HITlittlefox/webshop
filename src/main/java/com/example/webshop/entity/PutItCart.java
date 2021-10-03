package com.example.webshop.entity;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import java.io.*;
import java.util.*;
import java.sql.*;

import com.example.webshop.entity.Category;

import java.util.stream.Collectors;

@WebServlet(name = "PutItCart", value = "/PutItCart")
public class PutItCart extends HttpServlet {
    private String id;
    private String price;


    public void init() {
        String message = "Hello World!";
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        //设置编码
        request.setCharacterEncoding("UTF-8");
        String id = request.getParameter("id");
        String price = request.getParameter("price");


        String userid = (String) request.getParameter("userid");

//        todo:(已完成)用户名问题完成进度90%。已经可以把userid传递到productid同一页。（但是要吃饭，所以等会再去搞剩下10%）
//        todo:(已完成)同时把userid和productid insert进入数据库。

        //这句话可以让servlet写 html
        response.setContentType("text/html;charset=utf-8");

        request.setAttribute("id", id);
//        request.setAttribute("price", price);
        request.setAttribute("userid", userid);

//        session.setAttribute("userid", userid); //保存到session
//
//        String userid = (String) session.getAttribute("userid");
//        System.out.println("yourUserId" + userid);

        //数据库链接
        String userName = "root";
        String userPassword = "123456";
        String dbName = "web2021";

        //拼接url、解决时区问题、注意等号问题、注意?与&的区分
        String url = "jdbc:mysql://localhost:3306/" + dbName + "?serverTimezone=GMT" + "&user=" + userName + "&password=" + userPassword;


        //装载驱动
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
        } catch (InstantiationException | IllegalAccessException |
                ClassNotFoundException e) {
            e.printStackTrace();
        }

        //实例化链接
        Connection conn = null;
        try {
            conn = DriverManager.getConnection(url);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        Statement stmt = null;
        try {
            stmt = conn.createStatement();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        if (conn != null) {
            System.out.println("数据库连接成功！");
        }

        //第一条sql语句！进行insert
        String sql = "insert into shopping_cart (product_id,user_id) values ('" + id + "','" + userid + "')";
//        String sql = "insert into shopping_cart (product_id,price) values (23,2)";//ok没接收到值所以显示类型不对
        try {
            boolean execute = stmt.execute(sql);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        // 第二条sql语句！进行select
        String sql1 = "select * from users where userid = " + userid + " ";
        System.out.println(sql1);
        ResultSet rs1 = null;
        try {
            rs1 = stmt.executeQuery(sql1);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        try {
            if (rs1.next()) {
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write("<h3>用户信息与商品信息插入购物车成功</h3>");
                System.out.println("rs1插入成功");
//                System.out.println(rs1);
//                System.out.println(rs1.getString("userid"));
//                System.out.println(rs1.getString("name"));
//                System.out.println(rs1.getString("psd"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }


        // 第三条sql语句！进行select
        String sql2 = "select * from products where product_id = " + id + " ";
        System.out.println(sql2);
        ResultSet rs2 = null;
        try {
            rs2 = stmt.executeQuery(sql2);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        try {
            if (rs2.next()) {
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write("<h3>用户信息查找成功</h3>");
                response.sendRedirect("showInfo2.jsp?userid=" + userid + "");

                System.out.println("<h3>rs2查找成功</h3>");
//                System.out.println(rs2);
//                System.out.println(rs2.getString("product_id"));
//                System.out.println(rs2.getString("name"));
//                System.out.println(rs2.getString("des"));
//                System.out.println(rs2.getString("price"));
//                System.out.println(rs2.getString("category_id"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
//        try {
//            if (rs2.next()) {
//                //这里传过去的其实是一个userid，数据库第一列名
//                response.sendRedirect("showInfo2.jsp?userid=" + userid + "");
//            } else {
//                System.out.println("no");
//            }
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
    }

    public void destroy() {
    }


}