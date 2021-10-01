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
        <title>商城|登录</title>
    </head>
    <body>
        <div style="align-items: center">
            <h1>欢迎光临登录页面！</h1>
        </div>
        <form method="post" action="check.jsp">
            <table>
                <tr>
                    <td>用户名</td>
                    <td><input type="text" name="user"></td>
                </tr>
                <tr>
                    <td>密码</td>
                    <td><input type="password" name="psd"></td>
                </tr>
            </table>

            <input type="submit" value="提交">
            <a href="register.jsp">注册</a>
        </form>
        <%
            String f = request.getParameter("msg");
            System.out.println(f);
            if (Objects.equals(f, "false")) {
        %>
        <h2>您的登录情况：登陆失败！
        </h2>
        <%

            }
        %>
    </body>
</html>
