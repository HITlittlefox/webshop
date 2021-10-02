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
        <!-- 引入 layui.css -->
        <link rel="stylesheet" href="//unpkg.com/layui@2.6.8/dist/css/layui.css">
        <%--        <link rel="stylesheet" type="text/css" href="css/index.css"/>--%>
        <!-- 引入 layui.js -->

        <title>商城|注册</title>
    </head>
    <body style="background-color: #e1ceb8;font-family: 微软雅黑,serif;margin: 0;">
        <div style="align-items: center">
            <h1>欢迎光临注册页面！</h1>
        </div>

        <form method="post" action="register-check.jsp">

            <table>
                <tr>
                    <td>名称</td>
                    <td><input id="user" type="text" name="user" onblur="checkUserNull()"></td>
                </tr>
                <tr>
                    <td>密码</td>
                    <td><input id="psd" type="password" name="psd" onblur="checkPsdNull()"></td>
                </tr>
                <tr>
                <tr>
                    <td>确认密码</td>
                    <td><input placeholder="请再次输入密码" id="psd-check" type="password" name="psd-check"
                               onblur="checkPsdCheckNull;checkPassword()"></td>
                </tr>

            </table>
            <input type="submit" value="注册">
            <%--//todo 密码校验--%>

    </body>
</html>
<script src="//unpkg.com/layui@2.6.8/dist/layui.js">
    function checkUserNull() {
        var value0 = document.getElementById("user").value;
        if (value0 === "") {
            alert("请输入用户名！");
        }
    }

    function checkPsdNull() {
        var value1 = document.getElementById("psd").value;
        if (value1 === "") {
            alert("请输入密码！");
        }
    }

    function checkPsdCheckNull() {
        var value2 = document.getElementById("psd1").value;
        if (value2 === "") {
            alert("请输入确认密码！");
        }
    }


    function checkPassword() {
        var value0 = document.getElementById("user").value;
        var value1 = document.getElementById("psd").value;
        var value2 = document.getElementById("psd-check").value;
        if (value0 === "" || value1 === "") {
            alert("请先输入密码或者确认密码啦QAQ~");
        } else if (value1 === value2) {
            //alert("你输入的两次密码一致-v-");
        } else {
            alert("你输入的两次密码不一致0v0!请重新输入！");
            document.getElementById("psd").value = "";
            document.getElementById("psd-check").value = "";
        }
    }
</script>
