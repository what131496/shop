$(document).ready(function(){
	$('#myCarousel').bind({
		mouseenter:function(){
			$('.carousel-control').fadeIn(800);
		},
		mouseleave:function(){
			$('.carousel-control').fadeOut(800);
		},
	})
	$('.carousel').carousel({
	interval:3500//鍥剧墖鍒囨崲鏃堕棿
    });
//涓棿瀵艰埅鏍�
$("#menu2 li a").wrapInner( '<span class="out"></span>' );
	$("#menu2 li a").each(function() {
		$( '<span class="over">' +  $(this).text() + '</span>' ).appendTo( this );
	});
	$("#menu2 li a").hover(function() {
		$(".out",	this).stop().animate({'top':	'48px'},	300); // move down - hide
		$(".over",	this).stop().animate({'top':	'0px'},		300); // move down - show
	}, function() {
		$(".out",	this).stop().animate({'top':	'0px'},		300); // move up - show
		$(".over",	this).stop().animate({'top':	'-48px'},	300); // move up - hide
	});
//	返回顶部
	   function b(){
		h = $(window).height();
		t = $(document).scrollTop();
		if(t > h){
			$('#gotop').fadeIn();
		}else{
			$('#gotop').fadeOut();
		}
		}
		$(document).ready(function(e) {
			b();
			$('#gotop').click(function(){
				$(document).scrollTop(0);	
			})
		});
		$(window).scroll(function(e){
			b();		
		});
});
window.onload=function(){
	//鍒嗙被瀵艰埅鐨勬晥鏋�
	var odiv=document.getElementById("banner-nav");
	var odl=odiv.getElementsByTagName("dl");
	for(var i=0;i<odl.length;i++){
		odl[i].onmouseover=function(){
		this.className="banner-avtive";
		}
		odl[i].onmouseout=function(){
			this.className="";
		}
	}
//闂存瓏鎬ф粴鍔�

//鍥句功鐣呴攢瀵艰埅鐨勫垏鎹�
    var ad=document.getElementById("hot-tab");
	var al=ad.getElementsByTagName("li");
	var od=document.getElementById("case-content");
	var odd=od.getElementsByTagName("div");
    var index;
    for(var i=0;i<al.length;i++){
			al[i].index=i;
	  }
	  ad.addEventListener("mouseover",function(e){
	  	if(e.target.nodeName.toLowerCase()=="li"){
	  		for(var j=0;j<odd.length;j++){
	  			odd[j].style.display="none";
	  			al[j].className="";
	  		}
	  		al[e.target.index].className="tab-active";
	  		odd[e.target.index].style.display="block";
	  	}
	},false);
	//鍥句功鐑崠瀵艰埅鐨勫垏鎹�
    var ad2=document.getElementById("hot-tab1");
	var al2=ad2.getElementsByTagName("li");
	var od2=document.getElementById("case-content1");
	var odd2=od2.getElementsByTagName("div");
    var index;
    for(var i=0;i<al2.length;i++){
			al2[i].index=i;
	  }
	  ad2.addEventListener("mouseover",function(e){
	  	if(e.target.nodeName.toLowerCase()=="li"){
	  		for(var j=0;j<odd2.length;j++){
	  			odd2[j].style.display="none";
	  			al2[j].className="";
	  		}
	  		al2[e.target.index].className="tab-active";
	  		odd2[e.target.index].style.display="block";
	  	}
	},false);
//搴楅暱鎺ㄨ崘鐨勬寜閽垏鎹㈠姛鑳�.
var adiv=document.getElementById("tab-title");
var ali=adiv.getElementsByTagName("li");
var odiv=document.getElementById("tab-contents");
var od=odiv.getElementsByTagName("div");
var index;
for(var i=0;i<ali.length;i++){
		ali[i].index=i;
  }
  adiv.addEventListener("mouseover",function(e){
  	if(e.target.nodeName.toLowerCase()=="li"){
  		for(var j=0;j<od.length;j++){
  			od[j].style.display="none";
  			ali[j].className="";
  		}
  		ali[e.target.index].className="lihover";
  		od[e.target.index].style.display="block";
  	}
  },false);
//鏈�杩戝緢鐏殑鎺у埗
var adiv1=document.getElementById("tab-title1");
var ali1=adiv1.getElementsByTagName("li");
var odiv1=document.getElementById("tab-contents1");
var od1=odiv1.getElementsByTagName("div");
var index;
for(var i=0;i<ali1.length;i++){
		ali1[i].index=i;
  }
  adiv1.addEventListener("mouseover",function(e){
  	if(e.target.nodeName.toLowerCase()=="li"){
  		for(var j=0;j<od1.length;j++){
  			od1[j].style.display="none";
  			ali1[j].className="";
  		}
  		ali1[e.target.index].className="lihover";
  		od1[e.target.index].style.display="block";
  	}
  },false);
//闂存瓏婊氬姩

//鐑崠閲岄潰鐨勫垏鎹�
/*var fdiv=document.getElementById("tabs");
var fli=fdiv.getElementsByTagName("li");
for(var i=0;i<fli.length;i++){
	fli[i].onmouseover=function(){
	  this.style.display="none";
	  this.nextSibling.className="tab-hover";
   }
    fli[i].onmouseout=function(){
    	this.previousSibling.className="tab-hover";
//  	this.nextSibling.className="tab-hover";
    }
  }*/
}
