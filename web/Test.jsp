<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/7/21
  Time: 20:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <title>Title</title>
</head>
<body>
<button onclick="onclick(1)">测试网址1</button>

<script>
    function onclick(i) {
        if(i == 1){
            // alert("dasda");
            window.location.href('http://localhost:8080/PrepareFile/text_game.jsp');
        }

    }
</script>
</body>
</html>
