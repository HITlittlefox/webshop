<%--
  Created by IntelliJ IDEA.
  User: wu'jia'nan
  Date: 2021/10/2
  Time: 10:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
    <head>
        <title>商城主页</title>
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

            ul{
                list-style: none;
                display: inline;
            }

            ul,
            li{
                display: inline-block;
            }

            .content{
                width: 1200px;
                margin: 25px auto;
            }

            .content .banner .banner_img{
                margin-top: 20px;
            }

            .content .category ul{
                width: 1280px;
            }

            .content .category ul li{
                width: 360px;
                float: left;
                margin: 0 60px 60px 0;
                list-style: none;
                background-color: azure;
                margin-top: 30px;
                height: 500px;

                -webkit-box-shadow: 0 0 5px 3px #ccc;
                -moz-box-shadow: 0 0 5px 3px #ccc;
            }

            .content .category .goods p{
                font-size: 25px;
                font-weight: bold;
                color: #56536A;
                margin-top: 20px;
                margin-bottom: 20px;
                line-height: 25px;
            }

            .content .category .goods {
                margin-left: 30px;
                margin-right: 30px;
            }

            .content .category .goods a{
                font-size: 18px;
                color: #56536A;
                margin-top: 20px;
                margin-bottom: 20px;
                line-height: 60px;
            }
        </style>

    </head>

<body>
    <!--顶部简介和用户信息栏 -->
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

    <!--三大类以及细分的三小类 -->
    <div class="content">
        <div class="banner">
            <img src="" class="banner_img">
        </div>
        <div class="category">
            <ul>
                <li>
                    <img src="pic1.jpg" class="pic">
                    <div class="goods">
                        <p>电子商品</p>
                        <a href="" class="next">手机</a>
                        <br>
                        <a href="" class="next">平板电脑</a>
                        <br>
                        <a href="" class="next">笔记本电脑</a>
                    </div>
                </li>

                <li>
                    <img src="pic2.jpg" class="pic">
                    <div class="goods">
                        <p>书籍书本</p>
                        <a href="" class="next">四六级教辅资料</a>
                        <br>
                        <a href="" class="next">小说</a>
                        <br>
                        <a href="" class="next">散文</a>
                    </div>
                </li>

                <li>
                    <img src="pic3.jpg" class="pic">
                    <div class="goods">
                        <p>服装服饰</p>
                        <a href="" class="next">裙子</a>
                        <br>
                        <a href="" class="next">衬衫</a>
                        <br>
                        <a href="" class="next">裤子</a>
                    </div>
                </li>
            </ul>
        </div>

    </div>

</body>
</html>
