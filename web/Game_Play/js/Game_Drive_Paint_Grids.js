

var gridHight = 50;
var gridWith = 50;
//创建一个格子类
function GridObjectClass() {
    //控制旋转帧
    this.transformTick=0;
    //控制变大缩小帧
    this.bigTick=0;
    //格子动画速度
    this.paintSpeed=10;
    //状态值
    this.mode=1;
    //第num个格子
    this.num=1;
    //格子id
    this.top = 0;
    this.left=0;
    this.mx=0;
    this.my=0;
    this.staticx=0;
    this.staticy=0;
    this.imageName="Grid_FINISH";
    //目标格子id
    this.imageAimName="Grid_FINISH";
    //获取当前格子应该显示的image路径
    this.getImageSrc=function () {
        if(this.imageName == "Grid_FINISH"){
            return "Game_Play/resource/Game_resource/Grid/Grid_FINISH.jpg";
        }
        if(this.imageName == "Grid_Block"){
            return "Game_Play/resource/Game_resource/Grid/Grid_Block.png";
        }
        if(this.imageName == "Grid_Circle"){
            return "Game_Play/resource/Game_resource/Grid/Grid_Circle.jpg";
        }
        if(this.imageName == "Grid_Colour"){
            return "Game_Play/resource/Game_resource/Grid/Grid_Colour.png";
        }
        if(this.imageName == "Grid_Fork_Big"){
            return "Game_Play/resource/Game_resource/Grid/Grid_Fork_Big.png";
        }
        if(this.imageName == "Grid_Down_Yellow"){
            return "Game_Play/resource/Game_resource/Grid/Grid_Down_Yellow.jpg";
        }
        if(this.imageName == "Grid_None_Green"){
            return "Game_Play/resource/Game_resource/Grid/Grid_None_Green.png";
        }
    };
    //刷新格子图片
    this.refreshImage=function () {
        var str = '#Grid'+this.num;
        $(str).attr('src',this.getImageSrc());
    }
}






//设置每种格子生成的权重
var randomWeight = {
    "Grid_Block":1,
    "Grid_Circle":1,
    "Grid_Colour":1,
    "Grid_Fork_Big":1,
    "Grid_Down_Yellow":1,
    "Grid_None_Green":1
};




//根据权重随机生成所有格子
function GridArrRefreshRandom() {
    var randomWeightArr=[];
    for (var index in randomWeight){
        for (var i = 0 ; i<randomWeight[index];i++){
            randomWeightArr[randomWeightArr.length]=index;
        }
    }
    for (var i = 1; i<50 ; i++){
        gridArr[i].imageName= randomWeightArr[parseInt(Math.random()*randomWeightArr.length)];
    }
}

//根据权重随机生成所有格子2
//并进行格子动画
function GridArrRefreshRandom2() {
    // var randomWeightArr=[];
    // for (var index in randomWeight){
    //     for (var i = 0 ; i<randomWeight[index];i++){
    //         randomWeightArr[randomWeightArr.length]=index;
    //     }
    // }
    for (var i = 1; i<50 ; i++){
        // alert(gridArr[i].imageAimName);
        // gridArr[i].imageAimName= randomWeightArr[parseInt(Math.random()*randomWeightArr.length)];
        gridArr[i].transformTick = 360 + i * 10;
        gridArr[i].bigTick = 180 + i * 10;
        gridArr[i].mode=2;
    }

}


//刷新所有格子图片
function GridArrRefresh() {
    for (var i = 0 ; i <50;i++){
        gridArr[i].refreshImage();
    }
}

//测试用
function GridTestAll() {
    for(var i = 0 ; i<50 ; i++){
        // alert(gridArr[i].imageName);
    }
}

//
var GridAllTransformTick = 360;
//格子动画
function GridPaintAction() {
    GridAllTransformTick-=5;
    if(GridAllTransformTick==0){
        GridAllTransformTick=360
    }
    for (var i in gridArr){
        //控制旋转角度
        if(gridArr[i].transformTick > 0){
            gridArr[i].transformTick-=gridArr[i].paintSpeed;
            $('#Grid'+gridArr[i].num).css("transform","rotate("+((gridArr[i].transformTick+360+GridAllTransformTick)%360)+"deg)");
        }else {
            $('#Grid'+gridArr[i].num).css("transform","rotate("+0+"deg)");
        }
        //控制大小变化
        if(gridArr[i].bigTick > 0){
            gridArr[i].bigTick-=gridArr[i].paintSpeed;
            //限制格子最大为70
            if(gridArr[i].bigTick > 100){
                $('#Grid'+gridArr[i].num).css("width",70);
                $('#Grid'+gridArr[i].num).css("height",70);
                $('#Grid'+gridArr[i].num).css("left",gridArr[i].left-10);
                $('#Grid'+gridArr[i].num).css("top",gridArr[i].top-10);
            }else {
                $('#Grid'+gridArr[i].num).css("width",gridArr[i].bigTick/5+50);
                $('#Grid'+gridArr[i].num).css("height",gridArr[i].bigTick/5+50);
                $('#Grid'+gridArr[i].num).css("left",gridArr[i].left-gridArr[i].bigTick/10);
                $('#Grid'+gridArr[i].num).css("top",gridArr[i].top-gridArr[i].bigTick/10);
            }
        }else {
            $('#Grid'+gridArr[i].num).css("width",50);
            $('#Grid'+gridArr[i].num).css("height",50);
            $('#Grid'+gridArr[i].num).css("left",gridArr[i].left);
            $('#Grid'+gridArr[i].num).css("top",gridArr[i].top);
        }

    //    判断模式2下格子是否进入状态
        if(gridArr[i].mode == 2 && gridArr[i].transformTick == 180){
            gridArr[i].imageName=gridArr[i].imageAimName;
            gridArr[i].refreshImage();
        }else if(gridArr[i].mode == 2 && gridArr[i].transformTick == 0){
            gridArr[i].mode =1;
        }
    }
}