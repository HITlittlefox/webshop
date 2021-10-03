<%--
  Created by IntelliJ IDEA.
  User: 96361
  Date: 2021/9/28
  Time: 9:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>


<html>
    <head>
        <%--        <link rel="stylesheet" type="text/css" href="css/index.css"/>--%>
        <title>商城|登录</title>
        <!-- 引入 layui.css -->
        <link rel="stylesheet" href="css/login.css">
        <%--        <link rel="stylesheet" href="//unpkg.com/layui@2.6.8/dist/css/layui.css">--%>

    </head>
    <body>

        <%
            String f = request.getParameter("login_msg");
            System.out.println(f);
            if (Objects.equals(f, "false")) {
        %>
        <h2>您的登录情况：登陆失败！
        </h2>
        <%
            }
        %>

        <div id="loginDiv">
            <form method="post" action="login-check.jsp" id="form">
                <h1 style="text-align: center;color: aliceblue;">登陆</h1>
                <p>用户:<input id="userName" type="text" name="user"><label id="name_trip"></label></p>

                <p>密码:<input id="password" type="password" name="psd"><label id="password_trip"></label></p>

                <div style="text-align: center;margin-top: 30px;">
                    <input type="submit" class="button" value="登陆">
                    <a href="register.jsp" class="button">注册</a>
                </div>
            </form>
        </div>
    </body>
</html>
