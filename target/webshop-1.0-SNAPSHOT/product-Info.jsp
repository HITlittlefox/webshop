<%--
  Created by IntelliJ IDEA.
  User: fudon
  Date: 2021-10-02
  Time: 13:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.example.webshop.entity.Category" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.webshop.entity.Product" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <link rel="stylesheet" type="text/css" href="css/index.css"/>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"
          integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">
    <script src="https://cdn.bootcdn.net/ajax/libs/jquery/3.6.0/jquery.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"
            integrity="sha384-aJ21OjlMXNL5UyIl/XNwTMqvzeRMZH2w8c5cRVpzpU8Y5bApTppSuUkhZXN0VxHd"
            crossorigin="anonymous"></script>
    <head>
        <title>分类</title>
        <!-- 引入 layui.css -->
        <%--        <link rel="stylesheet" href="//unpkg.com/layui@2.6.8/dist/css/layui.css">--%>
        <link rel="stylesheet" href="css/category1.css">
        <link rel="stylesheet" href="css/proinfo.css">


        <title>商品详情</title>
    </head>
    <body>
        <div>
            <%--    <%=request.getParameter("id")%>--%>
            <%--    <%=request.getParameter("name")%>--%>

            <%
                //数据库链接
                String userName = "root";
                String userPassword = "123456";
                String dbName = "web2021";

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

                if (conn != null) {
                }
            %>
            <ul>
                <%

                    String id = String.valueOf(request.getAttribute("id"));
//                    String userid = request.getParameter("userid");
                    String userid = (String) request.getParameter("userid");
                    System.out.println("yourUserIdInProduct-info.jsp" + userid);
                    //查询节点 获取最后一集商品分类
                    String sql1 = "select * from products where category_id = " + request.getParameter("id") + "";
//            String sql1 = "select * from category where parent_id in (select category_id from category where parent_id in (select category_id from category where parent_id is null))";
                    System.out.println(sql1);
                    stmt.execute(sql1);
                    ResultSet rs1 = stmt.executeQuery(sql1);

                    ArrayList<Product> products = new ArrayList<>();
                    while (rs1.next()) {
                        Long cid = rs1.getLong("product_id");
                        String name = rs1.getString("name");
                        String des = rs1.getString("des");
                        Integer price = rs1.getInt("price");
                        Integer categoryId = rs1.getInt("category_id");
                        //装填对象
                        Product product = new Product(cid, name, des, price, categoryId);
                        //循环对象
                        products.add(product);
                    }

                    for (Product product : products) {
                        Long buyId = product.getProductId();
                        String buyName = product.getName();
                        String buyDes = product.getDes();
                        Integer buyPrice = product.getPrice();
                        Integer buyCategoryId = product.getCategoryId();
                %>
                <li>
                    <%--            <img src="" alt="" style="display: block;" width="100%">--%>
                    <div><a href="#">详情</a></div>
                    <div class=""><%=product.getName()%>
                    </div>
                    <div class="price"><%=product.getPrice()%>
                    </div>
                    <div>
                        <a href='/webshop_war_exploded/PutItCart?id=<%=product.getProductId()%>&price=<%=product.getPrice()%>&userid=<%=userid%>'>添加到购物车</a>
                    </div>
                    <%--                    <div>--%>
                    <%--                        <a href='/webshop_war_exploded/Category1.jsp?userid=<%=userid%>'>返回目录</a>--%>
                    <%--                    </div>--%>
                </li>
                <%}%>
            </ul>
        </div>
    </body>
</html>
