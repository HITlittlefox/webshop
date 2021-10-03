<%--
  Created by IntelliJ IDEA.
  User: wu'jia'nan
  Date: 2021/10/3
  Time: 14:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>商城|商品详情</title>

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

            body{
                font-family: 'Microsoft YaHei';
                color:#666;
                font-size:12px;
            }

            .center_con{
                width: 1200px;
                height: 350px;
                margin: 0 auto;
                margin-top: 80px;
            }

            .center_con .main_menu{
                width:350px;
                height:350px;
                overflow:hidden;
            }

            .goods_detail_list{
                width:730px;
                height:350px;
            }

            .goods_detail_list h3{
                font-size:24px;
                line-height:24px;
                color:#666;
                font-weight:normal;
            }

            .goods_detail_list p{
                color:#666;
                line-height:40px;
            }

            .prize_bar{
                height:72px;
                background-color:#fff5f5;
                line-height:72px;
            }

            .prize_bar .show_prize{
                font-size:20px;
                color:#ff3e3e;
                padding-left:20px
            }

            .prize_bar .show_pirze em{
                font-style:normal;
                font-size:36px;
                padding-left:10px
            }

            .prize_bar .show_unit{
                padding-left: 150px;
            }

            .goods_num{
                height: 52px;
                margin-top: 19px;
            }

            .goods_num .num_name{
                width:70px;
                height:52px;
                line-height:52px;
            }

            .goods_num .num_add{
                width:75px;
                height:50px;
                border:1px solid #dddddd;
            }

            .goods_num .num_add .num_show{
                width:49px;
                height:50px;
                text-align:center;
                line-height:50px;
                border:0px;
                outline:none;
                font-size:14px;
                color:#666;
            }

            .goods_num .num_add .add,.goods_num .num_add .minus{
                width:25px;
                line-height:25px;
                text-align:center;
                border-left:1px solid #ddd;
                border-bottom:1px solid #ddd;
                color:#666;
                font-size:14px;
            }

            .goods_num .num_add .minus{
                border-bottom:0px;
            }

            .total{
                height: 35px;
                line-height: 35px;
                margin-top: 25px;
            }

            .total em{
                font-style:normal;
                color:#ff3e3e;
                font-size:18px
            }

            .operate_btn{
                height:40px;
                margin-top:35px;
                font-size:0;
                position:relative;
            }

            .operate_btn .buy_btn,.operate_btn .add_cart{
                display:inline-block;
                width:178px;
                height:38px;
                border:1px solid #c40000;
                font-size:14px;
                color:#c40000;
                line-height:38px;
                text-align:center;
                background-color:#ffeded;
            }

            .operate_btn .add_cart{
                background-color:#c40000;
                color:#fff;
                margin-left:10px;
                position:relative;
                z-index:10;
            }

            body,p,h3,ul,dl,dt,form,input{
                margin:0;
                padding:0;
            }

            ul{
                list-style:none;
            }

            a{
                text-decoration:none;
            }

            em{
                font-style:normal;
            }

            img{
                border:0px;
            }

            h3{
                font-size:100%;
            }

            .clearfix:before,.clearfix:after{
                content:"";
                display:table;
            }

            .clearfix:after{
                clear:both;
            }

            .clearfix{
                zoom:1;
            }

            .fl{
                float:left;
            }

            .fr{
                float:right;
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

        <div class="center_con clearfix">

            <div class="main_menu fl"><img src=""></div>

            <div class="goods_detail_list fr">

                <h3>Iphone13</h3>
                <p>苹果iPhone13是6.1英寸的oled屏幕 ，60hz刷新率，800 尼特最大亮度 (典型);1200 尼特最大亮度 (HDR)，支持超视网膜 XDR 显示， （6.7英寸和5.4英寸分别是苹果13promax和mini）</p>

                <div class="prize_bar">
                    <div class="show_prize fl"> ¥ <em>5999</em></div>
                    <div class="show_unit fl">单位：台</div>
                </div>

                <div class="goods_num clearfix">
                    <div class="num_name fl">数量：</div>
                    <div>
                        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

                        <input id="cut" type="button"  value="-" style="color: red;"/>
                        <input id="num" type="text" style=" width:200px; text-align:center" value="0"/>
                        <input id="add" type="button"  value="+" style="color: blue;"/>
                        <script type="text/javascript">
                            $(function(){
                                var price=0;
                                $("#cut").click(function(){
                                    price=$("#num").val();
                                    if($("#num").val()==0){
                                        return
                                    }
                                    else{
                                        price--;
                                    }
                                    $("#num").val(price);
                                })
                                $("#add").click(function(){
                                    price=$("#num").val();
                                    price++;
                                    $("#num").val(price);
                                })
                            })
                        </script>
                    </div>
                </div>

                <div class="total">总价：<em>5999元</em></div>

                <div class="operate_btn">
                    <a href="" class="buy_btn">立即购买</a>
                    <a href="" class="add_cart">加入购物车</a>
                </div>

            </div>

        </div>

    </body>
</html>

