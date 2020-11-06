<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/7/17 0017
  Time: 15:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>我的第一个表单</title>
  </head>
  <body>
  <form action="Submit" method="post">
  <input type="text"  placeholder="请输入用户名" name="userName" value="admin">
    <%=request.getAttribute("u_err")== null ? "" : request.getAttribute("u_err") %>
  <br/>
  <input type="password"  placeholder="请输入密码"  name="passWord">
    <%=request.getAttribute("p_err") == null ? "" : request.getAttribute("p_err") %>
    <br/>
  <input type="submit"/>
    <br/>
    <input  type="checkbox" name="sleep" value="睡觉"/>睡觉
    <input  type="radio" name="sex" value="男"/>男
    <input  type="radio" name="sex" value="女"/>女
    <input type="submit"/>
    <input type="reset"/>
    <input type="button" value="普通按钮" onclick="alert(1)">
    <select name="<input_select">">
      <option value="a">a</option>

    </select>
    <textarea cols="20" role="10">你好12345678</textarea>
  </form>
  </body>
</html>
