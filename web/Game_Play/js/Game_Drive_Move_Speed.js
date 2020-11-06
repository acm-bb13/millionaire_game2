


function AllMove() {
    if(heroObject.x>1026||heroObject.x<-200||heroObject.y>600||heroObject.y<-200){
        heroPaintAction="HeroPaintPlayStay";
        heroObject.mx=0;
        heroObject.my=0;
    }else if(heroObject.mx!=0||heroObject.my!=0){
        AllMoveAction(heroObject,heroMoveSpeed);
        heroPaintAction="HeroPaintPlayRun";
    }else {
        heroPaintAction="HeroPaintPlayStay";
    }

}

function AllMoveAction(object,ac) {

    if((object.mx>=ac&&object.mx>0)||(object.mx<=-ac&&object.mx<0)){
        if(object.mx>0){
            $(object.id).css("transform" ,'rotateY(180deg)');
        }else {
            $(object.id).css("transform" ,'rotateY(0deg)');
        }
        object.x=object.x+(object.mx>0?ac:-ac);
        object.mx=object.mx>0?object.mx-ac:ac+object.mx;
        $(object.id).css("left" ,object.x );
    }else if(object.mx!=0){
        object.x = object.x+object.mx;
        $(object.id).css("left" , object.x);
        object.mx=0;
    }
    if((object.my>=ac&&object.my>0)||(object.my<=-ac&&object.my<0)){
        object.y=object.y+(object.my>0?ac:-ac);
        object.my=object.my>0?object.my-ac:ac+object.my;
        $(object.id).css("top" , object.y);
    }else if(object.my!=0){
        object.y=object.y+object.my;
        $(object.id).css("top" ,object.y );
        object.my=0;
    }
}