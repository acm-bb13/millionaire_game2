<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/7/21
  Time: 2:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>大富翁游戏菜单</title>
    <link rel="stylesheet" href="css/Cemu_main_style.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.css">
    <script src="../../../../7.24/web/js/Ajax_drive.js"></script>
</head>

<body>

<video src="../../../../7.24/web/resource/video/Mario.mp4" autoplay="autoplay" loop="loop"></video>


<input type="checkbox" id="check">
<label for="check">
    <i class="fas fa-bars" id="btn"></i>
    <i class="fas fa-times" id="cancel"></i>
</label>
<div class="sidebar">
    <header class=""><span class="user_name_">游客</span>，您好！</header>
    <header>大富翁游戏主菜单：
    </header>

    <ul>
        <li><a onclick="Cemu_main_onclick('begin_game')"><i class="fas fa-calendar-week"></i>开始游戏</a></li>
        <li><a onclick="Cemu_main_onclick('register_object')"><i class="fas fa-qrcode"></i>账号管理</a></li>
        <li><a onclick="Cemu_main_onclick('store')"><i class="fas fa-link"></i>游戏商城</a></li>
        <li><a onclick="Cemu_main_onclick('character_record')"><i class="far fa-envelope"></i>成就榜单</a></li>
        <li><a onclick="Cemu_main_onclick('consume_money')"><i class="fas fa-stream"></i>氪金系统<br/>少年，你想变强吗<i class="far fa-question-circle"></i></a></li>
        <li><a onclick="Cemu_main_onclick('register_exit')"><i class="fas fa-times"></i>账号登出</a></li>
    </ul>
</div>

<%--账号管理弹窗--%>
        <div id="light" class="white_content">
            <div class="nav_div">

        <span   class="nav" >
            <a href = "javascript:void(0)" onclick = "document.getElementById('light').style.display='none';document.getElementById('fade').style.display='none'" style="color: white">关闭</a>
        </span>
    </div>
    <span id="yh">账户信息</span>

    <table id="light_objdect">
        <tr>
            <td class="left">账号昵称：</td>
            <td class="center"><span class="user_name_">
                <%--账号名称--%>
                游客
            </span></td>
        </tr>
        <tr>
            <td class="left">账号id：</td>
            <td class="center"><span class="user_login_">
                <%--账号--%>
                null
            </span></td>
        </tr>
        <tr>
            <td class="left">等级：</td>
            <td class="center"><span class="experience_"></span></td>
        </tr>
        <tr>
            <td class="left">经验值：</td>
            <td class="center"><span class="experience2_" >0/1000</span></td>
        </tr>
        <tr>
            <td class="left">是否为游戏管理员：</td>
            <td  class="center"><span class="is_admin_"> 否</span></td>
        </tr>
        <tr>
            <td class="left">当前拥有元宝：</td>
            <td class="center"><span class="user_gold_">0</span>个</td>
        </tr>
        <tr>
            <td class="left">修改密码：</td>
            <td  class="center"><input class="bo" placeholder="请输入修改后的密码" id="pass_word"> <br/></td>
        </tr>
        <tr>
            <td class="left"> </td>
            <td  class="center"><input class="bo" placeholder="请重复输入修改后的密码" id="pass_word2"> </td>

        </tr>
        <tr><td class="left">修改账号昵称：<br/></td>
            <td class="center"><input class="bo" placeholder="要修改的昵称" id="user_name"></td>

        </tr>
        <tr><td class="left">申请为管理员：<br/></td>
            <td  class="center"><input class="bo" placeholder="请输入管理核心码" id="admin_password"> </td>

        </tr>
        <tr>
            <td class="left"> </td>
            <td class="right"><button onclick="">点击修改</button></td>
        </tr>
    </table>
</div>
<%--商城弹窗--%>

<div id="sto" class="white_content">
    <div class="nav_div">

        <span   class="nav" >
            <a href = "javascript:void(0)" onclick = "document.getElementById('sto').style.display='none';document.getElementById('fade').style.display='none'" style="color: white">关闭</a>
        </span>
    </div>
</div>

