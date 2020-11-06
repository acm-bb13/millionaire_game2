<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/7/19
  Time: 20:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册帐号</title>
    <link href="css/Register_register.css" rel="stylesheet" type="text/css"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<style>
    div{ display:inline;}
</style>



<div id="form1">
    <div class="cont">
        <div class="title">用户注册</div>
        <br/>
        <input id="user_login" placeholder="请输入登录帐号"><div id='user_login_'></div>
        <br>
        <input id="user_name" placeholder="请输入帐号昵称" ><div id='user_name_'></div>
        <br>
        <input type="password"  placeholder="请输入密码"  id="user_password"><div id='user_password_'></div>
        <br>
        <input type="password"  placeholder="请重复输入密码"  id="user_password2"><div id='user_password2_'></div>
        <br>
        <input type="submit" value="注册"  name="send" onclick="myclock();register()"><div id='loading_'></div>
        <span>已有账号？<a href="Register_login.jsp">立即登录</a></span>
    </div>

</div>

    <form action="Register_register" method="post">

    </form>

    <script type="text/javascript">
        var interval;
        var date="";
        var isRegister=false;
        var isRegister2 = false;
        var user_login ;
        var user_name ;
        var user_password ;
        var user_password2 ;
        var user_login_check="";
        window.onload = function() {
            interval = setInterval(modTick,500);
        }
        function modTick() {
            var user_login = document.getElementById("user_login").value;
            var user_name = document.getElementById("user_name").value;
            var user_password = document.getElementById("user_password").value;
            var user_password2 = document.getElementById("user_password2").value;
            if(user_login == "" ){
                document.getElementById('user_login_').innerHTML = "帐号不能为空";
                document.getElementById('user_name_').innerHTML = "";
                document.getElementById('user_password_').innerHTML = "";
                document.getElementById('user_password2_').innerHTML = "";
                isRegister=false;
            }else if( user_name == ""){
                document.getElementById('user_password_').innerHTML = "";
                document.getElementById('user_password2_').innerHTML = "";
                document.getElementById('user_name_').innerHTML = "昵称不能为空";
                isRegister2=false;
            }else if(user_password == ""){
                document.getElementById('user_name_').innerHTML = "";
                document.getElementById('user_password2_').innerHTML = "";
                document.getElementById('user_password_').innerHTML = "密码不能为空";
                isRegister2=false;
            }else if(user_password != user_password2){
                document.getElementById('user_name_').innerHTML = "";
                document.getElementById('user_password_').innerHTML = "";
                document.getElementById('user_password2_').innerHTML = "两次输入密码不一致";
                isRegister2=false;
            }else {
                document.getElementById('user_name_').innerHTML = "";
                document.getElementById('user_password_').innerHTML = "";
                document.getElementById('user_password2_').innerHTML = "";
                isRegister2=true;
            }
            if(user_login != "" && user_name != "" && user_login_check != user_login ){
                isRegister=false;
                user_login_check=user_login;
                document.getElementById('user_login_').innerHTML = "账号检测中......";
                xmlHttpRequest=new XMLHttpRequest();
                xmlHttpRequest.onreadystatechange = callback;
                xmlHttpRequest.open("post" , "Register_Register_Servlet_Ajax" ,true);
                xmlHttpRequest.setRequestHeader("Content-Type" , "application/x-www-form-urlencoded");
                xmlHttpRequest.send("user_login="+user_login);
            }
        }
        function myclock() {
            var user_login = document.getElementById("user_login").value;
            var user_name = document.getElementById("user_name").value;
            if(user_login==""){
                alert("账号不能为空！！");
            }else if(user_name==""){
                alert("用户昵称不能为空！！");
            }
        }
        function seach() {

        }
        function callback() {
            if(xmlHttpRequest.readyState == 4 && xmlHttpRequest.status == 200){
                date = xmlHttpRequest.responseText;
                if(date=="true"){
                    document.getElementById('user_login_').innerHTML = "该帐号未被注册，可以使用";
                    isRegister=true;
                }else if(date == "false"){
                    document.getElementById('user_login_').innerHTML = "该帐号已被注册，请更改";
                    isRegister=false;
                }
            }
        }
        function callback2() {
            if(xmlHttpRequest2.readyState == 4 && xmlHttpRequest2.status == 200){
                date = xmlHttpRequest2.responseText;
                alert("注册成功");
                window.location.href='http://localhost:8080/Register_login.jsp';

            }else {
            }
        }
        function register() {
            // alert(document.getElementById('loading_').innerHTML == "");
            if(isRegister && isRegister2 &&document.getElementById('loading_').innerHTML == ""){
                document.getElementById('loading_').innerHTML = "注册中......";
                clearInterval(interval);
                 user_login = document.getElementById("user_login").value;
                 user_name = document.getElementById("user_name").value;
                 user_password = document.getElementById("user_password").value;
                 user_password2 = document.getElementById("user_password2").value;
                xmlHttpRequest2=new XMLHttpRequest();
                xmlHttpRequest2.onreadystatechange = callback2;
                xmlHttpRequest2.open("post" , "Register_register" ,true);
                xmlHttpRequest2.setRequestHeader("Content-Type" , "application/x-www-form-urlencoded");
                xmlHttpRequest2.send("user_login="+user_login+"&user_name="+user_name+"&user_password="+user_password);
            }else {

            }
        }
    </script>

</body>
</html>
