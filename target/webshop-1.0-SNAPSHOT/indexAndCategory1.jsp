<%--
  Created by IntelliJ IDEA.
  User: 96361
  Date: 2021/10/1
  Time: 20:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.*,java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.example.webshop.entity.Category" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%--todo 映入眼帘的主页--%>

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
%>
<h2><%="数据库连接成功！"%>
</h2>
<%
    }
%>
<%
    //查询所有父节点，也就是一级菜单
    String sql1 = "select * from category where parent_id is null";
    System.out.println(sql1);
    stmt.execute(sql1);
    ResultSet rs1 = stmt.executeQuery(sql1);

    ArrayList<Category> categories1 = new ArrayList<>();
    while (rs1.next()) {
        Long id = rs1.getLong("category_id");
        String name = rs1.getString("name");
        Integer parentId = rs1.getInt("parent_id");
        Integer level = rs1.getInt("level");
        //装填对象
        Category category = new Category(id, name, parentId, level);
        //循环对象
        categories1.add(category);
    }

%>


<%
    //查询所有二级节点
    String sql2 = "select * from category where parent_id in (select category_id from category where parent_id is null)";
    System.out.println(sql2);
    stmt.execute(sql2);
    ResultSet rs2 = stmt.executeQuery(sql2);

    ArrayList<Category> categories2 = new ArrayList<>();
    while (rs2.next()) {
        Long id = rs2.getLong("category_id");
        String name = rs2.getString("name");
        Integer parentId = rs2.getInt("parent_id");
        Integer level = rs2.getInt("level");
        //装填对象
        Category category2 = new Category(id, name, parentId, level);
        //循环对象
        categories2.add(category2);
    }

%>

<%
    //查询所有三级节点
    String sql3 = "select * from category where parent_id in (select category_id from category where parent_id in (select category_id from category where parent_id is null))";
    System.out.println(sql3);
    stmt.execute(sql3);
    ResultSet rs3 = stmt.executeQuery(sql3);

    ArrayList<Category> categories3 = new ArrayList<>();
    while (rs3.next()) {
        Long id = rs3.getLong("category_id");
        String name = rs3.getString("name");
        Integer parentId = rs3.getInt("parent_id");
        Integer level = rs3.getInt("level");
        //装填对象
        Category category3 = new Category(id, name, parentId, level);
        //循环对象
        categories3.add(category3);
    }

%>


<!DOCTYPE html>
<html>
    <head>
        <title>这里是主页+分类1！</title>
        <link rel="stylesheet" type="text/css" href="css/index.css"/>

    </head>
    <body>
        <div>
            <h1>这里是主页+分类1！</h1>
            <br/>
        </div>

        <%--        <c:forEach items="" var="i" begin="1" end="5">--%>
        <%--        Item <c:out value="${i}"/><p>--%>
        <%--        </c:forEach>--%>

        <%--        todo :循环 第一层--%>
        <%
            for (Category category1 : categories1) {
        %>
        <a href="javascript:onclick=show() "><%=category1.getName()%>
        </a>
        <ul id="art" class="no_circle">

            <%--        todo :循环 第二层--%>
            <%
                for (Category category2 : categories2) {
            %>
            <a href="javascript:onclick=show2() "><%=category2.getName()%>
            </a>
            <li id="tietu" class="no_circle">
                <%--        todo :循环 第三层--%>
                <%
                    for (Category category3 : categories3) {
                %>
                <a href="javascript:onclick=show3() "><%=category3.getName()%>
                </a>
                <ol id="fangchan" class="no_circle">
                </ol>
                <%
                    }
                %>

            </li>

            <%
                }
            %>

        </ul>

        <%
            }
        %>

    </body>
</html>


<script type="text/javascript">
    function show() {
        if (document.getElementById("art").style.display == 'block') {
            document.getElementById("art").style.display = 'none';
            //触动的ul如果处于显示状态，即隐藏
        } else {
            document.getElementById("art").style.display = 'block';
            //触动的ul如果处于隐藏状态，即显示
        }
    }

    function show2() {
        if (document.getElementById("tietu").style.display == 'block') {
            document.getElementById("tietu").style.display = 'none';
            //触动的ul如果处于显示状态，即隐藏
        } else {
            document.getElementById("tietu").style.display = 'block';
            //触动的ul如果处于隐藏状态，即显示
        }
    }

    function show3() {
        if (document.getElementById("fangchan").style.display == 'block') {
            document.getElementById("fangchan").style.display = 'none';
            //触动的ul如果处于显示状态，即隐藏
        } else {
            document.getElementById("fangchan").style.display = 'block';
            //触动的ul如果处于隐藏状态，即显示
        }
    }


    function show4() {
        if (document.getElementById("yule").style.display == 'block') {
            document.getElementById("yule").style.display = 'none';
            //触动的ul如果处于显示状态，即隐藏
        } else {
            document.getElementById("yule").style.display = 'block';
            //触动的ul如果处于隐藏状态，即显示
        }
    }

</script>