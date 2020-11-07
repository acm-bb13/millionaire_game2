
var gridArr=[];
var characterMessage=[];
//初始化，当js加载时
window.onload = function() {

    packDate("request" , "getMessage");
    send("Game_Play_Servlet");
    //设置主角动画的线程
    heroPaintPlay = setInterval(HeroPaintAction,80);
    //设置总移动环境
    // setInterval(AllMove,80);该函数调用已加入游戏tick里调用
    //设置骰子动画线程
    numberPaintPlay = setInterval(NumberPaintPlayRun , 80);
    //设置游戏tick函数
    setInterval(modTick,80);
    //设置特效动画线程
    LightPaintPlay= setInterval(LightPaintPlayRun,80);
    //令主角储存坐标与贴图坐标重合，修复显示异常
    // heroObject.x=$('#hero').position().left;
    // heroObject.y=$('#hero').position().top;
    //创建50个格子对象


    for(var i = 0;i<50;i++){
        gridArr[i]=new GridObjectClass();
        gridArr[i].num = i+1;
    }

    //使全图的格子随机刷新
    GridArrRefreshRandom();
    GridArrRefresh();
    GridTestAll();
//    刷新血量显示和金币显示
    GoldRefresh();
    HealthRefresh();

//    使所有格子的坐标同步
    for (var i = 1 ; i<=19;i++){
        gridArr[i-1].top = 150-10;
        gridArr[i-1].left = i*50-10;
    }
    for (var i = 1 ; i<=7;i++){
        gridArr[i+19-1].top =i*50+150-10;
        gridArr[i+19-1].left =950-10;
    }
    for (var i = 1 ; i<=18;i++){
        gridArr[i+26-1].top =500-10;
        gridArr[i+26-1].left =950-i*50-10;
    }
    for (var i = 1 ; i<=6;i++){
        gridArr[i+44-1].top =500-i*50-10;
        gridArr[i+44-1].left =50-10;
    }

}


function Game_Begin_Start() {

}

//控制主角是否可以移动
var controlBoolean=true;
//控制格子颜色变化
var grid360Back=0;
var gold360Back=0;

//初始金币数量和血量数量
var heroGoldSum = 20;
var heroHealthSum = 10;


//游戏帧判定，通过这个来控制整个游戏
function modTick(){
    GridPaintAction();
    //测试参数
    // document.getElementById('test').innerHTML =gridArr[3].top+"   "+gridArr[3].left;
    // document.getElementById('test').innerHTML = heroObject.play_mode +"   "+ heroObject.moveTick;

    //当玩家站再格子上的时候给格子旋转速度和大小
    if(HeroGetGridLocation()>0&&HeroGetGridLocation()<=50){
        gridArr[HeroGetGridLocation()-1].transformTick=360;
        gridArr[HeroGetGridLocation()-1].bigTick=100;
        // alert(gridArr[HeroGetGridLocation()-1].transformTick);
    }


    //格子颜色变化特效,grid360为变化状态
    grid360Back+=10;
    if(grid360Back>=360)grid360Back=0;
    gold360Back+=10;
    if(gold360Back>=360)gold360Back=0;
    if(gold360Back%180 == 70)gold360Back+=40;
    //旋转格子
    // $('#Grid1').css("transform","rotate("+grid360Back+"deg)");
    $('.Gold').css("transform","rotateY("+gold360Back+"deg)");
    $('.Grid1').css("filter","hue-rotate("+grid360Back+"deg)");
    $('.Grid2').css("filter","hue-rotate("+(grid360Back+90)+"deg)");

    //调用移动函数，将实体的速度转换为位移
    AllMove();

    //判断主角是否走到格子中
    if(heroObject.x % 50==0&&heroObject.y%50==0){
        if(!heroObject.moveTick){
            //行动步数到零后，停止移动，转变玩家状态
            //判定玩家当前在第几格
            heroObject.mx=0;
            heroObject.my=0;
            controlBoolean=false;

            if(heroObject.play_mode == 0){
                heroObject.play_mode=3;
                packDate("request" , "getMessa");
                send("Game_Play_Servlet");
                HeroGridEvent(gridArr[HeroGetGridLocation()-1].imageName);
            }
        }else if(heroObject.play_mode == 0){
            controlBoolean=true;
            heroObject.moveTick--;
        }
    }

    //没走到格子会一直移动
    if(controlBoolean && heroObject.play_mode == 0){
        if(heroObject.y<=100&&heroObject.x<950){
            heroObject.mx=50;
            heroObject.my=0;
        }else if(heroObject.x>=950&&heroObject.y<450){
            heroObject.mx=0;
            heroObject.my=50;
        }else if(heroObject.y>=450&&heroObject.x>50){
            heroObject.mx=-50;
            heroObject.my=0;
        }else if(heroObject.x>=50&&heroObject.y>100){
            heroObject.mx=0;
            heroObject.my=-50;
        }
    }else if(heroObject.play_mode == 0){
        //否则速度始终为0
        heroObject.mx=0;
        heroObject.my=0;
    }
}


