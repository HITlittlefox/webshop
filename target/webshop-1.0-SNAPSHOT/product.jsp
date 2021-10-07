<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.webshop.entity.Category" %>
<%@ page import="com.example.webshop.util.ConnectionUtil" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

    <%--    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"--%>
    <%--          integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">--%>
    <%--    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>--%>
    <%--    <script src="https://cdn.bootcdn.net/ajax/libs/jquery/3.6.0/jquery.js"></script>--%>
    <%--    <script src="https://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>--%>
    <%--    <script src="https://libs.baidu.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>--%>
    <%--    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"--%>
    <%--            integrity="sha384-aJ21OjlMXNL5UyIl/XNwTMqvzeRMZH2w8c5cRVpzpU8Y5bApTppSuUkhZXN0VxHd"--%>
    <%--            crossorigin="anonymous"></script>--%>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"
          integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">
    <script src="https://cdn.bootcdn.net/ajax/libs/jquery/3.6.0/jquery.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"
            integrity="sha384-aJ21OjlMXNL5UyIl/XNwTMqvzeRMZH2w8c5cRVpzpU8Y5bApTppSuUkhZXN0VxHd"
            crossorigin="anonymous"></script>
    <head>

        <title>分类</title>
        <link rel="stylesheet" href="css/category1.css">
        <%
            Connection conn = ConnectionUtil.getConnection();
            Statement stmt = conn.createStatement();
        %>
    </head>
    <body>

        <div>
            <%
                String id = String.valueOf(request.getAttribute("id"));
                String userid = request.getParameter("userid");
                System.out.println("thisistheUseridAtproduct.jsp:" + userid);

                PreparedStatement getCategoriesStmt = conn.prepareStatement("select * from category where parent_id = ?");
                getCategoriesStmt.setString(1, id);
                ResultSet subCategories = getCategoriesStmt.executeQuery();

                List<Category> categoriesList = new ArrayList<>();
                while (subCategories.next()) {
                    Long cid = subCategories.getLong("category_id");
                    String name = subCategories.getString("name");
                    Integer parentId = subCategories.getInt("parent_id");
                    Integer level = subCategories.getInt("level");
                    String src = subCategories.getString("src");

                    Category category = new Category(cid, name, parentId, level, src);
                    categoriesList.add(category);
                }
            %>

            <div class="dropdown">
                <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown"
                        aria-haspopup="true" aria-expanded="true">
                    <%=request.getAttribute("name")%>
                    <span class="caret"></span>
                </button>

                <ul class="dropdown-menu" style="padding: 0 0;  margin: 2px 2px 2px 2px;"
                    aria-labelledby="dropdownMenu1">
                    <%
                        for (Category category : categoriesList) {
                    %>
                    <li>
                        <div href="#" class="toggleLink" cid=<%=category.getCategory_id()%>>商品名称：<%=category.getName()%>
                        </div>
                        <div>
                            <%--//二级分类src图片                            --%>
                            <img style="border-radius:10px;" href="#" class="toggleLink"
                                 cid=<%=category.getCategory_id()%> src="<%=category.getSrc()%>
                                 alt="这里是图片"
                                 height="150"
                                 width="200">
                        </div>
                    </li>
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
        $('.toggleLink').click(function (event) {
            $('#showFrame').attr('src', '/webshop_war_exploded/product-Info.jsp?id=' + this.getAttribute('cid') + '&name=' + this.innerHTML + '&userid=' + $("#importMsg").text())
        })
    </script>
</html>
