<%--
  Created by IntelliJ IDEA.
  User: 翔
  Date: 2020/7/20
  Time: 10:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%--加载Ajax驱动--%>
<script src="js/Ajax_drive.js"></script>
<script>
    function Ajax_Drive_Back() {
        // alert(outAllDate());
        backDateAjax="";
    }
</script>

<script>
    function test() {
        packDate("user_name","123");
        packDate("user_login","1234");
        packDate("user_password","12345");
        send("Ajax_template");
    }
    function Ajax_drive_back() {
        // alert(outAllDate());
    }
</script>
<button onclick="test()">发送数据测试</button>
</body>
</html>