<%--成就榜单弹窗--%>
<div id="record" class="white_content">
    <div class="nav_div">

        <span   class="nav" >
            <a href = "javascript:void(0)" onclick = "document.getElementById('record').style.display='none';document.getElementById('fade').style.display='none'" style="color: white">关闭</a>
        </span>
    </div>

<div id="re_table">
    <table id="ch_table" >
        <tr bgcolor="#b8860b" style="height: 40px; width: 50px;"  >
            <td class="bor">用户名</td>
            <td class="bor">游戏时长</td>
            <td class="bor">获得成就</td>
            <td class="bor">通关时间</td>
        </tr>
        <tr >
            <td >李狗蛋</td>
            <td >2000h</td>
            <td >无</td>
            <td >7-24</td>
        </tr>
    </table>
</div>
</div>

<%--氪金弹窗--%>
<div id="money" class="white_content_money">
    <div class="nav_div">

        <span   class="nav" >
            <a href = "javascript:void(0)" onclick = "document.getElementById('money').style.display='none';document.getElementById('fade').style.display='none'" style="color: white">关闭</a>
        </span>
    </div>
<div>
    <img id="im" src="resource/image/159.jpg"  width="216" height="336" style="position: fixed" >
</div>
</div>




<div id="fade" class="black_overlay"></div>
<%--背景图片--%>


<script>
    <%--获取是否在登录状态--%>
    window.onload=function(){
        packDate("request","allMessage");
        send("Register_operate_Servlet");
    }
</script>

<script>

    // 信息返回调用
    function Ajax_Drive_Back() {
        if( "allMessage" == backDateAjaxSearch("request" ) && "Register_operate_Servlet"==backDateAjaxSearch("servlet" )){
            if(backDateAjaxSearch("is_login")=="true"){
                alert("登录成功");
                classSetName('user_name_' , backDateAjaxSearch("user_name"));
                classSetName('user_login_' , backDateAjaxSearch("user_login"));
                classSetName('user_gold_' , backDateAjaxSearch("user_gold"));
                classSetName('experience_' , parseInt(backDateAjaxSearch("experience")/1000)+1);
                classSetName('experience2_' , parseInt(backDateAjaxSearch("experience"))%1000 +"/1000");
                classSetName('is_admin_' , backDateAjaxSearch("is_admin"));
            }else {
                alert("登录失败，请重新登录");
                window.location.href='Register_login.jsp';
                return;
            }
        }
        if(  "register_exit" == backDateAjaxSearch("request" ) && "Register_operate_Servlet"==backDateAjaxSearch("servlet" )){
            alert("成功登出，正在跳转至登录页面");
            window.location.href='Register_login.jsp';
        }
        //测试返回的数据
        // alert(outAllDate());
    }

    //菜单点击事件
    function Cemu_main_onclick(key) {

        if(key == "begin_game"){
            //请求服务器跳转至登录界面
            window.location.href='../../../../7.24/web/Game_Play/Game_choose_character.jsp';
        }

        if(key == "register_exit"){
            window.location.href='Register_login.jsp';
            // alert("text-register_exit");
        }
        if(key == "register_object"){
            document.getElementById('light').style.display='block';
            document.getElementById('fade').style.display='block';
        }
        if(key == "store"){
            document.getElementById('sto').style.display='block';
            document.getElementById('fade').style.display='block';
        }
        if(key == "character_record"){
            document.getElementById('record').style.display='block';
            document.getElementById('fade').style.display='block';
        }
        if(key == "consume_money"){
            document.getElementById('money').style.display='block';
            document.getElementById('fade').style.display='block';
        }

    }


    var i=0;
    var arr=new Array();
    arr[0]="resource/image/159.jpg";

    arr[1]="resource/image/213.jpg";

    arr[2]="resource/image/159.jpg";

    arr[2]="resource/image/511.jpg";
    arr[3]="resource/image/0721.jpg";
    arr[4]="resource/image/725.jpg";
    arr[5]="resource/image/823.jpg";

    function slide_photos() {
        var photo = document.getElementById("im");
        if (i == arr.length - 1) {
            i = 0;
        }
        else {
            i += 1;
        }
        photo.src = arr[i];
    }
    setInterval("slide_photos()",100);


</script>


</body>
</html>
