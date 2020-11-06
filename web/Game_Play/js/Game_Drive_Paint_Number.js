var numberPaintPlay ,//骰子动画线程
    numberPaintPlayTick=1 , //骰子动画帧
    numberBei=2.5 ,//骰子缩放比例
    numberTick = 0,
    numberAim = 1;



function NumberPaintPlayRun() {
    if(numberTick)numberTick--;
    if(!numberTick&&numberAim==numberPaintPlayTick){
        if(heroObject.play_mode == 4){
            heroObject.play_mode=0;
        }
        return;
    }
    numberPaintPlayTick++;
    if(numberPaintPlayTick>6){
        numberPaintPlayTick=1;
    }
    $('#number').attr('width',25*numberBei);
    $('#number').attr('height',31*numberBei);
    $('#number').attr('src',"Game_Play/resource/Game_resource/number/image"+(numberPaintPlayTick*2+1033)+".png");
}