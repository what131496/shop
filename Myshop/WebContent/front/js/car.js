$(document).ready(function(){
		//加的效果
		$(".add").click(function(){
		var n=$(this).prev().val();
		var num=parseInt(n)+1;
		if(num==0){ return;}
		$(this).prev().val(num);
		});
		//减的效果
		$(".jian").click(function(){
		var n=$(this).next().val();
		var num=parseInt(n)-1;
		if(num==0){ return}
		$(this).next().val(num);
		});
		var shop_num=$('.num').val();
		var single_price=$('#single1-price').text();
		var all_price=parseInt(shop_num)*parseInt(single_price);
		$('#all1-price').innerHTML='你好';
		});

window.onload=function(){
	function FreshTime()
		{
		        var endtime=new Date("2017/6/12,12:20:12");//结束时间
		        var nowtime = new Date();//当前时间
		        var lefttime=parseInt((endtime.getTime()-nowtime.getTime())/1000); 
		        d=parseInt(lefttime/3600/24);
		        h=parseInt((lefttime/3600)%24);
		        m=parseInt((lefttime/60)%60);
		        s=parseInt(lefttime%60);
		       
		        document.getElementById("LeftTime").innerHTML=d+"天"+h+"小时"+m+"分"+s+"秒";
		        if(lefttime<=0){
		        document.getElementById("LeftTime").innerHTML="订单已经取消";
		        clearInterval(sh);
		        }
		}
		FreshTime()
		var sh;
		sh=setInterval(FreshTime,1000);
//		点击查看详情的那个	
		var adiv=document.getElementById("select");
		var ali=adiv.getElementsByTagName("li");
		var index;
		for(var i=0;i<ali.length;i++){
				ali[i].index=i;
		  }
		  adiv.addEventListener("click",function(e){
		  	if(e.target.nodeName.toLowerCase()=="li"){
		  		for(var j=0;j<ali.length;j++){
		  			ali[j].className="";
		  		}
		  		ali[e.target.index].className="pay";
		  	}
		  },false);
		
}
