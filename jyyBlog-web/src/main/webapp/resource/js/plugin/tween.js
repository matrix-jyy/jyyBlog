/**
 * Created by 张思奇 on 16/9/28.
 * tween.js实现补间动画
 */

//使用函数的闭包包裹整个动画代码
//自运行函数  ~表示js的自动解析  浏览器看见~就会自动执行之后的函数
~function(){

    /*
     t timer动画已执行的时间
     b begin动画执行前的起始位置
     d duration动画的持续执行时间
     c change动画要移动的距离(动画要变动的数值范围)
     返回值  得到动画在t这个时间点需要的具体坐标(数值)
    * */
    function linear(t,b,d,c) {
       return c*t/d +b;
    }

    /*
    *  curEle  要做动画的元素
    *  dest   动画运动的目标值  { left:400,top:300,width:400,opacity: 0  }
    *  duration 动画的持续时间
    *{ left:400,top:300,width:400,opacity: 0  }
    * callback是回调函数  希望在动画结束时调用
    * */
    function startAnimation(curEle,dest,duration,callback)
    {

        //1.动画的初始化  计算属性的起始值 和需要改变多少值
        //begin是个对象 用来保存目标属性的起始值 里面所有的属性名和dest里面的属性名对应
        //change也是对象,用来保存目标属性需要变化的值,里面所有的属性名和dest里面的也对应
        var  begin={}, change={};
        for(var key in dest)
        {
              if(dest.hasOwnProperty(key))
              {
                  begin[key]  =  css(curEle,key);
                  change[key]=dest[key]-begin[key];
              }
        }
        //2.启动周期定时器,定时执行移动的方法
        //a.每一次动画开始之前要清除前一次动画的定时器
        window.clearInterval(curEle.animTimer);
        //用来累计动画已经播放了多长时间
        var totalTime=0;
        curEle.animTimer=window.setInterval(move,10);

        //b 定义负责每一次修改动画值的函数move
        function move() {
            totalTime+=10;
            //累计完时间判断是否动画结束
            if(totalTime>=duration)
            {
                // for(var key in dest)
                // {
                //     if(dest.hasOwnProperty(key))
                //     {
                //         //把位置全都定位最终值
                //         css(curEle,key,dest[key]);
                //     }
                // }
                css(curEle,dest);

                window.clearInterval(curEle.animTimer);

                if(typeof callback==="function")
                {
                    callback();
                }
                return;
            }
            //计算这个时间刻,动画需要改变的所有属性的值
            for(key in dest )
            {
                 if(dest.hasOwnProperty(key))
                 {
                      curPos= linear(totalTime,begin[key],duration,change[key]);
                     css(curEle,key,curPos);
                 }
            }
        }
    }
    window.tween=startAnimation;
}();
