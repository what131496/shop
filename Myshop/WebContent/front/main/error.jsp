<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="entity.Book1"%>
<%@ page import="dao.Book1Dao"%>
<%@ page import="entity.Book2"%>
<%@ page import="dao.Book2Dao"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
	<head>
	<meta name="renderer" content="webkit" />
	<meta http-equiv="X-UA-Compatible" content="IE=9"/>
    <meta http-equiv="X-UA-Compatible" content="IE=10"/>
	<meta charset="UTF-8">
	<title>对不起，我们还没开发这个页面</title>
	<link rel="shortcut icon" href="<%=path %>/front/img/book.ico" />
	<script src="<%=path %>/front/Bootstrap/js/jquery.min.js"></script>
	<script src="<%=path %>/front/js/index.js"></script>
	<script src="<%=path %>/front/Bootstrap/js/bootstrap.min.js"></script>
	<link href="<%=path %>/front/Bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
	<link href="<%=path %>/front/css/all.css"  rel="stylesheet" rel="stylesheet" type="text/css"/> 
	<link href="<%=path %>/front/css/reset.css"  rel="stylesheet" rel="stylesheet" type="text/css" />
	
	<link href="<%=path %>/front/css/active_login_box.css" rel="stylesheet" type="text/css" />
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
	.error{height:480px}
	.back a{text-decoration:none; margin-top:25px;margin-left:460px;
	   display:inline-block;width:180px; height:55px; background:orange
	   ;font-size:20px;padding:10px 5px;color:white;border-radius:5px;
	   box-shadow:-4px -4px 10px green;}
	</style>
	<body>
	<div class="header">
		<div class="topbar">
			<div class="commonWidth">
				<div class="fl top-place">
					兰州
				</div>
				<div class="top-message fr">
					<ul>
						<li><a href="logon.jsp"  id="wel">你好，请登录|</a></li>
						<li style="color:orange;cursor:pointer"  id="user">你好 <%=request.getSession().getAttribute("username")%></li>
						<div class="user-manager">
						<a href="exit.jsp" onclick="return confirm('您确定要退出吗？')">注销登录</a>
						<a href="find.html" onclick="return confirm('您确定修改密码？')">修改密码</a>
						</div>
						<li><a href="register.jsp" id="wel1">免费注册 |</a></li>
						<li id="carts"><a href="cart.jsp">我的购物车|</a></li>
						<li><a href="cart.jsp" class="theme-login">我的订单|</a></li>
						<li><a href="#2" class="theme-login">我的书店 |</a></li>
						<li><a href="#3" class="theme-login">客户服务</a></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="logo-bar">
				<div class="commonWidth">
					<div class="logo fl">
						<a href="index.jsp" target="_blank"><img src="../img/logo.png" title="logo" /></a>
					</div>
				</div>
		</div>
	</div>
  <div class="commonWidth error" style="background:url(<%=path %>/front/img/logon/error.jpg)">
    <img src="../img/logon/sorry.gif"/>
     <div class="back">
	     <a href="index.jsp">返回商城首页>></a>
	   </div>
  </div>
</body>
</html>