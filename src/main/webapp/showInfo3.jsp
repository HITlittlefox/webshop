<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.example.webshop.util.ConnectionUtil" %>
<%@ page import="com.google.gson.JsonObject" %>
<%@ page import="com.google.gson.JsonArray" %>
<%@ page import="com.google.gson.Gson" %>

<%
    int userid = Integer.parseInt(request.getParameter("userid"));
    System.out.println(userid);

    Connection conn = ConnectionUtil.getConnection();
    Statement stmt = conn.createStatement();

    String sql4name = "select * from users where userid=" + userid + " ";
    ResultSet rs4name = stmt.executeQuery(sql4name);
    rs4name.next();
    String user_name = rs4name.getString("name");

%>


<html>
    <head>
        <title>您的订单页面！</title>
        <link href="css/category1.css" rel="stylesheet">
    </head>
    <body>
        <div class="pos_abs2">
            <h1>这里是<em><%=user_name%>
            </em>的订单页面！</h1>
            <h3><a href="index.jsp">回到首页</a></h3>

            <h3><a href="Category1.jsp?userid=<%=userid%>">返回产品分类页面</a></h3>
        </div>

        <table style="border: 1px solid white">
            <tr>
                <td>订单id</td>
                <td>购买时间</td>
                <td>购买地址</td>
                <td>购买人电话</td>
                <td>订单内容</td>

            </tr>
            <%
                PreparedStatement getOrders = conn.prepareStatement("select * from order_sheet where user_id = ?");
                getOrders.setInt(1, userid);
                ResultSet orders = getOrders.executeQuery();
                while (orders.next()) {
                    String orderId = orders.getString("order_id");
                    String orderTime = orders.getString("order_time");
                    String address = orders.getString("address");
                    String orderContent = orders.getString("order_content");
                    String phone = orders.getString("phone");
                    JsonObject orderContentObject = (new Gson()).fromJson(orderContent, JsonObject.class);
                    JsonArray array = orderContentObject.getAsJsonArray("array");
            %>
            <tr>
                <td><%=orderId%>
                </td>
                <td><%=orderTime%>
                </td>
                <td><%=phone%>
                </td>
                <td><%=address%>
                </td>

                <td>
                    <table style="border: 1px solid white">
                        <tr>
                            <td>商品ID</td>
                            <td>商品名</td>
                            <td>单价</td>
                            <td>购买数量</td>
                            <td>总价</td>
                        </tr>
                        <%
                            for (int i = 0; i < array.size(); i++) {
                                JsonObject piece = array.get(i).getAsJsonObject();
                                int productId = piece.get("productId").getAsInt();
                                int count = piece.get("count").getAsInt();
                                try (PreparedStatement getProduct = conn.prepareStatement("select name, price from products where product_id = ?")) {
                                    getProduct.setInt(1, productId);
                                    try (ResultSet rs = getProduct.executeQuery()) {
                                        if (rs.next()) {
                                            String productName = rs.getString(1);
                                            int price = rs.getInt(2);
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
                        %>
                    </table>
                </td>
            </tr>
            <%
                }
                orders.close();
            %>
        </table>

    </body>
</html>
