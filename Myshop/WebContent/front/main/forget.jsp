<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>忘记密码</title>
		<link rel="shortcut icon" href="../img/book.ico" />
		<link href="../css/all.css"  rel="stylesheet" type="text/css"/> 
	    <link href="../css/reset.css"  rel="stylesheet" type="text/css" />
	</head>
	<style>
	   .f-content{ height: 310px; width: 330px; margin: 60px auto ;
		 border: 8px orange solid;}
		.f-content form{ margin: 10px auto; width: 280px;}
		.f-content b{ display: block; margin: 10px 0; font-weight: 550; font-size: 17px;}
		.f-content a{ margin-left: 200px; margin-top: 8px; display: block;}
		.f-content input{ width: 260px; height: 20px;}
		.f-content .f-btn{ width: 50px; margin: 10px 30px;}
		.f-content h2{ margin: 10px auto; width: 180px;}
		.f-content .f-code{ width: 100px;}
		.f-content img{ width: 60px; height: 25px; margin-left:15px; margin-bottom:-8px;
		 display: inline-block;}
		.f-content .re{margin-top:-15px; height:30px; width:50px; color:white}
		.find{ height: 260px;}
	</style>
	<script type="text/javascript">
		function reloadCode(){
			var time = new Date().getTime();
			document.getElementById("imagecode").src="../../codeServlet?d="+time;
		}
	</script>
	<body style="background: url(../img/logon/fbg.jpg);">
	  <div class="logon-header commonWidth">
			<a href="index.jsp"><img src="../img/logo.png"></a>
			<a href="#" class="fr"><img src="../img/logon/suggestion.png"></a>
		</div>
		<div class="f-content commonWidth">
			<h2>找回密码</h2>
			<form action="../../forgetServlet?method=forget" method="post">
				<b>用户名</b>
				<input type="text" name="username" required="required">
				<b>注册邮箱</b>
				<input type="email" name="email"required="required" /><br />
				<b>验证码</b>
				<input type="text" class="f-code" name="code" required="required">
				<img alt="验证码" src="../../codeServlet" id="imagecode"/>
				<a href="javascript: reloadCode();" class="re">看不清</a>
				<input type="submit" class="f-btn" value="确定">
				<input type="reset" class="f-btn" value="重置"><br />
				<a href="logon.jsp" >返回登录</a>
			</form>
		</div>
	</body>
</html>
