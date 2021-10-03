<%--
  Created by IntelliJ IDEA.
  User: wu'jia'nan
  Date: 2021/10/3
  Time: 15:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script src="./cart.js"></script>
<!DOCTYPE html>
<html>
    <head>

        <title>商城|购物车</title>
        <style>
            * {
                margin: 0;
                padding: 0;
            }

            html{
                height: 100%;
                width: 100%;
                overflow: hidden;
                margin: 0;
                padding: 0;
                background-color: rgba(216, 191, 216, 0.5);
                background-repeat: no-repeat;
                background-size: 100% 100%;
                -moz-background-size: 100% 100%;
            }

            a{
                text-decoration: none;
            }

            .top{
                width: 100%;
                height: 50px;
                float: top;
                background-color: azure;
                display: flex;
            }

            .welcome{
                color: rgba(52, 56, 66, 0.5);
                text-align: center;
                margin: auto;
                font-family: Arial;
                font-size: 25px;
                font-weight: bold;
                text-shadow: 2px 2px  5px rgba(75, 81, 95, 0.3);
                line-height: 50px;
            }

            .la{
                text-align: right;
                margin: 0px auto 0px auto;
                color: rgba(216, 191, 216, 0.5);
                font-size: 15px;
                line-height: 50px;
                overflow: hidden;
            }

            /*预处理css*/
            body,div,h1,h2,h3,h4,h5,h6,li,ol,ul{margin: 0px; padding: 0px;}

            body{text-align: center;font-size:14px;}

            a{text-decoration: none;}

            li{list-style: none;}

            /*预处理结束*/

            .warp{

                width: 1000px;

                margin: 0px auto;

            }

            .nav_ul2 li{

                float: left;

            }

            .nav_ul1 li{

                float: left;

                line-height: 30px;

                margin-right: 20px;
            }

            .nav_ul1 a,.nav_ul2 a,.nav_ul2 span{

                font-size: 12px;

                color: gray;

            }

            .nav_ul2 li,.nav_ul2 span{

                line-height: 30px;

                margin-left: 15px;

            }

            .nav a:hover{

                color: red;

            }

            .search img{

                clear: both;

                float: left;

            }

            .warp{
                width: 1000px;
                margin: 0px auto;
            }

            /*标题开始*/
            .title{

                margin-top: 130px;

            }

            .title h3{

                float: left;

                font-size: 23px;

                color:#c91623 ;
            }


            .title div{


                float: right;

                font-size: 14px;

                color:gray ;
            }
            /*标题结束*/

            /*显示菜单的开始*/
            .tips{

                width: 1000px;

                height: 50px;

                background-color: #f1f1f1;

                margin-top: 165px;

                border: 1px  solid  #e9e9e9;

            }

            .tips li{

                float: left;

                line-height: 50px;

                font-size: 12px;

                color: gray;



            }

            .tips li:nth-child(1){width: 90px; border-top: 3px solid #c91623 ;}

            .tips li:nth-child(2){margin-left: 80px;}

            .tips li:nth-child(3){margin-left: 430px;}

            .tips li:nth-child(4){margin-left: 70px;}

            .tips li:nth-child(5){margin-left: 110px;}

            .tips li:nth-child(6){margin-left: 50px;}

            /*显示菜单的结束*/


            /*商品详情展示开始*/
            .info{
                width: 1000px;

                height: 125px;


                background-color: #fff4e8;

                border: 1px  solid gray;

                margin-top: 18px;


                border-top: 3px solid  gray;
            }

            .info li{
                float:  left;

                margin-top: 20px;
            }
            .info a{

                font-size: 12px;

                color: #333333;

            }
            .info_1{

                margin-left: 23px;

            }
            .info_2{

                margin-left: 15px;

                border: 1px  solid gray;

            }
            .info_3{

                width: 270px;

                height: 20px;

            }

            .info_4{

                margin-left: 45px;

            }
            .info_5{

                margin-left: 70px;

            }
            .info_6{

                margin-left: 40px;
            }
            .info_6 input{

                width: 30px;

                height: 12px;

                text-align: center;

                position: relative;

                top: -2px;

                left: -5px;

            }

            .info_6 button{

                width: 30px;

                height: 18px;
            }
            .bot{

                position: relative;

                left: -10px;
            }
            .info_7{

                margin-left: 40px;
            }

            /*商品详情展示结束*/


            /*结算模块开始*/

            .balance{

                width: 1000px;

                height: 50px;

                border: 1px  solid  gray;


                margin-top: 30px;

            }

            .balance_ul1,.balance_ul1>li,.balance_ul2>li{

                float: left;

                line-height: 50px;

                margin-left: 14px;


            }
            .balance_ul2{

                float: right;
            }

            .butt{

                width: 100px;

                height: 50px;

                background-color: #C91623;

                border: 0px;

                color: #FFFFFF;

                font-size: 20px;

                font-weight: bold;

            }

            .balance span{


                font-size: 25px;

                color: #C91623 ;

                font-weight: bold;
            }

            /*结算模块结束*/
        </style>

    </head>


    <body>

        <div class="top">

            <div class="welcome">
                <p>欢迎来到网上商城！联系电话：400-888-8888</p>
            </div>

            <div class="la">
                <a href="" >用户</a> <span>|</span>
                <a href="" >订单详情</a> <span>|</span>
                <a href="" >购物车</a> <span>|</span>
            </div>

        </div>
        <!--标题开始-->
        <div class="title warp">

            <h3>全部商品</h3>

            <div>

                <span>配送到</span>

                <select>
                    <option>昌平区</option>

                    <option>顺义区</option>

                    <option>大兴区</option>

                    <option>朝阳区</option>

                    <option>昌平区</option>


                </select>

            </div>

        </div>

        <!--标题结束-->

        <!--显示菜单开始-->
        <div class="tips warp">

            <ul>
                <li>
                    <input type="checkbox" />
                    全选
                </li>
                <li>商品</li>
                <li>单价</li>
                <li>数量</li>
                <li>小计</li>
                <li>操作</li>
            </ul>


        </div>
        <!--显示菜单结束-->

        <!--商品详情展示开始-->
        <div class="info warp">

            <ul>
                <li class="info_1"><input type="checkbox" /> </li>
                <li class="info_2"> <img src="" width="80px"/> </li>
                <li class="info_3"><a>Iphone13</a></li>
                <li class="info_4"><a>颜色：珊瑚色</a> </li>
                <li class="info_5">¥5999</li>
                <li class="info_6">
                    <button>-</button>
                    <input type="text" name=""  value="1" />
                    <button class="bot">+</button>

                </li>
                <li class="info_7">¥5999</li>
                <li>
                    <a>删除</a><br />
                    <a>已到我的关注</a>
                </li>
            </ul>


        </div>

        <div class="info warp">

            <ul>
                <li class="info_1"><input type="checkbox" /> </li>
                <li class="info_2"> <img src="" width="80px"/> </li>
                <li class="info_3"><a>Iphone13</a></li>
                <li class="info_4"><a>颜色：珊瑚色</a> </li>
                <li class="info_5">¥5999</li>
                <li class="info_6">
                    <button>-</button>
                    <input type="text" name=""  value="1" />
                    <button class="bot">+</button>

                </li>
                <li class="info_7">¥5999</li>
                <li>
                    <a>删除</a><br />
                    <a>已到我的关注</a>
                </li>
            </ul>


        </div>

        <div class="info warp">

            <ul>
                <li class="info_1"><input type="checkbox" /> </li>
                <li class="info_2"> <img src="" width="80px"/> </li>
                <li class="info_3"><a>Iphone13</a></li>
                <li class="info_4"><a>颜色：珊瑚色</a> </li>
                <li class="info_5">¥5999</li>
                <li class="info_6">
                    <button>-</button>
                    <input type="text" name=""  value="1" />
                    <button class="bot">+</button>

                </li>
                <li class="info_7">¥5999</li>
                <li>
                    <a>删除</a><br />
                    <a>移到我的关注</a>
                </li>
            </ul>


        </div>
        <!--商品详情展示结束-->

        <!--结算开始-->

        <div class="balance warp">

            <ul class="balance_ul1">
                <li>

                    <input type="checkbox" name="" id="" value="" />
                    全选
                </li>
                <li><a>删除选中商品</a></li>
                <li><a>移到我的关注</a></li>
                <li><a>清除下柜商品</a></li>
            </ul>

            <ul class="balance_ul2">

                <li>已经选择<span>1</span>件商品</li>
                <li>总价 <span>¥5999</span></li>
                <li>
                    <button class="butt">立即购买</button>

                </li>

            </ul>


        </div>


        <!--结算结束-->


    </body>
</html>
