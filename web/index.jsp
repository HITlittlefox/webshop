<%--
  Created by IntelliJ IDEA.
  User: wu'jia'nan
  Date: 2021/10/1
  Time: 22:47
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en"><head><meta http-equiv="Content-Type" content="charset=UTF-8">

    <title>登陆</title>
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
            margin-top: 30px;
            margin-left: 20px;
            color: azure;
        }

        input {
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
    </style>
</head>

<body>
<div id="loginDiv">
    <form action="file:///D:/web%E8%84%9A%E6%9C%AC/WEB/login.html" id="form">
        <h1 style="text-align: center;color: aliceblue;">登陆</h1>
        <p>用户:<input id="userName" type="text"><label id="name_trip"></label></p>

        <p>密码:<input id="password" type="password"><label id="password_trip"></label></p>

        <div style="text-align: center;margin-top: 30px;">
            <input type="submit" class="button" value="登陆">
            <input type="submit" class="button" value="注册">
        </div>
    </form>
</div>


</body></html>

