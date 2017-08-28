<%@ page language="java" import="java.util.*" contentType="text/html;  charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="entity.Salable"%>
<%@ page import="dao.SalableDao"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<style>
body {
	font-size: 12px;
	line-height: 24px;
	text-algin: center;        /* 页面内容居中 */
}
* {
	margin: 0px;
	padding: 0px;            /*  去掉所有标签的marign和padding的值  */
}
#moocBox ul {
	list-style: none;           /*  去掉ul标签默认的点样式  */
}
#moocBox a img {
	border: none;        /*  超链接下，图片的边框  */
}
#moocBox a {
	color: #333;
	text-decoration: none;     /* 超链接样式 */
}
#moocBox a:hover {
	color: #ff0000;
}
#mooc {
	width: 258px;
	border: 3px solid #ababab;
	-moz-border-radius: 10px;      /* Gecko browsers */
	-webkit-border-radius: 10px;   /* Webkit browsers */
	border-radius: 10px;
	box-shadow: 2px 2px 10px #ababab;
	margin: 15px auto 0;
	text-align: left; 
	margin-left: 5px;              /* 让新闻内容靠左 */
}
/*  头部样式 */	
#moocTitle {
	height: 52px;
	overflow: hidden;  /* 这个一定要加上，内容超出的部分要隐藏，免得撑高头部 */
	font-size: 18px;
	line-height: 52px;
	padding-left: 30px;
	background-image: -moz-linear-gradient(top, #f05e6f, #c9394a); /* Firefox */
	background-image: -webkit-gradient(linear, left top, left bottom, color-stop(0, #f05e6f), color-stop(1, #c9394a)); /* Saf4+, Chrome */
filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#8fa1ff', endColorstr='#f05e6f', GradientType='0'); /* IE*/
	border: 1px solid ##f05e6f;
	-moz-border-radius: 8px 8px 0 0;      /* Gecko browsers */
	-webkit-border-radius: 8px 8px 0 0;   /* Webkit browsers */
	border-radius: 8px 8px 0 0;
	color: #fff;
	position: relative;
}
#moocTitle a {
	position: absolute;
	right: 10px;
	bottom: 10px;
	display: inline;
	color: #fff;
	font-size: 12px;
	line-height: 24px;
}
/*  中间样式 */
#moocBox {
	height: 195px;
	width: 250px;
	margin-top: 10px;
	overflow: hidden;    /*  这个一定要加，超出的内容部分要隐藏，免得撑高中间部分 */
}
#mooc ul li {
	height: 24px;
}
#mooc ul li a {
	width: 150px;
	float: left;
	display: block;
	overflow: hidden;
	text-indent: 15px;
	height: 24px;
}
#mooc ul li span {
	float: right;
	color: #999;
}
</style>
</head>

<body>
<!--  慕课网课程公告开始 -->
<div  id="mooc"> 
<!--  头部 -->
<div  id="moocTitle">畅销榜<a href="#" target="_self">更多>></a> </div>
<!--  头部结束 --> 
<!--  中间 -->

<div  id="moocBox">
    <ul>
    <%
 SalableDao salDao=new SalableDao();
  ArrayList<Salable> sal=salDao.getAllSalable();
  if(sal!=null && sal.size()>0){
	  for(int i=0;i<sal.size();i++){
		  Salable salable=sal.get(i);
%>
        <li><a href="#"><%=salable.getContent()%></a><span><%=salable.getTime() %></span></li>
        <%}
	  } 
	  %>
    </ul>
</div>

<!--  中间结束 --> 
</div>
<!--  慕课网课程公告结束 --> 

<script type="text/javascript">
 var area = document.getElementById('moocBox');
 var iliHeight = 24;//单行滚动的高度
 var speed = 50;//滚动的速度
 var time;
 var delay= 2000;
 area.scrollTop=0;
 area.innerHTML+=area.innerHTML;//克隆一份一样的内容
 function startScroll(){
	 time=setInterval("scrollUp()",speed);
	 area.scrollTop++;
	 }
 function scrollUp(){
	 if(area.scrollTop % iliHeight==0){
		 clearInterval(time);
		 setTimeout(startScroll,delay);
		 }else{
			 area.scrollTop++;
			 if(area.scrollTop >= area.scrollHeight/2){
				 area.scrollTop =0;
				 }
			 }
	 }
	 setTimeout(startScroll,delay)
 </script>
</body>
</html>
