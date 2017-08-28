<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<!-- 导入jQuery库 
获取username的节点值，添加change函数;
获取用户名的值去除空格并且发送ajax请求；
服务端返回一个HTML请求
-->
<script src="front/Bootstrap/js/jquery.min.js"></script>
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
<body>
<form action="" method="post">
   用户名：<input type="text" name="username"><br>
  <div id="message"></div> 
  <br>
  <input type="submit" value="确定"/>
</form>
</body>
</html>