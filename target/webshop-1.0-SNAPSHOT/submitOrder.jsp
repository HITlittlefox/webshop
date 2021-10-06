<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.example.webshop.util.ConnectionUtil" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    request.setCharacterEncoding("UTF-8");

    int orderId = -1;
    Connection connection = ConnectionUtil.getConnection();
    int userId = Integer.parseInt(request.getParameter("user_id"));

    Date orderTime = new Date();
    String address = request.getParameter("address");
    String phone = request.getParameter("phone");
    String orderContent = request.getParameter("order_content");

    System.err.println("address = " + address);

    PreparedStatement addOrder = connection.prepareStatement(
            "insert into order_sheet (user_id, order_time, address, order_content, phone) values (?,?, ?, ?, ?)",
            Statement.RETURN_GENERATED_KEYS
    );
    addOrder.setInt(1, userId);
    addOrder.setDate(2, new java.sql.Date(orderTime.getTime()));
    addOrder.setString(3, address);
    addOrder.setString(4, orderContent);
    addOrder.setString(5, phone);
    addOrder.executeUpdate();
    ResultSet rs = addOrder.getGeneratedKeys();
    if (rs.next()) {
        orderId = rs.getInt(1);
    }

    PreparedStatement clearShoppingCart = connection.prepareStatement("delete from shopping_cart where user_id = ?");
    clearShoppingCart.setInt(1, userId);
    clearShoppingCart.execute();
%>

<html>
    <head>
        <title>提交订单</title>
        <link href="css/category1.css" rel="stylesheet">
    </head>
    <body style="background-color: #56536A;">
        <div align="center">
            <h2>下单成功</h2>
            <hr/>
            <p>您的订单编号为 <%=orderId%>
            </p>
            <form method="get" action="<c:url value="/Category1.jsp"/>">
                <input type="hidden" name="userid" value=<%=userId%>/>
                <input type="submit" value="继续购物"/>
            </form>
        </div>
    </body>
</html>
