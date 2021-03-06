<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.webshop.entity.Category" %><%--
  Created by IntelliJ IDEA.
  User: fudon
  Date: 2021-10-02
  Time: 10:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"
          integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">
    <script src="https://cdn.bootcdn.net/ajax/libs/jquery/3.6.0/jquery.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"
            integrity="sha384-aJ21OjlMXNL5UyIl/XNwTMqvzeRMZH2w8c5cRVpzpU8Y5bApTppSuUkhZXN0VxHd"
            crossorigin="anonymous"></script>
    <head>
        <%--        <link rel="stylesheet" type="text/css" href="css/index.css"/>--%>
        <title>分类</title>
        <!-- 引入 layui.css -->
        <%--        <link rel="stylesheet" href="//unpkg.com/layui@2.6.8/dist/css/layui.css">--%>
        <link rel="stylesheet" href="css/category1.css">

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
    </head>
    <body>

        <div>
            <%
                String id = String.valueOf(request.getAttribute("id"));


                String userid = (String) request.getParameter("userid");
                System.out.println("thisistheUseridAtproduct.jsp:" + userid);


                //查询节点 获取最后一集商品分类
                String sql1 = "select * from category where parent_id = " + id + "";
//            String sql1 = "select * from category where parent_id in (select category_id from category where parent_id in (select category_id from category where parent_id is null))";
                System.out.println(sql1);
                stmt.execute(sql1);
                ResultSet rs1 = stmt.executeQuery(sql1);

                ArrayList<Category> categories1 = new ArrayList<>();
                while (rs1.next()) {
                    Long cid = rs1.getLong("category_id");
                    String name = rs1.getString("name");
                    Integer parentId = rs1.getInt("parent_id");
                    Integer level = rs1.getInt("level");
                    //装填对象
                    Category category = new Category(cid, name, parentId, level);
                    //循环对象
                    categories1.add(category);
                }
            %>

            <div class="dropdown">
                <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown"
                        aria-haspopup="true" aria-expanded="true">
                    <%=request.getAttribute("name")%>
                    <span class="caret"></span>
                </button>

                <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
                    <%
                        for (Category category : categories1) {
                    %>
                    <li><a href="#" class="toggleLink" cid=<%=category.getCategory_id()%>><%=category.getName()%>
                    </a></li>
                    <%}%>
                </ul>
            </div>
            <iframe id="showFrame" src="" frameborder="0" width="100%" height="100%"></iframe>
        </div>
        <%
            //    session.setAttribute("userid", userid); //保存到session
            //    System.out.println("what!" + (String) session.getAttribute("userid"));
            request.getSession().setAttribute("userid", userid);
            System.out.println("whatproductuserid!" + (String) session.getAttribute("userid"));

            //    sessionStorage.setItem("lastname", "Smith");
            //    获取标签中的内容，用jsp和html实现session获取
            String importMsg = "";
            if (request.getSession().getAttribute("userid") != null) {
                importMsg = request.getSession().getAttribute("userid").toString();
                System.out.println(importMsg);
            }
            //      request.getSession().setAttribute("userid", "");

        %>
        <h3 id="importMsg"><%=importMsg%>
        </h3>
    </body>
    <script>
        //点击后跳转到product-Info.jsp
        $('.toggleLink').click(function (event) {
            // window.localStorage.setItem('cg', this.getAttribute('proid'))
            // console.log(this.getAttribute('proid'))
            // this.setAttribute('href', '/webshop_war/hello-servlet?id=' + this.getAttribute('proid') + '&name=' + this.innerHTML)
            $('#showFrame').attr('src', '/webshop_war_exploded/product-Info.jsp?id=' + this.getAttribute('cid') + '&name=' + this.innerHTML + '&userid=' + $("#importMsg").text())
        })
    </script>
</html>
