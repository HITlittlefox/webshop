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

<%
    //数据库链接
    String userName = "root";
    String userPassword = "123456";
    String dbName = "web2021";

    //拼接url、解决时区问题、注意等号问题、注意?与&的区分
    String url = "jdbc:mysql://localhost:3306/" + dbName + "?serverTimezone=GMT" + "&user=" + userName + "&password=" + userPassword;


    //装载驱动
    try {
        Class.forName("com.mysql.jdbc.Driver").newInstance();
    } catch (InstantiationException | IllegalAccessException | ClassNotFoundException e) {
        e.printStackTrace();
    }

    //实例化链接
    Connection conn = DriverManager.getConnection(url);
    Statement stmt = conn.createStatement();

    if (conn != null) {
%>
<h2><%="数据库连接成功！"%>
</h2>
<%
    }
%>

<%
    //接收register的两个字符串
    String name = request.getParameter("user");
    String psd = request.getParameter("psd");
    System.out.println(name);
    System.out.println(psd);

    //第一条sql语句！进行insert
    String sql = "insert into users (name,psd) values ('" + name + "','" + psd + "')";
    stmt.execute(sql);

    // 第二条sql语句！进行select
    sql = "select * from users";
    ResultSet rs = stmt.executeQuery(sql);
%>

<html>
    <head>
        <%--        <link rel="stylesheet" type="text/css" href="css/index.css"/>--%>
        <title>注册检查页面</title>
        <!-- 引入 layui.css -->
        <link rel="stylesheet" href="//unpkg.com/layui@2.6.8/dist/css/layui.css">

    </head>
    <body>
        <% if (rs.next()) {

        %><h1>注册成功，请登录</h1>
        <a href="login.jsp">返回登陆</a>
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
