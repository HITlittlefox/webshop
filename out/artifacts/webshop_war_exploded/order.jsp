<%--
  Created by IntelliJ IDEA.
  User: wu'jia'nan
  Date: 2021/10/3
  Time: 16:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<!--suppress ALL -->
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>购物车</title>
    <SCRIPT LANGUAGE="javascript">
            function CheckSubmit()
            {
                if( document.orderform.name.value == "" )
                { alert("购买人姓名!"); document.orderform.name.focus(); return false; }
                if( document.orderform.phonenumber.value == "" )
                { alert("请输入联系电话!"); document.orderform.phonenumber.focus(); return false; }
                if( document.orderform.city.value == "" )
                { alert("请输入购买人所在城市！"); document.orderform.city.focus(); return false; }
                if( document.orderform.address.value == "" )
                { alert("请输入详细地址!"); document.orderform.address.focus(); return false; }
                return true;
            }
    </SCRIPT>
</head>
<body>
<div align="center">
    <table width="750" border="0" cellspacing="1" cellpadding="1">
        <tr>
            <td ><div align="center">
                <table width="80%" border="0" cellpadding="1" cellspacing="1" class="td">
                    <form name="orderform" action="Shopping.jsp" method="post">
                        <tr align="center">
                            <td colspan="2">
                                <font color="red">
                                    为保证您能够及时收到所选择的货品，请如实填写以下信息。
                                </font>
                            </td>
                        </tr>
                        <tr>
                            <td width="30%"align="right">购买人姓名：</td>
                            <td align="left"><input name="name" type="text" size="20">
                            </td>
                        </tr>
                        <tr>
                            <td align="right">联系电话：</td>
                            <td align="left">
                                <input name="phonenumber" type="text" size="20">
                            </td>
                        </tr>
                        <tr>
                            <td align="right">所在城市：</td>
                            <td align="left"><input name="city" type="text" size="20"></td>
                        </tr>
                        <tr>
                            <td align="right">详细地址：</td>
                            <td align="left"><input name="address" type="text" size="50"></td>
                        </tr>
                        <tr>
                            <td align="right">付款方式：</td>
                            <td align="left">
                                <select name="paying">
                                    <option value="1">邮政汇款</option>
                                    <option value="2" selected="selected">货到付款</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" align="center">&nbsp;

                            </td>
                        </tr>
                        <tr>
                            <td align="right">&nbsp;</td>
                            <td align="left">
                                <a href="order1.jsp" style="text-decoration: none">确定</a>
                                <input name="reset" type="reset" value=" 重新填写 ">
                            </td>
                        </tr>
                    </form>
                </table>
            </div>
            </td>
        </tr>
    </table>
</div>
</body>
</html>

