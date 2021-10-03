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
<%@ page import="java.util.stream.Collectors" %>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"
      integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="https://cdn.bootcdn.net/ajax/libs/jquery/3.6.0/jquery.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"
        integrity="sha384-aJ21OjlMXNL5UyIl/XNwTMqvzeRMZH2w8c5cRVpzpU8Y5bApTppSuUkhZXN0VxHd"
        crossorigin="anonymous"></script>
<%--todo 映入眼帘的主页--%>

<%
    String userid = request.getParameter("userid");
    System.out.println("youruseridddd" + userid);
%>
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
%>


<!DOCTYPE html>
<html>
    <head>
        <%--        <link rel="stylesheet" type="text/css" href="css/index.css"/>--%>
        <title>商城|主页</title>
        <!-- 引入 layui.css -->
        <link rel="stylesheet" href="//unpkg.com/layui@2.6.8/dist/css/layui.css">
        <meta content="text/html; charset=UTF-8; 750px"/>
    </head>
    <body>
        <div>
            <%
                String f = request.getParameter("userid");
                System.out.println(f);
            %>
            <h1>这里是主页+分类1！</h1>
            <br/>
        </div>
        <%
            //查询节点
            String sql1 = "select * from category where parent_id  is null";
//            String sql1 = "select * from category where parent_id in (select category_id from category where parent_id in (select category_id from category where parent_id is null))";
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
                    //装填对象
                    Category category1 = new Category(id1, name1, parentId1, level1);
                    //循环对象
                    categories2.add(category1);
                }
                System.out.println(categories2);
                // 优化 列转行
                for (Category category : categories1) {
            %>
            <div class="dropdown">
                <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown"
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
                    οnlοad="setFirstIframeHeight('showFrame')" scrolling="no" width="100%" height="500">
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
//            request.getSession().setAttribute("userid", "");

        %>

        <h3>您的用户userid是：
        </h3>
        <h3 id="importMsg"><%=importMsg%>
        </h3>
        <h3><a href="index.jsp">回到首页</a></h3>
    </body>

    <script>
        $('.toggleLink').click(function (event) {
            window.localStorage.setItem('cg', this.getAttribute('proid'))
            // window.localStorage.setItem('userid', request.getParameter("userid"))
            // console.log(this.getAttribute('proid'))
            // this.setAttribute('href', '/webshop_war/hello-servlet?id=' + this.getAttribute('proid') + '&name=' + this.innerHTML)

            // $(document).ready(function () {
            //     var msg = ""
            //     if ($("#importMsg").text() != null) {
            //         msg = $("#importMsg").text();
            //     }
            //     // if (msg != "") {
            //     //     alert(msg);
            //     //
            //     // }
            // });

            <%--var msg = <%=(String) session.getAttribute("userid")%>;--%>

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


