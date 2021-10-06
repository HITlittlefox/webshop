<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.*,java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.example.webshop.util.ConnectionUtil" %>
<%@ page import="com.google.gson.JsonObject" %>
<%@ page import="com.google.gson.JsonArray" %>
<%@ page import="com.google.gson.Gson" %>

<%
    String userid = request.getParameter("userid");
    System.out.println(userid);

    //实例化链接
    Connection conn = ConnectionUtil.getConnection();
    Statement stmt = conn.createStatement();

    String sql4name = "select * from users where userid=" + userid + " ";
    ResultSet rs4name = stmt.executeQuery(sql4name);
    rs4name.next();
    String user_name = rs4name.getString("name");

%>


<html>
    <head>
        <meta charset="utf-8">
        <title>您的购物车页面！</title>
        <link href="css/category1.css" rel="stylesheet">
    </head>
    <body>
        <div class="pos_abs2">
            <h1>这里是<em><%=user_name%>
            </em>的购物车页面！</h1>
            <h3><a href="index.jsp">回到首页</a></h3>

            <h3><a href="Category1.jsp?userid=<%=userid%>">返回产品分类页面</a></h3>
        </div>
        <table style="border: 1px white solid">
            <tr>
                <td>产品id</td>
                <td>产品名称</td>
                <td>单价</td>
                <td>购买数量</td>
                <td>总价</td>
            </tr>
            <%
                String sql = "select * from shopping_cart where user_id=" + userid + " ";
                ResultSet rs = stmt.executeQuery(sql);

                JsonObject object = new JsonObject();
                JsonArray array = new JsonArray();

                while (rs.next()) {
                    int productId = rs.getInt("product_id");
                    int userId = rs.getInt("user_id");
                    int count = rs.getInt("amount");

                    JsonObject piece = new JsonObject();
                    piece.addProperty("productId", productId);
                    piece.addProperty("userId", userId);
                    piece.addProperty("count", count);

                    array.add(piece);

                    try (PreparedStatement getProduct = conn.prepareStatement("select name, price from products where product_id = ?")) {
                        getProduct.setInt(1, productId);
                        try (ResultSet product = getProduct.executeQuery()) {
                            if (product.next()) {
                                String productName = product.getString(1);
                                int price = product.getInt(2);
                                int total = price * count;
            %>
            <tr>
                <td><%=productId%>
                </td>
                <td><%=productName%>
                </td>
                <td><%=price%>
                </td>
                <td><%=count%>
                </td>
                <td><%=total%>
                </td>
            </tr>
            <%
                            }
                        }
                    }
                }
                object.add("array", array);
                String orderContent = (new Gson()).toJson(object);
                System.err.println("orderContent = " + orderContent);
            %>
        </table>

        <%
            String flagOrder = request.getParameter("flagOrder");
            System.out.println("yourflagis" + flagOrder);

        %>
        <form method="post" action="submitOrder.jsp" accept-charset="UTF-8" charset="UTF-8">
            <input type="hidden" name="user_id" value="<%=userid%>"/>
            <input type="hidden" name="order_content" value=<%=orderContent%>/>
            <table>
                <tr>
                    <td>地址</td>
                    <td><input class="button" type="text" name="address"></td>
                </tr>
                <tr>
                    <td>电话号码</td>
                    <td><input class="button" type="text" name="phone"></td>
                </tr>
            </table>
            <input type="submit" value="提交">
        </form>
    </body>
</html>