function HeroGetGridLocation() {
    //计算主角在格子的第几格
    if(heroObject.y<=100&&heroObject.x<=950){
        return parseInt(heroObject.x/50);
    }else if(heroObject.x>=950&&heroObject.y<=450){
        return parseInt(heroObject.y/50-2)+19;
    }else if(heroObject.y>=450&&heroObject.x>=50){
        return parseInt(19-heroObject.x/50)+26;
    }else if(heroObject.x>=50&&heroObject.y>100){
        return parseInt(9-heroObject.y/50)+44;
    }
}

//格子事件处理，N为格子的类型
function HeroGridEvent(n) {
    if(heroObject.play_mode == 3){
        if(n == "Grid_Circle"){
            GridArrRefreshRandom2();
            heroObject.play_mode =2;
        }

    }


}


//更新金币显示
function GoldRefresh() {
    for (var i = 1 ; i <= heroGoldSum ; i++){
        $("#Gold"+i).css("display" , "block");
    }
    for (var i = 100;i > heroGoldSum ; i--){
        $("#Gold"+i).css("display" , "none");
    }

}

//更新健康值显示
function HealthRefresh() {
    for (var i = 1 ; i <= heroHealthSum ; i++){
        $("#Health"+i).css("display" , "block");
    }
    for (var i = 100;i > heroHealthSum ; i--){
        $("#Health"+i).css("display" , "none");
    }
}


function GridPack() {

}


