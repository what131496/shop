<%@ page language="java" import="java.util.*,java.text.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="entity.Book1"%>
<%@ page import="dao.Book1Dao"%>
<%@ page import="entity.Book2"%>
<%@ page import="dao.Book2Dao"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<% 
String datetime=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(Calendar.getInstance().getTime()); 
%>
<!DOCTYPE html>
<html>
	<head>
	<meta name="renderer" content="webkit" />
	<meta http-equiv="X-UA-Compatible" content="IE=9"/>
    <meta http-equiv="X-UA-Compatible" content="IE=10"/>
	<meta charset="UTF-8">
	<title>购买成功</title>
	<link rel="shortcut icon" href="../img/book.ico" />
	<script src="../Bootstrap/js/jquery.min.js"></script>
	<script src="../js/index.js"></script>
	<script src="../Bootstrap/js/bootstrap.min.js"></script>
	<link href="../Bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
	<link href="../css/all.css"  rel="stylesheet" rel="stylesheet" type="text/css"/> 
	<link href="../css/reset.css"  rel="stylesheet" rel="stylesheet" type="text/css" />
	
	<link href="../css/active_login_box.css" rel="stylesheet" type="text/css" />
	</head>
	<Script>
	<%
	Boolean flag;
	if(request.getSession().getAttribute("username")!=null){
		flag=true;
	}else{
		flag=false;
	}%>
	flag=<%=flag%>
	$(document).ready(function(){
		if(flag){
			$('#wel').fadeOut(0.01);
			$('#wel1').fadeOut(0.01);
			$('#user').fadeIn(0.01);
			$('#carts').fadeIn(0.01);
			
		}else{
			$('#user').fadeOut(0.01);
			$('#wel').fadeIn(0.01);
			$('#wel1').fadeIn(0.01);
			$('#carts').fadeOut(0.01);
			/* $('.theme-login').click(function(){
				$('.theme-popover-mask').fadeIn(100);
				$('.theme-popover').slideDown(200);
			});
			$('.theme-poptit .close').click(function(){
				$('.theme-popover-mask').fadeOut(100);
				$('.theme-popover').slideUp(200);
			}); */
			$('.theme-login').click(function(){
				alert("请您先登录");
				return false;
			});
		};
		$('#user,.user-manager').mouseover(function(){
			$('.user-manager').fadeIn(0.0001);
		});
		$('#user,.user-manager').mouseout(function(){
			$('.user-manager').fadeOut(0.0001);
		});
		
	});
	</Script>
	<style>
	  
	  .buy-comment{ height:260px; border:5px dotted orange;margin:10px auto}
	  .buy-comment  img{ width:235px; height:135px; margin-top:12px}
	  .content{margin-left:55px; margin-top:35px; width:680px;padding:18px 0}
	  .content {width:710px; margin-left:220px;margin-top:55px}
	  .content b{ padding-top:10px; height:35px; width:125px; font-size:25px}
	  .content i{font-weight:500}
	  .content a{ text-decoration:none; padding-top:12px;
	  display:inline-block;margin:0 20px}
	  .back a{text-decoration:none; margin-top:15px;margin-left:710px;
	   display:inline-block;width:180px; height:55px; background:orange
	   ;font-size:20px;padding:10px 5px;color:white;border-radius:5px;
	   box-shadow:-4px -4px 10px green;}
	</style>
	<body >
	<div class="header">
		<div class="topbar">
			<div class="commonWidth">
				<div class="top-message fr">
				  
				</div>
				<marquee scrollamount="4">您的购买是我们进步的最大动力</marquee>
			</div>
		</div>
		<div class="logo-bar">
				<div class="commonWidth">
					<div class="logo fl">
						<a href="index.jsp" target="_blank"><img src="../img/logo.png" title="logo" /></a>
					</div>
					<div class="fl search">
					     <img src="../img/cart/buy.gif" title="感谢您的购买"/>
					</div>
				</div>
		</div>
		<div class="nav-bar commonWidth">
			<div class="">
			 
			</div>
		</div>
	</div>
	<div class="commonWidth buy-comment">
	   <img src="../img/cart/buy.jpg" title="支付成功" class="fl"> 
	   <div class="content">
	     <b>支付成功，您的货物将会尽快发出!</b><i>付款时间为：</i><%=datetime %><br>
	    <a>您的订单号为：201706199509A</a>
	    <i style="color:red">请你牢记订单号，以便于以后的查询。</i>
	   </div>
	   <div class="back">
	     <b></b>
	     <a href="index.jsp">返回商城首页>></a>
	   </div>
	</div>

</body>
</html>