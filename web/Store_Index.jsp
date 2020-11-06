<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2020/7/23
  Time: 15:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>迷之商店</title>
    <link rel="stylesheet" type="text/css" href="css/Store_Index.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="Game_Play/js/jquery-3.5.1.min.js"></script>
</head>
<body>
<div class="Backgroud-e">
    <div id="HeadTitle_back">
        <div id="HeadTitle_word">
            迷之商店
        </div>
    </div>
    <br/>
    <br/>
    <%--搜索--%>
    <br/>
    <%--商品区域--%>
    <div class="second">
        <input type="text" placeholder="请输入搜索title" id="search_text">
        <input type="button" value="搜索" onclick="searchContent()">
        <br/>
        <br/>
        <table class="Items" id="content_table" >
            <c:foreach items="${requestScope.list}" var="con">
                <tr>
                    <td>
                        <div class="Item">
                            <img src="resource/image/test1.png" alt=""/>
                        </div>
                        <span>${con.name}</span>
                        <br/>
                        <button type="button" class="button red" onclick="Choose(1)">BUY</button>
                        <span>100</span>
                    </td>
                    <td>
                        <div class="Item">
                            <img src="resource/image/Items/Armor01.jpg" alt=""/>
                        </div>
                        <span>${con.name}</span>
                        <br/>
                        <div class="purchase">
                            <button type="button" class="button red" onclick="Choose(2)">BUY NOW</button>
                        </div>
                        <span>${con.charge}</span>
                    </td>
                    <td>
                        <div class="Item">
                            <img src="resource/image/test1.png" alt=""/>
                        </div>
                    </td>
                </tr>
            </c:foreach>
        </table>
    </div>
    <%--翻页设置--%>
    <input type="hidden" id="pageIndex" value="0">
    <input type="button" value="首页" onclick="firstPage()">
    <input type="button" value="上一页" onclick="prePage()">
    <input type="number" id="pageIndex2" value="1">
    <input type="button" value="跳转" onclick="enterPage()">
    <input type="button" value="下一页" onclick="nextPage()">
    <%--商城弹窗--%>
    <div id="fade" class="black_overlay"></div>
    <div id="sto" class="white_content">
        <div class="nav_div">
        <span   class="nav" >
            <a href = "javascript:void(0)" onclick = "document.getElementById('sto').style.display='none';document.getElementById('fade').style.display='none'" style="color: white">关闭</a>
        </span>
        </div>
    <table class="table LastShop" id="LastShop">
        <tr>
            <td class="image">
                <img src="resource/image/Items/Armor01.jpg" alt=""/>
            </td>
            <td valign="top">
                <div id="shop-text">
                    <h1>名字</h1>
                    <p style="margin-top: 10px;">
                        描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述
                    </p>
                </div>
            </td>
        </tr>
    </table>
    </div>
</div>

    <script>
        $(document).ready(function(){
            page(parseInt($("#pageIndex")[0].value),$("#search_text")[0].value);
        });
        function nextPage() {
            page(parseInt($("#pageIndex")[0].value) + 3,$("#search_text")[0].value);
        }
        function prePage() {
            page(parseInt($("#pageIndex")[0].value) - 3,$("#search_text")[0].value);
        }
        function firstPage(){
            page(0,$("#search_text")[0].value);
        }
        function searchContent() {
            page($("#pageIndex")[0].value,$("#search_text")[0].value);
        }
        function enterPage(){
            console.log($("#pageIndex2")[0].value);
            page(($("#pageIndex2")[0].value-1)*3,$("#search_text")[0].value);
        }
        function page(pageIndex,searchContent) {
            if(pageIndex<0) pageIndex=0;
            //翻页操作
            $.post("Store_Conlist",
                {
                    "pageIndex":pageIndex,
                    "searchText":searchContent,
                }//data传入
                ,function (data) {
                    var rsultList = JSON.parse(data);
                    var htmlContent = '';
                    var i=0;
                    for(var con of rsultList){
                        if(i%3==0) htmlContent+=`<tr>`;
                        htmlContent += `
                    <td>
                        <div class="Item">
                            <img src="${'${con.url}'}"/>
                        </div>
                        <span>${'${con.name}'}</span>
                        <br/>
                        <button type="button" class="button red" value="${'${con.id}'}" onclick="Choose(`+i+`)">BUY NOW</button>
                        <br>
                        <span>${'${con.charge}'}</span>
                    </td>`;
                        i+=1;
                    }
                    if(i!=0){
                        for(;i<3;i++){
                            htmlContent += `
                    <td>
                        <div class="Item">
                        </div>
                        <span> </span>
                        <br>
                        <br>
                        <span>   </span>
                    </td>`;
                        }
                        htmlContent+=`</tr>`;
                    }else{
                        htmlContent+=`<span>没有相关商品</span><br>`;
                    }

                    //对内容的修改
                    //innerHTML->将位置内容完全替换
                    //console.log(htmlContent);
                    $("#content_table")[0].innerHTML=htmlContent;
                    //valur->对value进行修改
                });
            //控制页数变化
            $.post("Store_ConPage",
                {
                    "pageIndex":pageIndex,
                    "searchText":searchContent,
                }//data传入
                ,function (data) {
                    var rsultList = JSON.parse(data);
                    //console.log(rsultList);
                    $("#pageIndex")[0].value = rsultList;
                    $("#pageIndex2")[0].value = rsultList/3+1;
                });
        }

        function Choose(n){
            $.post("Store_ConShop",
                {
                "id":$(".button.red")[n].value,
                },
                function(data){
                    var rsultList = JSON.parse(data);
                    var htmlContent = '';
                    var i=0;
                    for(var con of rsultList){
                        htmlContent += `
                    <tr>
                        <td class="image">
                            <img src="${'${con.url}'}" alt=""/>
                        </td>
                        <td valign="top">
                            <div id="shop-text">
                                <h1>${'${con.name}'}</h1>
                                <p style="margin-top: 10px;">
                                    ${'${con.comment}'}
                                </p>
                            </div>
                            <div id="shop-buy">
                                数量&nbsp;&nbsp;<input type="number" id="nums" value="1" min="1" max="999" onkeyup='LimitNum(this)'>
                                <button type="button"  class="button red" value="${'${con.id}'}" onclick="">BUY</button>
                            </div>
                        </td>
                    </tr>`;
                    }
                    $("#LastShop")[0].innerHTML=htmlContent;
                }
            );
            document.getElementById('sto').style.display='block';
            document.getElementById('fade').style.display='block';
        }
        function LimitNum(obj){
            if(obj<0){
                $("nums")[0].value=0;
            }else if(obj>999){
                $("nums")[0].value=999;
            }
            console.log(2);
        }
    </script>

</body>
</html>
