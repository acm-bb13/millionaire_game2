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
    <link rel="stylesheet" href="Cemu_main_style.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.css">
    <script src="../js/Ajax_drive.js"></script>
</head>

<body>
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

    <div id="light" class="white_content">这是一个层窗口示例程序.
        <a href = "javascript:void(0)" onclick = "document.getElementById('light').style.display='none';document.getElementById('fade').style.display='none'">点这里关闭本窗口</a>
        <br/>
        <li>
            账号昵称：
            <span class="user_name_">
                <%--账号名称--%>
                游客
            </span>
        </li>
        <li>
            账号id：
            <span class="user_login_">
                <%--账号--%>
                null
            </span>
        </li>
        <li>
            等级：
            <span class="experience_">

            </span>
            经验值：<span class="experience2_" >0/1000</span>
        </li>
        <li>
            是否为游戏管理员：
            <span class="is_admin_"> 否</span>
        </li>
        <li>
            当前拥有元宝：<span class="user_gold_">0</span>个
        </li>
        <li>修改密码：<br/>
            <input placeholder="请输入修改后的密码" id="pass_word"> <br/>
            <input placeholder="请重复输入修改后的密码" id="pass_word2"> <button onclick="">点击修改</button>
        </li>
        <li>修改账号昵称：<br/>
            <input placeholder="要修改的昵称" id="user_name"> <button >点击修改</button>
        </li>
        <li>申请为管理员：<br/>
            <input placeholder="请输入管理核心码" id="admin_password"> <button >点击申请</button>
        </li>
    </div>

    <div id="fade" class="black_overlay"></div>
    <%--背景图片--%>

    <section></section>

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
                    window.location.href("./Register_login.jsp");
                }
            }
            if(  "register_exit" == backDateAjaxSearch("request" ) && "Register_operate_Servlet"==backDateAjaxSearch("servlet" )){
                alert("成功登出，正在跳转至登录页面");
                window.location.href("./Register_login.jsp");
            }
            // alert(outAllDate());
            backDateAjax=[];
        }

        //菜单点击事件
        function Cemu_main_onclick(key) {
            if(key == "register_exit"){
                packDate("request","register_exit");
                send("Register_operate_Servlet");
                // alert("text-register_exit");
            }
            if(key == "register_object"){
                document.getElementById('light').style.display='block';
                document.getElementById('fade').style.display='block';
            }
        }


    </script>


</body>
</html>
