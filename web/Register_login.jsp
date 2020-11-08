<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/7/19 0019
  Time: 08:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录帐号</title>
    <link href="css/Register_login.css" rel="stylesheet" type="text/css"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="js/Ajax_drive.js"></script>
</head>

<script>
    <%--获取是否在登录状态--%>
    window.onload=function(){
        packDate("request","allMessage");
        send("Register_login_check_Servlet");
    }
</script>
    <body
            background="resource/image/login22.jpg"style="
   background-repeat:no-repeat ;
   background-size:100% 100%;
   background-attachment: fixed;">
    <div class="ww">

        <form action="Register_login" method="post">
            <table>
             <tr>
                 <td class="left">用户名</td><td class="right">
            <input class="usrpw" type="text"  placeholder="请输入帐号" name="user_login" >
            <%=request.getAttribute("u_err")== null ? "" : request.getAttribute("u_err") %>
             <tr/>
            <br/>
                <tr>
                    <td class="left">密码</td><td class="right">
            <input class="usrpw" type="password"  placeholder="请输入密码"  name="user_password">
            <%=request.getAttribute("p_err") == null ? "" : request.getAttribute("p_err") %>
                </tr>
                    <br/>
            </table>
            <div class="bulor">
            <span class="button"><input class="sub" type="submit" value="登录帐号"/></span>
            <span class="button"><input class="sub" type="button" value="注册帐号" onclick="javascrtpt:window.location.href='./Register_register.jsp'"
            /></span>
            <%=request.getAttribute("p_login") == null ? "" : request.getAttribute("p_login") %>
            </div>
        </form>
    </div>
    <script>
        <%--获取是否在登录状态--%>
        window.onload=function(){
            packDate("request","allMessage");
            send("Register_login_check_Servlet");
        }
    </script>
    <script language="javascript">
        function Ajax_Drive_Back() {
            if("Register_login_check_Servlet"==backDateAjaxSearch("servlet")){
                if(backDateAjaxSearch("is_login")=="true"){
                    window.location.href("./Cemu_main.jsp");
                }else {

                }
            }
            backDateAjax="";
        }
    </script>
    <footer style="color:white;font-size:25px;float: right;">
        <ul>
            <li>开发人员:杨吉翔 朱修远 刘增升 邹露阳 吴泽龙 尧政</li>
            <li>网站归属权:陈吉 朱林昊 刘增升</li>
        </ul>
    </footer>
    </body>
</html>
