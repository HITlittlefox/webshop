<%--
  Created by IntelliJ IDEA.
  User: wu'jia'nan
  Date: 2021/10/3
  Time: 16:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
    request.setCharacterEncoding("UTF-8");
%>
<html>
<head>
    <script language="JavaScript">
        <!--

        function closer(){
            window.close();
        }
        -->
    </script>
</head>
<body>
<div align="center">
    <%
        String name = request.getParameter("name");
        String phonenumber = request.getParameter("phonenumber");
        String city = request.getParameter("city");
        String address = request.getParameter("address");
        String paying = request.getParameter("paying");
    %>

    <table width="750" border="0" cellspacing="1" cellpadding="1">
        <tr>
            <td ><div align="center">
                <table width="80%" border="0" cellpadding="1" cellspacing="1" class="td">
                    <tr>
                        <td colspan="2" align="center">
                            <font color="red">客户您好，以下是您提交的订货单信息，谢谢您。</font>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center">
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td width="40%"align="right">购买人姓名：</td>
                        <td align="left">
                            <%out.println(name);%>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">联系电话：</td>
                        <td align="left">
                            <%out.println(phonenumber);%>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">所在城市：</td>
                        <td align="left">
                            <%out.println(city);%>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">详细地址：</td>
                        <td align="left">
                            <%out.println(address);%>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">付款方式：</td>
                        <td align="left">
                            <%
                                if(paying.equals("1")) out.println("邮政汇款");
                                else out.println("货到付款");
                            %>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center">
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center">
                            <input type=button value="Close" onClick="closer()">
                        </td>
                    </tr>
                </table>
            </div>
            </td>
        </tr>
    </table>
</div>
</body>
</html>

