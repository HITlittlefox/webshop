<%--
  Created by IntelliJ IDEA.
  User: 96361
  Date: 2021/9/28
  Time: 9:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>商城|注册</title>
    </head>
    <body>
        <div style="align-items: center">
            <link rel="stylesheet" type="text/css" href="css/index.css"/>
            <h1>欢迎光临注册页面！</h1>
        </div>

        <form method="post" action="register-check.jsp">

            <table>
                <tr>
                    <td>名称</td>
                    <td><input type="text" name="user"></td>
                </tr>
                <tr>
                    <td>密码</td>
                    <td><input type="password" name="psd"></td>
                </tr>
                <tr>
                <tr>
                    <td>密码确认</td>
                    <td><input type="password" name="psd1"></td>
                </tr>

            </table>
            <input type="submit" value="注册">
            <%--//todo 密码校验--%>


    </body>
</html>
