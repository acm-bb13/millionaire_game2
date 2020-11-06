var LightPaintPlay ,//骰子动画线程
    LightPaintPlayTick=0 , //骰子动画帧
    LightBei=1 ,//骰子缩放比例
    LightPaintAction = "HeroPaintPlayStay";//骰子播放动作
var LightPaintMode = 0;



function LightPaintPlayRun() {
    if(LightPaintMode == 1){
        LightPaintPlayTick++;
        if(LightPaintPlayTick>14){
            LightPaintPlayTick=6;
        }
        $('#light_1').css("left",700);
        $('#light_1').css("top", -150);
        $('#light_1').attr('width',500*LightBei);
        $('#light_1').attr('height',500*LightBei);
        $('#light_1').attr('src',"Game_Play/resource/light/1/"+LightPaintPlayTick+".jpg");
    }
}