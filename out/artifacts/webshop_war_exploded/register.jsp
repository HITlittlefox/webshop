<%--
  Created by IntelliJ IDEA.
  User: wu'jia'nan
  Date: 2021/10/1
  Time: 23:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta http-equiv="Content-Type" content="charset=gb2312">
    <title>注册</title>
    <style>
        * {
            margin: 0;
            padding: 0;
        }

        html {
            height: 100%;
            width: 100%;
            overflow: hidden;
            margin: 0;
            padding: 0;
            background-color: #56536A;
            background-repeat: no-repeat;
            background-size: 100% 100%;
            -moz-background-size: 100% 100%;
        }

        body {
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100%;
        }

        #loginDiv {
            width: 37%;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 300px;
            background-color: rgba(75, 81, 95, 0.3);
            box-shadow: 7px 7px 17px rgba(52, 56, 66, 0.5);
            border-radius: 5px;
        }

        #name_trip {
            margin-left: 50px;
            color: red;
        }

        p {
            margin-top: 10px;
            margin-left: 20px;
            color: azure;
        }

        input{
            margin-left: 15px;
            border-radius: 5px;
            border-style: hidden;
            height: 30px;
            width: 140px;
            background-color: rgba(216, 191, 216, 0.5);
            outline: none;
            color: #f0edf3;
            padding-left: 10px;
        }

        .button {
            border-color: cornsilk;
            background-color: rgba(100, 149, 237, .7);
            color: aliceblue;
            border-style: hidden;
            border-radius: 5px;
            width: 100px;
            height: 31px;
            font-size: 16px;
        }

        h1 {
            text-align: center;
            margin-bottom: 20px;
            margin-top: 20px;
            color: #f0edf3;
        }
    </style>
</head>

<body>
    <div id="loginDiv">
        <form action="">
            <h1>注册</h1>
            <p>用户姓名:<input id="userNname" type="text" autofocus required><label id="name_trip"></label></p>

            <p>用户密码:<input id="password" type="password" required><label id="password_trip"></label></p>

            <p>确认密码:<input id="surePassword" type="password" required><label id="surePassword_trip"></label></p>

            <p style="text-align: center;">
                <input type="submit" class="button" value="提交">
            </p>
        </form>
    </div>

</body>

</html>


