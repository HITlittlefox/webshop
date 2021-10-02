<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.*,java.util.*" %>
<%@ page import="java.sql.*" %>


<%--todo 映入眼帘的主页--%>

<!DOCTYPE html>
<html>
    <head>
        <title>BigWebShop</title>
        <link rel="stylesheet" type="text/css" href="css/index.css"/>

    </head>
    <body>
        <div>
            <%
                String f = request.getParameter("msg");
                System.out.println(f);
                if (Objects.equals(f, "true")) {
            %>
            <h2>您登录成功啦
            </h2>
            <%
                }
            %>
            <h1>电子商城首页</h1>
            <br/>

            <br/><br/><br/>
        </div>
        <div>
            <table>
                <tr>
                    <td>
                        <h2><a href="login.jsp">登录</a></h2>
                    </td>
                    <td></td>
                    <td>
                        <h2><a href="register.jsp">注册</a></h2>
                    </td>
                </tr>
            </table>
        </div>

    </body>
</html>