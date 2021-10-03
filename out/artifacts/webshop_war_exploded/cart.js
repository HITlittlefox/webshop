
$(function(){})
//获得所有的多选框对象
var  fav=document.getElementsByName("fav");

//判断是否全选操作
function checkTest1(th){

    var  flag =th.checked;


    for(var i in fav){

        fav[i].checked=flag;

    }

}
//单选决定全选操作
function  checkTest2(){

    var  flag =true;

    for(var i=1;i<fav.length-1;i++){

        if(!fav[i].checked){

            flag=false;

            break;
        }
    }

    //决定框是否勾选
    fav[0].checked=flag;

    fav[fav.length-1].checked=flag;


    //价格是否统计

    //商品的总价格
    var  zong =0;

    //统计是否有勾选的对象
    var num=0;

    //统计商品的数量
    var spNum=0;

    for(var i=1;i<fav.length-1;i++){


        if(fav[i].checked){

            num++;

            //获得ul父节点
            var par=fav[i].parentNode.parentNode;
            //获得指定ul下面的所有的li
            var li= par.getElementsByTagName("li");

            //单个商品的总价格
            var z=li[6].innerText.split("￥")[1];

            //获得所有商品的总价格
            zong+=Number(z);

            document.getElementById("zongz").innerText=zong;


            //获得商品的数量
            var z2=li[5].getElementsByTagName("input");

            var  num2=z2[0].value;

            spNum+=Number(num2);

            //获得商品数量统计的对象

            document.getElementById("snum").innerText=spNum;

        }

    }


    if(num==0){

        document.getElementById("zongz").innerText=0;

        document.getElementById("snum").innerText=0;

    }

}

//控制数量的增加和减少
function  checkTest3(th,sig){

    var pre;

    if(sig=="1"){
        //获得下一个节点
        pre=th.nextElementSibling;

        if(Number(pre.value)>0){

            //获得节点的value值
            pre.value=Number(pre.value)-1;
        }

    }else {

        //获得上一个节点对象
        pre=th.previousElementSibling;
        //获得节点的value值
        pre.value=Number(pre.value)+1;
    }

    //计算每一个商品总的价格
    //获得每一个商品的单价
    var val=pre.parentNode.previousElementSibling.innerHTML;

    //计算总的价格
    var zong =Number(val)*Number(pre.value);

    //把总的价格赋值给指定的对象

    pre.parentNode.nextElementSibling.innerHTML="￥"+zong;




}

//删除指定的节点
function  checkTest4(th){

    //获得父节点div

    var div=th.parentNode.parentNode.parentNode;

    div.remove();


}

