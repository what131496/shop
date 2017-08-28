<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<link rel="shortcut icon" href="../img/book.ico" />
		<script type="text/javascript" src="../js/time.js" ></script>
	</head>
	<style>
		.top-main{ background: lightgreen; height: 180px; width: 1376px; margin-left: -10px; margin-top: -8px;}
		.top-menu{ width: 310px; margin-left: 1060px; margin-top: -55px; }
		.top-menu b{ height: 25px; display: inline-block; line-height: 20px;}
		.top-menu img{  margin-right: 5px; margin-top: 5px;}
		.top-menu span{ height: 40px; line-height: 40px;color:white}
		.top-menu a{ text-decoration: none; color: orange;}
		.time{ height: 40px; width: 740px; margin-left: 210px; color: white; font-weight: bold; }
	    
	</style>
	<body>
		<div class="top-main clearfix" style="background:rgb(67,92,9); width: 1380px; height: 160px;">
				<img src="../img/title.png">
			<div class="time">
			     <marquee behavior="alternate" scrollamount="2" width="780px"><span class="a_time" id="show">时间显示</span></marquee>
		    </div>	
			<div class="top-menu">
				<span><img src="../img/user1.png"/><b>用户名：<%=request.getSession().getAttribute("shopadminname") %></b></span>
				<span><img src="../img/exit.png"/><b><a href="exit.jsp">退出</b></a></span>
			</div>
		</div>
	</body>
</html>
