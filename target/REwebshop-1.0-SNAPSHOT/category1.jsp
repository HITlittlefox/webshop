<%--
  Created by IntelliJ IDEA.
  User: 96361
  Date: 2021/10/7
  Time: 22:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.*,java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.example.rewebshop.util.ConnectionUtil" %>


<%
    //拿到userid，有备无患
    String userid = request.getParameter("userid");
    System.out.println("userid in category1:" + userid);
%>

<%
    //实例化链接
    Connection conn = ConnectionUtil.getConnection();
    Statement stmt = conn.createStatement();
%>
<%
    //拿出第一分类(共3分类)
    String sql = "select * from category where parent_id  is null";
    System.out.println(sql);
    stmt.execute(sql);
    ResultSet rs = stmt.executeQuery(sql);

%>
<!DOCTYPE html>
<html>
    <head>
        <title>商城|一级分类</title>
    </head>
    <body>

        <div>
            <h3>这里是商品一级分类页面！</h3>
        </div>
        <%--while (rs2.next()) {--%>
        <%--1. 需要先把”一级分类“的信息从category取出来--%>
        <table>
            <tr>
                <%while (rs.next()) {%>
                <td>
                    <a href="category2.jsp?categoryid=<%=rs.getString("category_id")%>&userid=<%=userid%>">
                        分类名称：<%=rs.getString("name")%><br>
                        <img style="border-radius:10px;"
                             src="<%=rs.getString("src")%>"
                             alt="这里是图片"
                             height="150"
                             width="200">
                    </a>
                </td>
                <%}%>
            </tr>
        </table>

    </body>
</html>
