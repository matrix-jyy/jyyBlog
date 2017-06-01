/**
 * Created by maggie on 16/9/23.
 */

//访问js下浏览器窗口的盒子模型属性

//这个方法有两种用法
//1.只传一个参数attr 则就是访问这个参数对应的属性值
//2.传2个参数,就是要修改attr属性值(不管你想修改哪个属性,
// 其实只能修改scrollTop和scrollLeft的值)

function win(attr,value) {
    if(typeof value==="undefined")
    {
        //只有一个attr值,没有Value值意味着是要获得属性的值

       var v= document.documentElement[attr]|| document.body[attr];

       return v;
    }
    //设置
    document.documentElement[attr]=value;
    document.body[attr]=value;

}

//获得页面中任何一个元素的顶部边框距离body的顶部边框的距离
function offset(curElement) {
    var  totalLeft=0;//最终保存这个元素距离body边界的长度
    var  totalTop=0;
    var  parent=curElement.offsetParent;

    totalLeft+=curElement.offsetLeft;
    totalTop+=curElement.offsetTop;
    while(parent)
    {
         //首先累加父级参照物的边框
        totalLeft+=parent.clientLeft;
        totalTop+=parent.clientTop;

        totalLeft+=parent.offsetLeft;
        totalTop+=parent.offsetTop;
        parent=parent.offsetParent;
    }
    return {left:totalLeft,top:totalTop};
}

//获取某个元素的任意一个样式的值
function  getCss(curEle,attr) {
    var val=null,reg=null;
    if(window.getComputedStyle)
//    if("getComputedStyle" in window)
//    if(typeof window.getComputedStyle ==="function")
//    if(navigator.userAgent.indexOf("MS IE")===-1)
    {
        val=window.getComputedStyle(curEle,null)[attr];
    }else
    {
        if(attr==="opacity")
        {
            val=curEle.currentStyle["filter"];
           //progid:DXImageTransform.Microsoft.Alpha(Opacity=100)"
            reg=/Alpha\(Opacity=(\d+(\.\d+)?)\)$/i;
            val=reg.test(val)?reg.exec(val)[1]/100:1;
            return val;
        }else
        {
            val= curEle.currentStyle[attr];
        }
    }
    //使用正则表达式测试属性值是不是数字+单位的形式
     reg=/^(-?\d+(\.\d+)?)(px|pt|em|rem)?$/i;
     val=reg.test(val)?parseFloat(val):val;
    return val;
}

function setCss(curEle,attr,value) {
    if(attr==="float")
    {
        curEle.style.cssFloat=value;
        curEle.style.styleFloat=value;
        return;
    }
    if(attr==="opacity")
    {
        curEle["style"]["opacity"]=value;
        curEle["style"]["filter"]="Alpha(opacity="+value*100+")";
        return;
    }
    //自动给数值的属性添加单位
    // width height top bottom left right margin padding
    //marginTop marginLeft  marginRight marginBottom
    //paddingTop ......
    var reg=/^(width|height|top|bottom|left|right|((margin|padding)(Top|Left|Right|Bottom)?))$/;
    if(reg.test(attr))
    {
        if(!isNaN(value))
        {
            value+="px";
        }
    }
    curEle["style"][attr]=value;

}

//一次设置多个属性的方法
   //  setMultCss(box,  {width:400px,height:300px,backgroud:#c1c1c1})
function   setMultCss(curEle, attrObj) {

    // attrObj =  attrObj|| 0;
    // if(attrObj.toString()!=="[object Object]")
    // {
    //     return;
    // }

    for(var key in attrObj)
    {
          if(attrObj.hasOwnProperty(key))
          {
              setCss(curEle,key,attrObj[key]);
          }
    }

}

//2个参数时,  curEle  attr 获取attr属性的值
//
//3个参数时   curEle attr  value 设置一个attr属性的值
//           curEle  obj 设置多个属性的值

function css(curEle)
{
    var argTwo =   arguments[1];
    if(typeof argTwo ==="string")
    {
         //判断有没有第3个参数
        var argThree=arguments[2];
        if(typeof argThree==="undefined")
        {
            //是获取css属性
            return getCss(curEle,argTwo);
        }
        //有第3个参数 那么就是调用setCss
        setCss(curEle,argTwo,argThree);
        return;
    }
    //是2个参数 并且第2个参数是obj类型  所以应该是设置多个css属性
    argTwo =  argTwo|| 0;
    if(argTwo.toString()!=="[object Object]")
    {
        return;
    }
    setMultCss(curEle,argTwo);
}
