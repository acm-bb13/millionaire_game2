<%--
  Created by IntelliJ IDEA.
  User: Think
  Date: 2020/7/25
  Time: 15:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%--加入jq--%>
    <script src="../Game_Play/js/jquery-3.5.1.min.js"></script>
    <%--加入css--%>
    <link rel="stylesheet" href="../Game_Play/css/Game_choose_character.css">
    <%--加入玩家动画--%>
    <script src="../Game_Play/js/Game_Drive_Paint_Play.js"></script>
    <%--加入物理移动--%>
    <script src="../Game_Play/js/Game_Drive_Move_Speed.js"></script>
    <%--加入本网页的js--%>
    <script src="../Game_Play/js/Game_choose_character.js"></script>
    <%--加载Ajax.js--%>
    <script src="../js/Ajax_drive.js"></script>
</head>
<body style="overflow:hidden">
<script src="../Game_Play/js/Game_Drive_Move_Speed.js"></script>

<%--背景图片--%>
<img src="../Game_Play/resource/Game_Background/Game_background_4.jpg"
     style="position:absolute;
             z-index:1;" width="1024" height="600">

<%--人物--%>
<img id="hero" onclick="onclickHero()" src="../Game_Play/resource/Game_hero/stay/image2267.png" style="position:absolute;transform:rotateY(180deg); top:100px; left:450px; z-index:5" width="90" height="190">


<%--信息窗口--%>
<div id="MessageCreate" class="Message_content" style="position: absolute;top:300px ; left: 300px ; z-index: 4;background:rgba(255,255,255,0.4) ; height: 250px;width: 400px" >
    <table id="Message_objdect" style="text-align: center; margin-left: 55px;">
        <tr>
            <th class="left">创建新人物</th>
        </tr>
        <tr>
            <td class="left">人物名称：</td>
            <td class="center"><span >
                <input id="inputName" placeholder="请给您的人物起一个昵称">
            </span></td>
        </tr>
    </table>
    <div class="left"> <button style="border-radius: 10px; border-color: #584b00; width: 110px;height: 25px" onclick="onclickChoose(1)">创建人物</button>
        <button style="border-radius: 10px; border-color: #584b00; width: 110px;height: 25px" onclick="onclickChoose(2)">返回</button>
    </div>
</div>

<%--测试数据，玩家坐标--%>
<%--测试数据，显示主角的各项参数，等待js控制--%>
<div id="test" style="position:absolute; top:600px; left:0px; z-index:5"> 测试数据加载中..........</div>
</body>
</html>

