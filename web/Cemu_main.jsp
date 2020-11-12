<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/7/21
  Time: 2:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--不知道干啥的，反正得加--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>大富翁游戏菜单</title>
    <link rel="stylesheet" href="css/Cemu_main_style.css">
    <%--加载jq驱动--%>
    <script src="Game_Play/js/jquery-3.5.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.css">
    <script src="js/Ajax_drive.js"></script>
</head>

<body>

<video src="./resource/video/Mario.mp4" autoplay="autoplay" muted="muted" loop="loop"></video>


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

        <span  id="gb" class="nav" >
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
            <td class="right"><button onclick="OnclickUpdate()">点击修改</button></td>
        </tr>
    </table>
</div>



<%--成就榜单弹窗--%>
<div id="record" class="white_content">
    <div class="nav_div">

        <span   class="nav" >
            <a href = "javascript:void(0)" onclick = "document.getElementById('record').style.display='none';document.getElementById('fade').style.display='none'" style="color: white">关闭</a>
        </span>
    </div>

    <div id="re_table">
        <table id="ch_table" style="text-align: center" >
            <tr bgcolor="#b8860b" style="height: 40px; width: 50px;"  >
                <td class="bor">角色名称</td>
                <td class="bor">是否通关</td>
                <td class="bor">记录时间</td>
            </tr>
            <c:forEach begin="1" end="30" var="i">
                <tr>
                        <td style="display: none;" class="ddd_${i}" id="ad_${i}">加载中...</td>
                        <td style="display: none;" class="ddd_${i}" id="bd_${i}">加载中...</td>
                        <td style="display: none;" class="ddd_${i}" id="cd_${i}">加载中...</td>
                </tr>
            </c:forEach>

            <%--<tr >--%>
                <%--<div id="ddd_"  style="display: block;">--%>
                    <%--<td id="ad_" >加载中...</td>--%>
                    <%--<td id="bd_">加载中...</td>--%>
                    <%--<td id="cd_">加载中...</td>--%>
                <%--</div>--%>
            <%--</tr>--%>


        </table>
    </div>
</div>

<%--氪金弹窗--%>
<div id="money" class="white_content_money">
    <div class="nav_div">
        <span>
            <text>
                该二维码为所有开发者的收款码，仅娱乐使用，请勿真的付款！
            </text>
        </span>
        <span   class="nav" >
            <a href = "javascript:void(0)" onclick = "document.getElementById('money').style.display='none';document.getElementById('im').style.display='none' ;document.getElementById('fade').style.display='none'" style="color: white">关闭</a>
        </span>
    </div>
    <div>
        <img id="im" src="resource/image/1.jpg"  width="216" height="336" style="display:none;position: fixed" >
    </div>
</div>




<div id="fade" class="black_overlay"></div>
<%--背景图片--%>


<script>
    <%--获取是否在登录状态--%>
    var list=[];
    window.onload=function(){
        packDate("request","allMessage");
        send("Register_operate_Servlet");
    }
</script>

