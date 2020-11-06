<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/7/21
  Time: 23:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%--不知道干啥的，反正得加--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
    <meta charset="utf-8">
    <title>大富翁游戏界面</title>
    <%--加载jq驱动--%>
    <script src="Game_Play/js/jquery-3.5.1.min.js"></script>

    <%--加载本界面控制css--%>
    <link href="Game_Play/css/Game_Style_1.css" rel="stylesheet" type="text/css"/>

    <%--加载本界面控制js--%>
    <script src="Game_Play/js/Game_Drive_begain.js"></script>

    <%--加载Ajax.js--%>
    <script src="js/Ajax_drive.js"></script>

    <%--加载主角动画驱动--%>
    <script src="Game_Play/js/Game_Drive_Paint_Play.js"></script>

    <%--加载骰子动画驱动--%>
    <script src="Game_Play/js/Game_Drive_Paint_Number.js"></script>

    <%--加载光效动画驱动--%>
    <script src="Game_Play/js/Game_Drive_Paint_Light_1.js"></script>

    <%--加载格子动画驱动--%>
    <script src="Game_Play/js/Game_Drive_Paint_Grids.js"></script>

    <%--加载键盘控制--%>
    <script src="Game_Play/js/Game_Drive_Control_1.js"></script>

    <%--加载速度转换驱动--%>
    <script src="Game_Play/js/Game_Drive_Move_Speed.js"></script>
</head>

<body style="overflow:hidden;background-image: url('resource/image/Cemu_main_bg.png') ;
background-size: cover;">

<%----%>
    <%--背景图片--%>
    <img src="Game_Play/resource/Game_Background/Game_background_2.jpg"
         style="position:absolute;" width="1024" height="600">
<div style="position: absolute;top:0px ; left: 0px ; z-index: 4;height: 200px;width: 1024px" >
    <div style="text-align:center;font-family: 华文彩云; font-size: 60px">
        <span id="Message-Up" color="#a52a2a">
            <%--信息栏--%>
        </span>
    </div><br/>
</div>

<%--display:none--%>

<%--格子贴图--%>
    <%--自动生成id为Grid1到Grid50的格子--%>
    <c:forEach begin="1" end="19" var="i">
        <img src="Game_Play/resource/Game_resource/Grid/Grid_Fork_Big.png"
             style="position:absolute;filter:hue-rotate(70deg);  top:${150-10}px; left:${i*50-10}px; z-index:2"
             width="50" height="50" id="Grid${i}" class="Grid${i%2+1}"
        >
    </c:forEach>
    <c:forEach begin="1" end="7" var="i">
        <img src="resource/Game_resource/Grid/Grid_Circle.jpg"
             style="position:absolute;filter:hue-rotate(70deg);  top:${i*50+150-10}px; left:${950-10}px; z-index:2"
             width="50" height="50" id="Grid${i+19}" class="Grid${(i+1)%2+1}"
        >
    </c:forEach>
    <c:forEach begin="1" end="18" var="i">
        <img src="resource/Game_resource/Grid/Grid_Circle.jpg"
             style="position:absolute;filter:hue-rotate(70deg);  top:${500-10}px; left:${950-i*50-10}px; z-index:2"
             width="50" height="50" id="Grid${i+26}" class="Grid${i%2+1}"
        >
    </c:forEach>
    <c:forEach begin="1" end="6" var="i">
        <img src="resource/Game_resource/Grid/Grid_Circle.jpg"
             style="position:absolute;filter:hue-rotate(70deg);  top:${500-i*50-10}px; left:${50-10}px; z-index:2"
             width="50" height="50" id="Grid${i+44}" class="Grid${i%2+1}"
        >
    </c:forEach>

    <%--用于显示信息的窗口--%>
    <%--信息窗口--%>
    <div id="Message" class="Message_content" style="position: absolute;top:240px ; left: 140px ; z-index: 4;filter: drop-shadow(20px 20px 0 #cc0);background:#FFF ; height: 200px;width: 750px" >
        <div style="text-align:center">超级无敌牛逼的大富翁游戏</div><br/>
        <div style="text-align:center">游戏目标：挣到100金币</div><br/>
        <div style="text-align:center">当你穷困潦倒</div><br/>
        <div style="text-align:center">或者生命值为零的时候，游戏结束</div><br/>
    </div>


<%--飞机贴图--%>
<div id="planes">
    <img src="Game_Play/resource/Game_resource/plane/image1924.png" style="display: none ;position:absolute;filter:drop-shadow(20px 150px 0 #ccc); z-index:10;top:250px; left:400px;"  width="149" height="86">
</div>

    <%--opacity:0.4;设置图片透明度--%>

<%--主角贴图--%>
    <img id="hero" src="Game_Play/resource/Game_hero/stay/image2267.png" style="position:absolute;transform:rotateY(180deg); top:100px; left:50px; z-index:5" width="80" height="80">

<%--特效贴图--%>
<img id="light_1" src="Game_Play/resource/light/1/1.jpg" style="display: none;position:absolute; top:0px; left:0px; z-index:300 " width="150 " height="150">

    <c:forEach begin="1" end="20" var="i">
        <%--金币贴图--%>
        <img id="Gold${i}" class="Gold" src="Game_Play/resource/Ps_Important/gold.png" style="position:absolute; top:${270}px; left:${150+i*10}px; z-index:300 " width="30 " height="30">
    </c:forEach>
    <c:forEach begin="1" end="20" var="i">
        <%--金币贴图--%>
        <img id="Gold${i+20}" class="Gold" src="Game_Play/resource/Ps_Important/gold.png" style="position:absolute; top:${270+30}px; left:${150+i*10}px; z-index:300 " width="30 " height="30">
    </c:forEach>
    <c:forEach begin="1" end="20" var="i">
        <%--金币贴图--%>
        <img id="Gold${i+40}" class="Gold" src="Game_Play/resource/Ps_Important/gold.png" style="position:absolute; top:${270+60}px; left:${150+i*10}px; z-index:300 " width="30 " height="30">
    </c:forEach>
    <c:forEach begin="1" end="20" var="i">
        <%--金币贴图--%>
        <img id="Gold${i+60}" class="Gold" src="Game_Play/resource/Ps_Important/gold.png" style="position:absolute; top:${270+90}px; left:${150+i*10}px; z-index:300 " width="30 " height="30">
    </c:forEach>
    <c:forEach begin="1" end="20" var="i">
        <%--金币贴图--%>
        <img id="Gold${i+80}" class="Gold" src="Game_Play/resource/Ps_Important/gold.png" style="position:absolute; top:${270+120}px; left:${150+i*10}px; z-index:300 " width="30 " height="30">
    </c:forEach>
    <c:forEach begin="1" end="10" var="i">
        <%--生命贴图--%>
        <img id="Health${i}" class="Health" src="Game_Play/resource/Ps_Important/health.png" style="position:absolute; top:${270+120}px; left:${850-i*30}px; z-index:300 " width="30 " height="30">
    </c:forEach>

<%--骰子贴图--%>
<img id="number" src="Game_Play/resource/Game_resource/number/image1033.png" style="position:absolute; top:270px; left:750px;filter: drop-shadow(20px 20px 0 #ccc); z-index:20" width="62.5" height="77.5">

<%--测试数据，显示主角的各项参数，等待js控制--%>
<div id="test" style="position:absolute; top:600px; left:0px; z-index:5">
    <%--测试数据加载中..........--%>
</div>

</body>
</html>
