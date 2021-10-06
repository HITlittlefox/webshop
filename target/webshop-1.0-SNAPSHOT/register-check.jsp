<%--
  Created by IntelliJ IDEA.
  User: 96361
  Date: 2021/9/28
  Time: 9:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.*,java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.example.webshop.util.ConnectionUtil" %>

<%
    //实例化链接
    Connection conn = ConnectionUtil.getConnection();
    Statement stmt = conn.createStatement();
%>

<%
    //接收register的两个字符串
    String name = request.getParameter("user");
    String psd = request.getParameter("psd");
    System.out.println(name);
    System.out.println(psd);

    //第一条sql语句！进行insert
    PreparedStatement prepared = conn.prepareStatement("insert into users (name, psd) values (?, ?)");
    prepared.setString(1, name);
    prepared.setString(2, psd);
    // String sql = "insert into users (name,psd) values ('" + name + "','" + psd + "')";

    prepared.execute();
    // stmt.execute(sql);

    // 第二条sql语句！进行select
    sql = "select * from users";
    ResultSet rs = stmt.executeQuery(sql);
%>

<html>
    <head>
        <%--        <link rel="stylesheet" type="text/css" href="css/index.css"/>--%>
        <title>注册检查页面</title>
        <!-- 引入 layui.css -->
        <%--        <link rel="stylesheet" href="//unpkg.com/layui@2.6.8/dist/css/layui.css">--%>
        <%--        <link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">--%>
        <meta content="text/html; charset=UTF-8;"/>
        <link rel="stylesheet" href="css/login.css">

    </head>
    <body>
        <% if (rs.next()) {

        %><h1>注册成功，请登录 <a href="login.jsp">返回登陆</a></h1>

        <%
        } else {
        %>
        <h1>注册失败，请重新注册</h1>
        <a href="register.jsp">返回注册页面</a>
        <%
            }
        %>

    </body>
</html>
