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

    String sql4name = "select * from users where userid=" + userid + " ";
    ResultSet rs4name = stmt.executeQuery(sql4name);
    rs4name.next();
    String user_name = rs4name.getString("name");

//    while (rs4name.next()) {
//        String user_name = rs4name.getString("name");
//    }
//    String user_name = rs4name.getString("name");

%>


<html>
    <head>
        <%--        <link rel="stylesheet" type="text/css" href="css/index.css"/>--%>
        <title>您的购物车页面！</title>
        <%--        <link rel="stylesheet" href="//unpkg.com/layui@2.6.8/dist/css/layui.css">--%>
            <%--        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">--%>
        <link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">

    </head>
    <body>
        <h1>这里是<em><%=user_name%>
        </em>的购物车页面！</h1>
        <h3><a href="index.jsp">回到首页</a></h3>

        <h3><a href="Category1.jsp?userid=<%=userid%>">返回产品分类页面</a></h3>


        <%--        <form method="post" action="showInfo2.jsp?userid=<%=userid%>">--%>

        <table>
            <% // 第二条sql语句！进行select
                String sql = "select * from shopping_cart where user_id=" + userid + " ";
                ResultSet rs = stmt.executeQuery(sql);
                while (rs.next()) {
            %>
            <tr>
                <td>产品id：<%=rs.getString("product_id") %>
                </td>
                <td>购买人姓名：<%=user_name%>
                </td>
                <td>&nbsp;&nbsp;&nbsp;</td>
                <td>购买人id：<%=rs.getString("user_id") %>
                </td>
                <td><input type="hidden" name="user_name" value="<%=rs.getString("product_id") %>">
                </td>
                <td><input type="hidden" name="product_id" value="<%=user_name%>">
                </td>
                <td><input type="hidden" name="user_id" value="<%=rs.getString("user_id") %>">
                </td>

            </tr>
            <%
                }
            %>
        </table>

        <%
            String order_flag = (String) request.getParameter("order_flag");
            System.out.println("yourflagis" + order_flag);
            String address = request.getParameter("address");
            String order_time = request.getParameter("order_time");

            if (Objects.equals(order_flag, "true")) {

                //第一条sql语句！对订单表单进行insert
                String sql3 = "insert into order_sheet (user_id,address,order_time) values ('" + userid + "','" + address + "','" + order_time + "')";
                stmt.execute(sql3);
                System.out.println(sql3);
        %>
        <%

            } else {
                address = "";
                order_time = "";

            }
        %>
        <form method="post" action="showInfo2.jsp?userid=<%=userid%>&order_flag=true">
            <table>
                <tr>
                    <td>地址</td>
                    <% if (!Objects.equals(order_flag, "true")) {
                    %>
                    <td>
                        <input type="text" name="address">
                    </td>
                    <%
                        }
                    %>
                    <td><%=address%>
                    </td>
                </tr>
                <tr>
                    <td>下单日期</td>
                    <% if (!Objects.equals(order_flag, "true")) {
                    %>
                    <td>
                        <input type="text" name="order_time">
                    </td>
                    <%
                        }
                    %>
                    <td><%=order_time%>
                    </td>
                </tr>
            </table>
            <input type="submit" value="提交"
                   onclick="document.getElementsByName(address).hidden='hidden';document.getElementsByName(order_time).hidden='hidden'">
        </form>

        <% if (Objects.equals(order_flag, "true")) {
        %>
        <h2>您已下单！感谢您的购买！</h2>
        <%
            }
        %>

    </body>
    <script type="text/javascript">
        function doSubmit(formId, actionUrl, target) {
            var targetForm = document.getElementById(formId);
            targetForm.action = actionUrl;//表单提交的地址
            targetForm.target = target;//提交后显示结果的页面
            targetForm.submit();
        }
    </script>
</html>
