//初始化，当js加载时
window.onload = function() {
    //设置主角动画的线程
    heroPaintPlay = setInterval(HeroPaintAction,80);
    //设置游戏tick函数
    setInterval(modTick,80);
    //令主角储存坐标与贴图坐标重合，修复显示异常
    heroObject.x=$('#hero').position().left;
    heroObject.y=$('#hero').position().top;
    heroBei = 2;
    heroMoveSpeed = 20;
    packDate("request" , "getCharacterMessage");
    send("Character_operate_Servlet");
}

var characterMessage=[];
var chooseIndex = 0;
//对接数据库文件
var characterBean= {
    user_login:null,
    name:null,
    health:null,
    gold:null,
    map_id:null,
    map_x:null,
    map_y:null,
    record:null,
    date_create:null,
    date_loaded:null,
    map_my:null,
    map_mx:null,
    kind:null
};

// function Character(user_login,name,health,gold) {
//     this.user_login;
//     this.name;
//     this.health;
//     this.gold;
//     this.map_id;
//     this.map_x;
//     this.map_y;
//     this.record;
//     this.date_create;
//     this.date_loaded;
//     this.map_my;
//     this.kind;
// }


//创建一个变量记录是否进入切换人物状态，期间点击人物不会起作用
var heroMoveBoolean = false;

//游戏帧
function modTick() {
    AllMove();
    // document.getElementById('test').innerHTML = heroObject.x+"   " + heroObject.y + "   "+ heroObject.mx + "   "+ heroObject.my
    // +"   "+heroObject.moveTick + "   " +heroMoveBoolean;

    if(heroObject.x > 1000){
        heroObject.x =-100;
        heroObject.mx = 550;
    }
    if(heroObject.x < -150){
        heroObject.x =1000;
        heroObject.mx = -550;
    }

}

//点击切换人物时
function onclickChoose(n) {
    //人物不在移动时可以选择人物
        if(n == 1){
            heroObject.mx=3000;
            switchCharacter(1);
        }
        if(n == 2){
            packDate("request","deleteMessage");
            packDate("id", backDateListAjaxSearch(characterMessage[chooseIndex],"id"));
            send("Character_operate_Servlet");
            switchCharacter(3);
        }
        if(n == 3){
            heroObject.mx=-3000;
            switchCharacter(2);
        }
        if(n == 4){
            $("#Message").css("display","none");
            $("#MessageCreate").css("display","block");
        }
        if(n == 5){
            if(document.getElementById('inputName').value != ""){
                packDate("request","create_character");
                packDate("inputName", document.getElementById('inputName').value);
                send("Character_operate_Servlet");
                document.getElementById('inputName').value="";
                $("#Message").css("display","block");
                $("#MessageCreate").css("display","none");
                switchCharacter(3);
            }else {
                alert("人物名称不能为空");
            }
        }
        if(n == 6){
            $("#Message").css("display","block");
            $("#MessageCreate").css("display","none");
            switchCharacter(3);
        }
}

//点击人物时
function onclickHero() {

    if(heroMoveBoolean){
    //    页面跳转，进入游戏
    //     alert("进入游戏");
        packDate("request","select");
        packDate("id",backDateListAjaxSearch(characterMessage[chooseIndex],"id"));
        send("Character_operate_Servlet");
        window.location.href='Game_play.jsp';
    }

}

function switchCharacter(n) {
    if(n==1){
        chooseIndex--;
    }else if(n == 2) {
        chooseIndex++;
    }
    if(chooseIndex<0){
        chooseIndex=characterMessage.length-1;
    }
    if(chooseIndex>=characterMessage.length){
        chooseIndex=0;
    }
    if(characterMessage.length != 0){
        heroMoveBoolean=true;
        document.getElementById("dianj_").innerHTML = "点击上方小人选择人物";
        classSetName('name_' , backDateListAjaxSearch(characterMessage[chooseIndex],"name"));
        classSetName('health_' , backDateListAjaxSearch(characterMessage[chooseIndex],"health"));
        classSetName('gold_' , backDateListAjaxSearch(characterMessage[chooseIndex],"gold"));
        classSetName('date_loaded_' , backDateListAjaxSearch(characterMessage[chooseIndex],"date_loaded"));
        classSetName('date_create_' , backDateListAjaxSearch(characterMessage[chooseIndex],"date_create"));
    }else {
        heroMoveBoolean= false;
        document.getElementById("dianj_").innerHTML = "请先点击创建人物";
        classSetName('name_' , "未查询到人物存档");
        classSetName('health_' , "未查询到人物存档");
        classSetName('gold_' , "未查询到人物存档");
        classSetName('date_loaded_' , "未查询到人物存档");
        classSetName('date_create_' , "未查询到人物存档");
    }

}

//Ajax接口，接收数据
function Ajax_Drive_Back() {
    if( "getCharacterMessage" == backDateAjaxSearch("request") && "Character_operate_Servlet"==backDateAjaxSearch("servlet")){
        characterMessage=JSON.parse(backDateAjaxSearch("List"));
        if(characterMessage.length !=0){
            chooseIndex = 0;
        }else {
            alert("没有人物存档请先创建人物");
        }
        switchCharacter(3);
    }
    if( "create_character" == backDateAjaxSearch("request") && "Character_operate_Servlet"==backDateAjaxSearch("servlet")){
        characterMessage=JSON.parse(backDateAjaxSearch("List"));
        if(characterMessage.length !=0){
            chooseIndex = 0;
        }
        switchCharacter(3);
    }
    if( "deleteMessage" == backDateAjaxSearch("request") && "Character_operate_Servlet"==backDateAjaxSearch("servlet")){
        characterMessage=JSON.parse(backDateAjaxSearch("List"));
        if(characterMessage.length !=0){
            chooseIndex = 0;
        }else {
            chooseIndex = 0;
            alert("没有人物存档请先创建人物");
        }
        switchCharacter(3);
    }

}