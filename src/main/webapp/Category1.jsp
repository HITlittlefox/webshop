<%--
  Created by IntelliJ IDEA.
  User: 96361
  Date: 2021/10/1
  Time: 20:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.example.webshop.entity.Category" %>
<%@ page import="java.util.stream.Collectors" %>
<%@ page import="com.example.webshop.util.ConnectionUtil" %>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"
      integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="https://cdn.bootcdn.net/ajax/libs/jquery/3.6.0/jquery.js"></script>
<script src="https://libs.baidu.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<script src="https://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>

<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"
        integrity="sha384-aJ21OjlMXNL5UyIl/XNwTMqvzeRMZH2w8c5cRVpzpU8Y5bApTppSuUkhZXN0VxHd"
        crossorigin="anonymous"></script>
<%--todo 映入眼帘的主页--%>

<%
    String userid = request.getParameter("userid");
    System.out.println("youruseridddd" + userid);

    Connection conn = ConnectionUtil.getConnection();
    Statement stmt = conn.createStatement();
%>


<!DOCTYPE html>
<html>
    <head>
        <title>商城|主页</title>
        <meta content="text/html; charset=UTF-8;"/>
        <link rel="stylesheet" href="css/category1.css">

    </head>
    <body>
        <div id="loginDiv">
            <h3>这里是商品分类页面！</h3>
            <br/></div>
        <%
            //查询节点
            String sql1 = "select * from category where parent_id  is null";
            //String sql1 = "select * from category where parent_id in (select category_id from category where parent_id in (select category_id from category where parent_id is null))";
            System.out.println(sql1);
            stmt.execute(sql1);
            ResultSet rs1 = stmt.executeQuery(sql1);

            ArrayList<Category> categories1 = new ArrayList<>();
            while (rs1.next()) {
                Long id = rs1.getLong("category_id");
                String name = rs1.getString("name");
                Integer parentId = rs1.getInt("parent_id");
                Integer level = rs1.getInt("level");
                String src = rs1.getString("src");
                //装填对象
                Category category = new Category(id, name, parentId, level, src);
                //循环对象
                categories1.add(category);
            }

        %>
        <%--        <div >--%>
        <%--            &lt;%&ndash;            ; justify-content: center&ndash;%&gt;--%>

        <div style="display: flex; flex-direction: row">
            <%
                List<Long> collect2 = categories1.stream().map(Category::getCategory_id).collect(Collectors.toList());
                String replace = collect2.toString().replace('[', '(');
                String replace1 = replace.replace(']', ')');
                // 节点2
                String sql2 = "select * from category where parent_id in " + replace1;
                System.out.println(sql2);
                stmt.execute(sql2);
                ResultSet rs2 = stmt.executeQuery(sql2);
                ArrayList<Category> categories2 = new ArrayList<>();
                while (rs2.next()) {
                    Long id1 = rs2.getLong("category_id");
                    String name1 = rs2.getString("name");
                    Integer parentId1 = rs2.getInt("parent_id");
                    Integer level1 = rs2.getInt("level");
                    String src1 = rs2.getString("src");
                    //装填对象
                    Category category1 = new Category(id1, name1, parentId1, level1, src1);
                    //循环对象
                    categories2.add(category1);
                }
                System.out.println(categories2);
                // 优化 列转行
                for (Category category : categories1) {
            %>
            <div class="dropdown">
                <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1"
                        data-toggle="dropdown"
                        aria-haspopup="true" aria-expanded="true"><%=category.getName()%>
                    <span class="caret"></span>
                </button>
                <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">

                    <%
                        for (Category category2 : categories2) {
                            if (!(category.getCategory_id().intValue() == category2.getParent_id().intValue())) {
                                continue;
                            }
                    %>
                    <li><a href="#" class="toggleLink" proid=<%=category2.getCategory_id()%>>
                        <%=category2.getName()%>
                    </a></li>
                    <%
                        }%>
                </ul>
            </div>
            <%}%>

        </div>
        <div>
            <%--            <iframe id="showFrame" src="" frameborder="0" scrolling="none" width="100%" height="100%"--%>
            <%--                    src="studentInfo/abstract.html"></iframe>--%>
            <iframe name="showFrame" id="showFrame" frameborder="0"
                    οnlοad="setFirstIframeHeight('showFrame')"
                    scrolling="no" width="100%" height="500">
            </iframe>
        </div>


        <%
            //    session.setAttribute("userid", userid); //保存到session
            //    System.out.println("what!" + (String) session.getAttribute("userid"));
            request.getSession().setAttribute("userid", userid);
            System.out.println("what!" + (String) session.getAttribute("userid"));

            //    sessionStorage.setItem("lastname", "Smith");

            String importMsg = "";
            if (request.getSession().getAttribute("userid") != null) {
                importMsg = request.getSession().getAttribute("userid").toString();
                System.out.println(importMsg);
            }

        %>
        <%--        //todo:style="position" 右上角--%>
        <div class="pos_abs" style="display: flex; flex-direction:column">
            <table>
                <tr>
                    <td>
                        <p>您的用户userid是：
                        </p>
                    </td>
                    <td>
                        <p id="importMsg"><%=importMsg%>
                        </p>
                    </td>
                </tr>
                <tr>
                    <td>
                        <p><a href="index.jsp">回到首页</a></p>
                    </td>
                </tr>
                <tr>
                    <td>
                        <p><a href="showInfo2.jsp?userid=<%=userid%>">[我的购物车]</a></p>
                    </td>
                </tr>
                <tr>
                    <td>
                        <p><a href="showInfo3.jsp?userid=<%=userid%>">[我的订单]</a></p>
                    </td>
                </tr>

            </table>

        </div>
    </body>

    <script>
        //点击后跳转到product.jsp
        $('.toggleLink').click(function (event) {
            window.localStorage.setItem('cg', this.getAttribute('proid'))
            $('#showFrame').attr('src', '/webshop_war_exploded/hello-servlet?id=' + this.getAttribute('proid') + '&name=' + this.innerHTML + '&userid=' + $("#importMsg").text())
        })

        //获取被包含的页面的静态高度，来设置iframe的高度
        function setFirstIframeHeight(value) {
            if (value == "showFrame") {
                var personHeight = jQuery('#showFrame').contents().find("meta").attr("content");
                jQuery('#showFrame').height(personHeight);
            } else if (value == "cell") {
                var cellHeight = jQuery('#cell').contents().find("meta").attr("content");
                jQuery('#cell').height(cellHeight);
            }
        }

    </script>


</html>


