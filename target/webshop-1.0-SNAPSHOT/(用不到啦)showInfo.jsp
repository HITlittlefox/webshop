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
    String name = request.getParameter("user");
    String psd = request.getParameter("psd");
    System.out.println(name);
    System.out.println(psd);

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

    if (conn != null) {

        //System.out.println("数据库连接成功！");
%>

<h2><%="数据库连接成功！"%>
</h2>


<%
    }

%><%
    //第一条sql语句！进行insert

    // String sql = "insert into users (name,psd) values ('" + name + "','" + psd + "')";
    // String sql = "insert into users (name,psd) values ('1','2')";
    String sql = "insert into users (name,psd) values ('" + name + "','" + psd + "')";
    System.out.println(sql);
    stmt.execute(sql);
    // sql = "select userid from users where name=" + name;

    // 第二条sql语句！进行select
    sql = "select * from users";
    ResultSet rs = stmt.executeQuery(sql);

    System.out.print("查询结果：");
    System.out.print("<br/>");

    while (rs.next()) {%>
<table>
    <tr>
        <td><%=rs.getString("userid") %>
        </td>
        <td><%=rs.getString("name") %>
        </td>
        <td><%=rs.getString("psd") %>
        </td>
    </tr>
</table>
<%
    }

%>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="css/index.css"/>
        <title>Title</title>

    </head>
    <body>


    </body>
</html>