//接受数据
function Ajax_Drive_Back() {
    if("getTest" == backDateAjaxSearch("request")
        && "Game_Play_Servlet" == backDateAjaxSearch("servlet")){
        // alert(backDateAjaxSearch("back_name"));
    }

    if("getMessa"== backDateAjaxSearch("request")
        && "Game_Play_Servlet"==backDateAjaxSearch("servlet")){
        characterMessage=JSON.parse(backDateAjaxSearch("List"));
        heroObject.x=parseInt(backDateListAjaxSearch(characterMessage[0],"map_x"));
        heroObject.y=parseInt(backDateListAjaxSearch(characterMessage[0],"map_y"));
        heroGoldSum = parseInt(backDateListAjaxSearch(characterMessage[0],"gold"));
        heroHealthSum = parseInt(backDateListAjaxSearch(characterMessage[0],"health"));
        GoldRefresh();
        HealthRefresh();
        $(heroObject.id).css("left" ,heroObject.x);
        $(heroObject.id).css("top" ,heroObject.y);
        Control_bl = true;
    }

    if(("health"== backDateAjaxSearch("request")||"Gold"== backDateAjaxSearch("request"))
        && "Game_Play_Servlet"==backDateAjaxSearch("servlet")){
        characterMessage=JSON.parse(backDateAjaxSearch("List"));
        heroGoldSum = parseInt(backDateListAjaxSearch(characterMessage[0],"gold"));
        heroHealthSum = parseInt(backDateListAjaxSearch(characterMessage[0],"health"));
        GoldRefresh();
        HealthRefresh();
    }

    if("getMessage"== backDateAjaxSearch("request")
    && "Game_Play_Servlet"==backDateAjaxSearch("servlet")){
        characterMessage=JSON.parse(backDateAjaxSearch("List"));
        heroObject.x=parseInt(backDateListAjaxSearch(characterMessage[0],"map_x"));
        heroObject.y=parseInt(backDateListAjaxSearch(characterMessage[0],"map_y"));
        heroGoldSum = parseInt(backDateListAjaxSearch(characterMessage[0],"gold"));
        heroHealthSum = parseInt(backDateListAjaxSearch(characterMessage[0],"health"));
        var str=backDateListAjaxSearch(characterMessage[0],"record").split(",");
        for (var i = 1; i<= 50 ; i++){
            if("1"==str[i]){
                gridArr[i-1].imageName="Grid_FINISH";
            }
            if("2"==str[i]){
                gridArr[i-1].imageName="Grid_Block";
            }
            if("3"==str[i]){
                gridArr[i-1].imageName="Grid_Circle";
            }
            if("4"==str[i]){
                gridArr[i-1].imageName="Grid_Colour";
            }
            if("5"==str[i]){
                gridArr[i-1].imageName="Grid_Fork_Big";
            }
            if("6"==str[i]){
                gridArr[i-1].imageName="Grid_Down_Yellow";
            }
            if("7"==str[i]){
                gridArr[i-1].imageName="Grid_None_Green";
            }
            gridArr[i-1].refreshImage();
        }
        GoldRefresh();
        HealthRefresh();
        $(heroObject.id).css("left" ,heroObject.x);
        $(heroObject.id).css("top" ,heroObject.y);
    }

    if(("Start_Luck"== backDateAjaxSearch("request")||"Start_Luck_Control"==backDateAjaxSearch("request"))
        && "Game_Play_Servlet"==backDateAjaxSearch("servlet")){
        heroObject.moveTick=backDateAjaxSearch("luck_number");
        numberAim = heroObject.moveTick;
        numberTick = 30;
        heroObject.play_mode=4;
        characterMessage=JSON.parse(backDateAjaxSearch("List"));
        if("Grid_Circle"==backDateAjaxSearch("respond")){
            var str=backDateListAjaxSearch(characterMessage[0],"record").split(",");
            for (var i = 1; i<= 50 ; i++){
                if("1"==str[i]){
                    gridArr[i-1].imageAimName="Grid_FINISH";
                }
                if("2"==str[i]){
                    gridArr[i-1].imageAimName="Grid_Block";
                }
                if("3"==str[i]){
                    gridArr[i-1].imageAimName="Grid_Circle";
                }
                if("4"==str[i]){
                    gridArr[i-1].imageAimName="Grid_Colour";
                }
                if("5"==str[i]){
                    gridArr[i-1].imageAimName="Grid_Fork_Big";
                }
                if("6"==str[i]){
                    gridArr[i-1].imageAimName="Grid_Down_Yellow";
                }
                if("7"==str[i]){
                    gridArr[i-1].imageAimName="Grid_None_Green";
                }
            }
        }
    }
    if("Game_Play_Servlet" == backDateAjaxSearch("servlet")){
        if("shibai" == backDateAjaxSearch("sss")||"chenggong" == backDateAjaxSearch("sss")){
            if("shibai" == backDateAjaxSearch("sss")){
                alert("游戏失败");
            }else if("shibai" == backDateAjaxSearch("sss")){
                alert("游戏成功");
            }
            window.location.href='Game_choose_character.jsp';
        }
        // alert(backDateAjaxSearch("back_name"));
    }
    // alert(outAllDate());
}