<%--
  Created by IntelliJ IDEA.
  User: 96361
  Date: 2021/9/28
  Time: 9:22
  To change this template use File | Settings | File Templates.
--%>

<%--该jsp是可以在注册点击按钮后，显示数据库中所有内容，如果想要使用，请在register.jsp的
   <form method="post" action="register-login-check.jsp"> 中，把action链接到该jsp--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.*,java.util.*" %>
<%@ page import="java.sql.*" %>

<%
    String userid = request.getParameter("userid");
    System.out.println(userid);

    String userName = "root";
    String userPassword = "123456";
    String dbName = "web2021";

//    不拼接url
//    String user = "root";
//    String password = "123456";
//    String url = "jdbc:mysql://localhost:3306/web2021?serverTimezone=GMT";
//    Connection conn = DriverManager.getConnection(url, user, password);


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
    // 第二条sql语句！进行select
    String sql = "select * from shopping_cart where user_id=" + userid + " ";
    ResultSet rs = stmt.executeQuery(sql);
    System.out.print("查询结果：");
    System.out.print("<br/>");
    while (rs.next()) {%>
<table>
    <tr>
        <td>产品id：<%=rs.getString("product_id") %>
        </td>
        <td></td>
        <td></td>
        <td>购买人id：<%=rs.getString("user_id") %>
        </td>
    </tr>
</table>
<%
    }

%>
<html>
    <head>
        <%--        <link rel="stylesheet" type="text/css" href="css/index.css"/>--%>
        <title>Title</title>
        <link rel="stylesheet" href="//unpkg.com/layui@2.6.8/dist/css/layui.css">

    </head>
    <body>


    </body>
</html>
