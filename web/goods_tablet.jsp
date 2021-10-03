<%--
  Created by IntelliJ IDEA.
  User: wu'jia'nan
  Date: 2021/10/3
  Time: 10:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>商城|电子商品|平板电脑</title>
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

        .content{
            width: 1200px;
            margin: 25px auto;
        }

        .content .banner .banner_img{
            margin-top: 20px;
        }

        .content .img_content ul{
            width: 1280px;
        }

        .content .img_content ul li{
            width: 360px;
            float: left;
            margin: 0 60px 60px 0;
            list-style: none;
            background-color: #FFFFFF;
            margin-top: 30px;
            height: 500px;
            -webkit-box-shadow: 0 0 5px 3px #ccc;
            -moz-box-shadow: 0 0 5px 3px #ccc;
        }

        .content .img_content .info h3{
            font-size: 25px;
            color: #56536A;
            margin-top: 20px;
            margin-bottom: 20px;
        }

        .content .img_content .info p{
            line-height: 25px;
            margin-bottom: 10px;
        }

        .content .img_content .info{
            margin-left: 30px;
            margin-right: 30px;
        }

        .content .img_content .info .img_btn .price{
            color: #56536A;
            font-size: 20px;
        }

        .content .img_content .info .img_btn{
            width: 300px;
        }
        .content .img_content .info .img_btn .btn{
            width: 60px;
            height: 30px;
            background-color: rgba(216, 191, 216, 0.5);
            text-align: center;
            border-radius: 5px;
            float: right;
        }

        .content .img_content .info .img_btn .btn .cart img{
            width: 60px;
            height: 20px;
            margin-top: 5px;

        }

        .content .img_content .info .img_btn .price{
            float: left;
        }



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

<div class="content">
    <div class="banner">
        <img src="" class="banner_img">
    </div>
    <div class="img_content">
        <ul>
            <li>
                <img src="pic11.jpg" class="img_li">
                <div class="info">
                    <h3>iPad2021</h3>
                    <p>
                        Apple/苹果2021新款iPad 9苹果平板电脑 10.2英寸第九代A13芯片64G官方授权旗舰店原封
                    </p>
                    <div class="img_btn">
                        <div class="price">¥ 4199</div>
                        <div class="btn">
                            <a href="#" class="cart">
                                <img src="pic4.png">
                            </a>
                        </div>
                    </div>
                </div>
            </li>

            <li>
                <img src="pic12.jpg" class="img_li">
                <div class="info">
                    <h3>Mate Pad 11</h3>
                    <p>
                        华为平板MatePad 11平板电脑二合一10.95英寸2021新款ipad全网通话手机pro学生平板M6游戏办公
                    </p>
                    <div class="img_btn">
                        <div class="price">¥ 3999</div>
                        <div class="btn">
                            <a href="#" class="cart">
                                <img src="pic4.png">
                            </a>
                        </div>
                    </div>
                </div>
            </li>

            <li>
                <img src="pic13.jpg" class="img_li">
                <div class="info">
                    <h3>iPad mini</h3>
                    <p>
                        Apple/苹果 iPad mini (第六代) 2021新款iPadmini6迷你平板电脑
                    </p>
                    <div class="img_btn">
                        <div class="price">¥ 3538</div>
                        <div class="btn">
                            <a href="#" class="cart">
                                <img src="pic4.png">
                            </a>
                        </div>
                    </div>
                </div>
            </li>
        </ul>
    </div>
</div>

</body>
</html>
