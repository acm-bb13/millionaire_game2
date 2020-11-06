//创建一个格子类
function GoldObjectClass() {
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
    this.imageName="Grid_FINISH";
    //目标格子id
    this.imageAimName="Grid_FINISH";

}