<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>欢迎登陆-缺书网</title>
		<link rel="shortcut icon" href="../img/book.ico" />
	</head>
	<link href="../css/all.css"  rel="stylesheet" type="text/css"/> 
	<link href="../css/reset.css"  rel="stylesheet" type="text/css" />
	<script src="../Bootstrap/js/jquery.min.js"></script>
	<script src="../js/check.js"></script>
	<!-- 导入jQuery库 
		获取username的节点值，添加change函数;
		获取用户名的值去除空格并且发送ajax请求；
		服务端返回一个HTML请求
		-->
		<script>
		  $(function(){
			  $(":input[name='username']").change(function(){
				  var val=$(this).val();
				  val=$.trim(val);
				  if(val !=""){
					  var url="${pageContext.request.contextPath}/servlet/validate";
					  var args={"username":val,"time": new Date()};
					  $.post(url,args,function(data){
						  $("#message").html(data);
					  });
				  };
			  });
		  });
		</script>
	<body >
		<div class="logon-header commonWidth">
			<a href="index.html"><img src="../img/logo.png"></a>
			<a href="#" class="fr"><img src="../img/logon/suggestion.png"></a>
		</div>
		<div style="background; padding-top: 15px; border-top: 5px red solid; background:url(../img/logon/1.jpg)">
		<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,19,0" width="250" height="230">
		  <param name="movie" value="../other/flash3551.swf" />
		  <param name="quality" value="high" />
		  <embed class="colock" src="../other/flash3551.swf" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="250" height="230"></embed>
		</object>
		<div class="all" >
			<div class="logon-box all-box" style="displaynone">
				<h1>用户登录</h1>
				<hr />
				<form action="../../logonServlet" name="myform2" method="post"> 
					<label for="username">用户名:</label> <br />
					   <input type="text" name="users" id="users" required="required"  value=""><br />
					<label  for="pass">密码：</label><br />
					   <input type="password" id="pass"   name="pass" required="required" value=""><br />
					<input type="submit" class="re-btn" name="sub" value="登录">
					<input type="reset" class="re-btn" name="sub2" value="重置">
				</form>	
				<a href="#"><img src="../img/logon/qq.png" alt="qq">&nbsp;QQ登录</a>
				<a href="#"> <img src="../img/logon/pay.png">&nbsp;支付宝登录</a>
				<span class="to-common">
				  如果还没有账号 <button class="to-register fr">点击我注册>></button>
				</span>
			</div>
			<div class="register-box all-box" style="display:none;">
				<h1>欢迎新用户注册</h1>
				<hr />
				<form action="../../RegServlet" name="myform" method="post" onsubmit="return regs('click')"> 
					<span class="stats1" id="message">请输入用户名</span><br />
					   <input type="text" name="username" id="username"  value="">
					   <br>
					<span class="stats1">请输入用户密码</span><br>
					   <input type="password" id="pass"   name="password" value="">
					   <br />
					 <span class="stats1">请输入用户确认密码</span><br>
					      <input type="password" name="repass" id="repass"  value="">
					      <br />
					 <span class="stats1">请输入邮箱</span><br>
					      <input type="text" name="email" id="email" value="" ><br />
					<div class="select">
					    <input  type="checkbox" value="阅读并同意">&nbsp;阅读并同意
					 	<a href="#"><span href="#">《缺书网协议》</span></a>
					</div>
					<input type="submit" class="re-btn" name="sub" value="提交">
					<input type="reset" class="re-btn" name="sub2" value="重置">
				</form>	
				<span class="to-common">
				  如果已经有账号 &nbsp;<button class="to-logon">点击我登录>></button>
				</span>
			</div>
		</div>
		</div>
	</body>
</html>
