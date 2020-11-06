<%--
  Created by IntelliJ IDEA.
  User: 翔
  Date: 2020/7/21
  Time: 10:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>账号信息管理</title>
</head>
<body>
    <div>
        <li>
            账号昵称：
            <span id="user_name_">
                <%--账号名称--%>
                游客
            </span>
        </li>
        <li>
            账号id：
            <span id="user_login_">
                <%--账号--%>
                null
            </span>
        </li>
        <li>
            等级：
            <span id="experience_">

            </span>
             经验值：<span id="experience2_" >0/1000</span>
        </li>
        <li>
            是否为游戏管理员：
            <span id="is_admin_"> 否</span>
        </li>
        <li>
            当前拥有元宝：<span id="user_gold">0</span>个
        </li>
        <li>修改密码：<br/><input placeholder="请输入原密码"> <br/>
            <input placeholder="请输入修改后的密码"> <br/>
            <input placeholder="请重复输入修改后的密码"> <button >点击修改</button>
        </li>
        <li>修改账号昵称：<br/>
            <input placeholder="要修改的昵称"> <button >点击修改</button>
        </li>
        <li>申请为管理员：<br/>
            <input placeholder="请输入管理核心码"> <button >点击申请</button>
        </li>
    </div>
</body>
</html>
