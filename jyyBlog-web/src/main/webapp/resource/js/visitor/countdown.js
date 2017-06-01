//    倒计时
    var arr=[];
    var opening_time=$(".opening-time")
    for(var i=0;i<opening_time.length;i++){
        var val=opening_time[i].innerHTML;
        var t1 = ((new Date(val)).getTime()-new Date().getTime())/1000;
        arr.push(t1);
    }
        function timer(){
            window.setInterval(function(){
                for(var i=0;i<arr.length;i++){
                    time($("#day_show"+i),$('#hour_show'+i),$('#minute_show'+i),$('#second_show'+i),arr[i],i+1)
                }}, 1000);
        }
    function time(d,h,m,s,t,n){
        var day=0,
                hour=0,
                minute=0,
                second=0;//时间默认值
        if(t > 0){
            day = Math.floor(t / (60 * 60 * 24));
            hour = Math.floor(t / (60 * 60)) - (day * 24);
            minute = Math.floor(t / 60) - (day * 24 * 60) - (hour * 60);
            second = Math.floor(t) - (day * 24 * 60 * 60) - (hour * 60 * 60) - (minute * 60);
        }
        if (minute <= 9) minute = '0' + minute;
        if (second <= 9) second = '0' + second;
        d.html(day);
        h.html('<s id="h"></s>'+hour);
        m.html('<s></s>'+minute);
        s.html('<s></s>'+second);
        for(var j=0;j<arr.length;j++){
            if(n==j+1){
                arr[j]--;
            }
        }
    };
    $(function(){
        timer();
    });
    
    
    var rest=document.getElementsByClassName("rest");
    for(var i=0;i<rest.length;i++){
        var oSpan=rest[i].getElementsByTagName("span")[0];
        if(parseInt(oSpan.innerHTML)==0){
            oSpan.className="color-gray"
        }else if(parseInt(oSpan.innerHTML)>=1&&parseInt(oSpan.innerHTML)<=5){
            oSpan.className="color-red"
        }
        else if(parseInt(oSpan.innerHTML)>=6&&parseInt(oSpan.innerHTML)<=9){
            oSpan.className="color-yellow"
        }else if(parseInt(oSpan.innerHTML)>=10){
            oSpan.className="color-green"
        }
    }