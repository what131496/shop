<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=8" />
<title>管理员登录</title>
<link href="../css/css.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../js/jquery.min.js"></script>
<script type="text/javascript" src="../js/js.js"></script>
</head>
<body>
<script type="text/javascript">
		function reloadCode(){
			var time = new Date().getTime();
			document.getElementById("imagecode").src="../../codeServlet?d="+time;
		}
</script>
<div class="div">
	  <form action="../../AdminLogonServlet" method="post">
	   <img src="../img/user.png" class="user"/>
	   <h2>缺书网后台登录</h2>
	   <b> 用户名:</b><input type="text" required="required" name="username"/><br />
	   <b> 密     &nbsp;码:</b><input type="password" required="required" name="password"/><br/>
	   <b> 验证码:</b><input type="text" class="code" required="required" name="code"/>
	   <img src="../../codeServlet" id="imagecode" alt="验证码"/>
	   <a href="javascript: reloadCode();">看不清</a>
	   <br/>
	   <input type="submit" value="登录" class="btn"/>
	  </form>
</div>
</body>
</html>
