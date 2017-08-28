//获取下一个span,可以通过这个对象给状态
function gspan(cobj){
	while(true){
		if(cobj.previousSibling.nodeName!="SPAN")
			cobj=cobj.previousSibling;
		else
			return cobj.previousSibling;	
	}
}

/*
  通用检查方法
  第一个参数：obj, 是用来检查的对象
  第二个参数：info, 是用来检查的提示信息
  第三个参数: fun, 是一个回调函数，用来检查值是否按条件输入
  第四个参数： click只是一个状态， 分清楚是单击提交按，还是失去焦点
*/
function check(obj, info, fun, click){
	var sp=gspan(obj);
	obj.onfocus=function(){	
		sp.innerHTML=info;
		sp.className="stats2";
		
	}

	obj.onblur=function(){
		if(fun(this.value)){
			sp.innerHTML="输入正确";
			sp.className="stats4";
			
		}else{
			sp.innerHTML=info;
			sp.className="stats3";
		}
	}

	if(click=="click")
		obj.onblur();
}

//页面加载完自动调用
onload=regs

//一个函数，可以使用onsubmit调用， 也可以使用onload调用
function regs(click){

var stat=true;
	var username=document.getElementsByName("username")[0];
	var password=document.getElementsByName("password")[0];
	var repass=document.getElementsByName("repass")[0];
	var email=document.getElementsByName("email")[0];
	var other=document.getElementsByName("other")[0];


	check(username, "用户名的长度要在2-20之间", function(val){
		if(val.match(/^\S+$/) && val.length >=2 && val.length <=20){
			return true;
		}else{
			stat=false;
			return false;
		}
	}, click);

	check(password, "密码必须在6-20位之间", function(val){
		if(val.match(/^\S+$/) && val.length >=6 && val.length <=20){
			return true;
		}else{
			stat=false;
			return false;
		}
	}, click);

	check(repass, "确定密码要和上面完全一致", function(val){
		if(val.match(/^\S+$/) && val.length >=6 && val.length <=20 && val==password.value){
			return true;
		}else{
			stat=false;
			return false;
		}
	}, click)

	
	check(email, "要按邮箱规则输入", function(val){
		if(val.match(/\w+@\w+\.\w/)){
			return true;
		}else{
			stat=false;
			return false;
		}
	}, click);		

	return stat;
}

$(document).ready(function(){
	$(".to-logon").click(function(){
		$(".logon-box").slideDown(1000);
		$(".register-box").slideUp(1000);
	});
	$(".to-register").click(function(){
		$(".register-box").slideDown(1000);
		$(".logon-box").slideUp(1000);
	});
	
});

