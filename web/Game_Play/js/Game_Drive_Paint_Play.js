var heroPaintPlay ,//主角动画线程
    heroPaintPlayTick=0 , //主角动画帧
    heroBei=0.8 ,//主角缩放比例
    heroPaintAction = "HeroPaintPlayStay";//主角播放动作
var heroMoveSpeed = 5;
var heroObject = {
    x:0,
    y:0 ,
    mx:0,
    my:0,
    id:'#hero',
    moveTick:0,
    play_mode:1
};

//创建一个受物理影响的对象模板
function MoveObject(x,y,mx,my,id) {
    this.x = x;
    this.y = y;
    this.mx = mx;
    this.my = my;
    //该id为贴图id
    this.id = id;
}

function HeroPaintAction() {

    if(heroObject.x>1024||heroObject.y>600 || heroObject.x <-200||heroObject.y<-200){
        document.getElementById('hero').style.display='none';
    }else {
        document.getElementById('hero').style.display='block';
    }
    if(heroPaintAction == "HeroPaintPlayStay"){
        HeroPaintPlayStay();
    }else if(heroPaintAction == "HeroPaintPlayRun"){
        HeroPaintPlayRun();
    }else if(heroPaintAction == "HeroPaintPlayRun2"){
        HeroPaintPlayRun2();
    }
}



function HeroPaintPlayRun() {
    heroPaintPlayTick++;
    if(heroPaintPlayTick*2+2282>2294){
        heroPaintPlayTick=0;
     }
    $('#hero').attr('width',80*heroBei);
    $('#hero').attr('height',93*heroBei);
    $('#hero').attr('src',"Game_Play/resource/Game_hero/run/image"+(heroPaintPlayTick*2+2282)+".png");
}

function HeroPaintPlayRun2() {
    heroPaintPlayTick++;
    if(heroPaintPlayTick*2+2256>2264){
        heroPaintPlayTick=0;
    }
    $('#hero').attr('width',73*heroBei);
    $('#hero').attr('height',67*heroBei);
    $('#hero').attr('src',"Game_Play/resource/Game_hero/run2/image"+(heroPaintPlayTick*2+2256)+".png");
}

function HeroPaintPlayStay() {

    heroPaintPlayTick++;
    if(heroPaintPlayTick*2+2267>2279){
        heroPaintPlayTick=0;
    }
    $('#hero').attr('width',45*heroBei);
    $('#hero').attr('height',85*heroBei);
    $('#hero').attr('src',"Game_Play/resource/Game_hero/stay/image"+(heroPaintPlayTick*2+2267)+".png");
}