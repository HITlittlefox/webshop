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
        request.setAttribute("id", id);
        request.setAttribute("price", price);


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
        String sql = "insert into shopping_cart (product_id) values ('" + id + "')";
//        String sql = "insert into shopping_cart (product_id,price) values (23,2)";//ok没接收到值所以显示类型不对
        try {
            boolean execute = stmt.execute(sql);
            if (execute) {
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write("insert sucess/.././");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        // 第二条sql语句！进行select
        sql = "select * from shopping_cart where product_id = " + id + " ";
        System.out.println(sql);
        ResultSet rs = null;
        try {
            rs = stmt.executeQuery(sql);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        try {
            if (rs.next()) {
                System.out.println(rs);
                System.out.println(rs.getString("product_id"));
                System.out.println(rs.getString("amount"));
                System.out.println(rs.getString("price"));
                System.out.println(rs.getString("user_id"));
                System.out.println(rs.getString("cart_id"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }


        // 第二条sql语句！进行select
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
                System.out.println(rs2);
                System.out.println(rs2.getString("product_id"));
                System.out.println(rs2.getString("name"));
                System.out.println(rs2.getString("des"));
                System.out.println(rs2.getString("price"));
                System.out.println(rs2.getString("category_id"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void destroy() {
    }


}