<script>

    var Register_Message = {
        "is_login":"false",
        "user_name":"游客",
        "user_login":null,
        "user_gold":null,
        "experience":null,
        "password":null,
        "is_admin":null
    };

    // 信息返回调用
    function Ajax_Drive_Back() {
        if( "allMessage" == backDateAjaxSearch("request" ) && "Register_operate_Servlet"==backDateAjaxSearch("servlet" )){
            if(backDateAjaxSearch("is_login")=="true"){
                // alert("登录成功");
                classSetName('user_name_' , backDateAjaxSearch("user_name"));
                classSetName('user_login_' , backDateAjaxSearch("user_login"));
                classSetName('user_gold_' , backDateAjaxSearch("user_gold"));
                classSetName('experience_' , parseInt(backDateAjaxSearch("experience")/1000)+1);
                classSetName('experience2_' , parseInt(backDateAjaxSearch("experience"))%1000 +"/1000");
                classSetName('is_admin_' , backDateAjaxSearch("is_admin"));
                Register_Message.is_admin = true;
                Register_Message.user_name = backDateAjaxSearch("user_name");
                Register_Message.user_login = backDateAjaxSearch("user_login");
                Register_Message.user_gold = backDateAjaxSearch("user_gold");
                Register_Message.experience = backDateAjaxSearch("experience");
                Register_Message.is_admin = backDateAjaxSearch("is_admin");

                list=JSON.parse(backDateAjaxSearch("list"));
                for (var i = 0;i<list.length&&i<30;i++){
                    classSetCss("ddd_"+(i+1),"style","display:block");
                    document.getElementById("ad_"+(i+1)).innerHTML=backDateListAjaxSearch(list[0],"name");
                    document.getElementById("bd_"+(i+1)).innerHTML=
                        (backDateListAjaxSearch(list[0],"is_win")=="true"?
                        "成为了大富翁":
                        "成为了穷鬼");
                    document.getElementById("cd_"+(i+1)).innerHTML=backDateListAjaxSearch(list[0],"date_time");
                }
                for(var i = 30;i>=list.length&&i<=30;i--){
                    classSetCss("ddd_"+i,"style","display:block");
                }

            }else {
                alert("登录失败，请重新登录");
                window.location.href='Register_login.jsp';
                return;
            }
        }
        if(  "register_exit" == backDateAjaxSearch("request" ) && "Register_operate_Servlet"==backDateAjaxSearch("servlet" )){
            window.location.href='Register_login.jsp';
        }

        if(  "UpDate" == backDateAjaxSearch("request" ) && "Register_operate_Servlet"==backDateAjaxSearch("servlet" )){
            classSetName('user_name_' , backDateAjaxSearch("user_name"));
            classSetName('user_login_' , backDateAjaxSearch("user_login"));
            classSetName('user_gold_' , backDateAjaxSearch("user_gold"));
            classSetName('experience_' , parseInt(backDateAjaxSearch("experience")/1000)+1);
            classSetName('experience2_' , parseInt(backDateAjaxSearch("experience"))%1000 +"/1000");
            classSetName('is_admin_' , backDateAjaxSearch("is_admin"));
            Register_Message.is_admin = true;
            Register_Message.user_name = backDateAjaxSearch("user_name");
            Register_Message.user_login = backDateAjaxSearch("user_login");
            Register_Message.user_gold = backDateAjaxSearch("user_gold");
            Register_Message.experience = backDateAjaxSearch("experience");
            Register_Message.is_admin = backDateAjaxSearch("is_admin");
            if(backDateAjaxSearch("admin_password") == "false"){
                alert("申请管理员失败，核心密码错误");
            }
        }
        //测试返回的数据
        // alert(outAllDate());
    }

    //菜单点击事件
    function Cemu_main_onclick(key) {

        if(key == "begin_game"){
            //请求服务器跳转至登录界面
            window.location.href='Game_choose_character.jsp';
        }

        if(key == "register_exit"){
            packDate("request" , "register_exit");
            send("Register_operate_Servlet");
            window.location.href='Register_login.jsp';

            // alert("text-register_exit");
        }
        if(key == "register_object"){
            document.getElementById('light').style.display='block';
            document.getElementById('fade').style.display='block';
        }
        if(key == "store"){
            window.location.href = 'Store_Index.jsp';
        }
        if(key == "character_record"){
            document.getElementById('record').style.display='block';
            document.getElementById('fade').style.display='block';
        }
        if(key == "consume_money"){
            document.getElementById('money').style.display='block';
            document.getElementById('fade').style.display='block';
            document.getElementById('im').style.display='block';
        }

    }

    function OnclickUpdate() {
        if(document.getElementById('pass_word').value == "" && document.getElementById('pass_word2').value == ""){

        }else if(document.getElementById('pass_word').value != document.getElementById('pass_word2').value){
            alert("两次密码不一致");
            packDateClean();
            return ;
        }else {
            // Register_Message.password = document.getElementById('pass_word').value;
            packDate("pass_word" , document.getElementById('pass_word').value);
            // document.getElementById('pass_word').value="";
        }
        if(document.getElementById('user_name').value != ""){
            packDate("user_name",document.getElementById('user_name').value);
        }
        if(document.getElementById('admin_password').value != ""){
            packDate("admin_password",document.getElementById('admin_password').value);
            // Register_Message.admin_password = document.getElementById('admin_password').value;
        }

        if(document.getElementById('pass_word').value == "" &&
            document.getElementById('user_name').value == "" &&
            document.getElementById('admin_password').value == ""){
        }else {
            packDate("request" , "UpDate");
            send("Register_operate_Servlet");
            document.getElementById('pass_word').value="";
            document.getElementById('pass_word2').value="";
            document.getElementById('user_name').value="";
            document.getElementById('admin_password').value="";
        }

    }

    // var i=0;
    // var arr=new Array();
    // arr[0]="resource/image/159.jpg";
    //
    // arr[1]="resource/image/213.jpg";
    //
    // arr[2]="resource/image/159.jpg";
    //
    // arr[2]="resource/image/511.jpg";
    // arr[3]="resource/image/0721.jpg";
    // arr[4]="resource/image/725.jpg";
    // arr[5]="resource/image/823.jpg";
    //
    // function slide_photos() {
    //     var photo = document.getElementById("im");
    //     if (i == arr.length - 1) {
    //         i = 0;
    //     }
    //     else {
    //         i += 1;
    //     }
    //     photo.src = arr[i];
    // }
    // setInterval("slide_photos()",100);
var i = 1;
    setInterval("sb()",50);
    function sb() {
        i++;
        if(i>6){
            i = 1;
        }
        document.getElementById("im").src= "resource/image/"+i+".jpg";
    }
</script>


</body>
<footer style="color:white;font-size:10px;float: right;left: 0%;position: relative;background-color: #000000;">
    <ul>
        <li>请使用电脑端登录</li>
        <li>开发人员：杨吉翔 朱修远 刘增升 邹露阳 吴泽龙 尧政</li>
        <li>网站归属权：陈吉 朱林昊 刘增升</li>
        © 2020-2021 bb13.xyz 版权所有 ICP证：<a href="http://beian.miit.gov.cn/" target="_blank">赣ICP备2020013200号-1</a>
        <li>网站备案负责人：刘增升</li>
    </ul>
</footer>
</html>
