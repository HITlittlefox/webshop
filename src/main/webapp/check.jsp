<%--
  Created by IntelliJ IDEA.
  User: 96361
  Date: 2021/9/30
  Time: 8:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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

<html>
    <head>
        <title>Title</title>
    </head>
    <body>
        <%
            String name = request.getParameter("user");
            String psd = request.getParameter("psd");

            String sql = "select userid from users where name ='" + name + "' and psd= '" + psd + "'";
            System.out.println(sql);
            stmt.execute(sql);
            ResultSet rs = stmt.executeQuery(sql);
            if (rs.next()) {

                //这里传过去的其实是一个userid，数据库第一列名
                session.setAttribute("userid", String.valueOf(rs.getString("userid")));
                response.sendRedirect("index.jsp?msg=true");
            } else {
        %>
        <h2>登录失败！
        </h2>
        <%
                response.sendRedirect("login.jsp?msg=false");
            }
        %>
    </body>
</html>
