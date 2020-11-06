
    //自己写的封装，年少无知先学的js的Ajax，封装做好后才知道有jq，害，做都做了
    //使用该js需要在js代码中创建一个Ajax_Drive_Back()函数来接受数据
    //发送和接受数据源
    var sendDateAjax=[];
    var backDateAjax=[];
    //数据封装
    function packDate(key,value) {
        var length = sendDateAjax.length;
        sendDateAjax[length]={
            key:key,
            value:value
        };
    }
    function packDateClean() {
        sendDateAjax=[];
    }
    function packDatePush(date) {
        var str="";
        for(var i=0;i<date.length;i++){
            if(i!=0){
                str=str+"&";
            }
            str=str+date[i].key+"="+date[i].value;
        }
        return str;
    }

    //数据发送
    function send(action) {
        backDateAjax=[];
        xmlHttpRequest=new XMLHttpRequest();
        xmlHttpRequest.onreadystatechange = callback;
        xmlHttpRequest.open("post" , action ,true);
        xmlHttpRequest.setRequestHeader("Content-Type" , "application/x-www-form-urlencoded");
        packDate("servlet" , action);
         var str=packDatePush(sendDateAjax);
        xmlHttpRequest.send(str);
        sendDateAjax=[];
    }
    //数据接收
    function callback() {
        if(xmlHttpRequest.readyState == 4 && xmlHttpRequest.status == 200){
            var date = xmlHttpRequest.responseText;
            var arrdate = date.split("&");
            backDateAjax[0]={
                key:true,
                value:true
            }
            var arrdate2 ;
            for (var i=0;i<arrdate.length;i++){
                arrdate2=arrdate[i].split("=");
                backDateAjax[i+1]={
                    key:arrdate2[0],
                    value:arrdate2[1]
                };
            }
            Ajax_Drive_Back();
        }
    }
    //Date查询，懒得用map了
    function backDateAjaxSearch(key) {
        for(var i=0;i<backDateAjax.length;i++){
            if(key==backDateAjax[i].key){
                return backDateAjax[i].value;
            }
        }
        return null;
    }

    function backDateListAjaxSearch(list,key) {
        for(var i in list){
            if(key == i){
                return list[i];
            }
        }
        return null;
    }
    //输出所有数据，用于调试
    function outAllDate() {
        return packDatePush(backDateAjax);
    }
    
    //改变所有class值
    function classSetName(nameString , valueString) {
        var arr=document.getElementsByClassName(nameString);
        for(var i=0;i<arr.length;i++){
            arr[i].innerHTML = valueString;
        }
    }
    // //改变所有class值
    // function classSetCss(nameString,s , valueString) {
    //     var arr=$("."+nameString);
    //     for(var i=0;i<arr.length;i++){
    //         arr[i].css(s,valueString);
    //     }
    // }