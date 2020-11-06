


//键盘控制
document.onkeydown = function(e){
    // alert(e.keyCode);
    switch (e.keyCode) {
        case 49:
        case 50:
        case 51:
        case 52:
        case 53:
        case 54:
            packDate("request","Start_Luck_Control");
            packDate("luck_number",e.keyCode-48);
            send("Game_Play_Servlet");
        //左
        case 37 :
            packDate("request","health");
            packDate("healthOP","healthDown");
            send("Game_Play_Servlet");
            // heroHealthSum--;
            // HealthRefresh();
            break;
        //上
        case 38 :
            packDate("request","Gold");
            packDate("GoldOP","GoldUP");
            send("Game_Play_Servlet");
            // heroGoldSum++;
            // GoldRefresh();
            break;
        //右
        case 39 :
            // heroHealthSum++;
            // HealthRefresh();
            packDate("request","health");
            packDate("healthOP","healthUP");
            send("Game_Play_Servlet");
            break;
        //下
        case 40 :
            // heroGoldSum--;
            // GoldRefresh();
            packDate("request","Gold");
            packDate("GoldOP","GoldDown");
            send("Game_Play_Servlet");
            break;
        //空格
        case 32 :
            // controlBoolean=!controlBoolean;
            // if(heroObject.play_mode == 1){
            //
            // }else {
            //     alert("请等待你的回合");
            // }
            packDate("request" , "Start_Luck");
            send("Game_Play_Servlet");
            // heroObject.moveTick=parseInt(Math.random()*6+1);
            // numberAim = heroObject.moveTick;
            numberTick = 500;



            break;
        // case :

    }

}
