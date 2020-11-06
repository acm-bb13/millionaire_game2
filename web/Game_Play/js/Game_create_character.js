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
    // alert("asdad");
}

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
    document.getElementById('test').innerHTML = heroObject.x+"   " + heroObject.y + "   "+ heroObject.mx + "   "+ heroObject.my
        +"   "+heroObject.moveTick;

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
    if(!heroMoveBoolean){
        if(n == 1){
            heroObject.mx=3000;
        }
        if(n == 2){

        }
        if(n == 3){
            heroObject.mx=-3000;
        }
    }
}

//点击人物时
function onclickHero() {
    //人物不在移动时可以移动人物
    if(!heroMoveBoolean){
        //    页面跳转，进入游戏
        //     alert("进入游戏");
    }

}

//Ajax接口，接收数据
function Ajax_Drive_Back() {


}