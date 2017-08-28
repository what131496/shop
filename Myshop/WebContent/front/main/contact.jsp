<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="entity.Book3"%>
<%@ page import="dao.Book3Dao"%>
<%@ page import="dao.LiuyanDao" %>
<%@ page import="entity.Liuyan" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<title>留言板--缺书网</title>
	<link rel="shortcut icon" href="../img/book.ico" />
	<script src="../Bootstrap/js/jquery.min.js"></script>
	<script src="../Bootstrap/js/bootstrap.min.js"></script>
	<link href="../Bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
	<link href="../css/all.css"  rel="stylesheet" type="text/css"/> 
	<link href="../css/reset.css"  rel="stylesheet" type="text/css" />
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
						<div class="user-manager"><a href="exit.jsp" onclick="return confirm('您确定要退出吗？')">注销登录</a></div>
						<li><a href="register.jsp" id="wel1">免费注册 |</a></li>
						<li id="carts"><a href="cart.jsp">我的购物车|</a></li>
						<li><a href="cart.jsp" class="theme-login">我的订单|</a></li>
						<li><a href="#">我的书店 |</a></li>
						<li><a href="#">客户服务</a></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="logo-bar">
				<div class="commonWidth">
					<div class="logo fl">
						<a href="index.html" target="_blank"><img src="../img/logo.png" title="logo" /></a>
					</div>
					<div class="fl search">
						<input type="text" placeholder="请输入关键字" class="search-text"/>
						<input type="submit" value="提交" class="search-btn" />
					</div>
					<div class="shop-car fr">
						<a class="#"><span class="shopcar-text fl">我的购物车[0]</span></a>
					</div>
				</div>
		</div>
		<div class="nav-bar commonWidth">
			<div class="nav-all fl">
				全部商品分类<span class="nav-icon">&#8711;</span>
			</div>
			<jsp:include page="top.html"></jsp:include>
				</div>
    </div>
      <style>
        .contact{ height: auto;}
		.contact-title{ width: 120px; margin: 15px 26px; background-color: greenyellow; padding: 10px 0; font-size: 16px;}
		.contact-title a{ text-decoration: none; height: 32px; display: block; text-align: center;padding: 8px 0;color: white;}
		.ahover{ background: orange;}
		.contacts{  height: auto;margin-left: 180px;margin-top: -80px; width: 780px; margin-bottom: 15px; }
		.contact-content{width: 780px;  height: 580px; padding-top: 60px;}
		.contact-content form{width: 480px; margin: 50px auto;}
		.contact-content input{ width: 368px; height: 25px;margin: 5px; }
        .contact-main2 li{ list-style: none; height: auto; line-height: 22px; color:black;
		     font-weight: 400;border: 2px solid gainsboro; margin: 10px; padding: 10px; display: block;}
		.contact-main2 b{ float: left; color: darkgray; display:block; margin: 2px; width: 800px;  }
		 .contact-main2{overflow:hidden; height:auto}       
      </style>
      <script type="text/javascript">
    window.onload=function(){
    var adiv=document.getElementById("middle");
	var ali=adiv.getElementsByTagName("a");
	var odiv=document.getElementById("main");
	var od=odiv.getElementsByTagName("div");
	var index;
	for(var i=0;i<ali.length;i++){
			ali[i].index=i;
	  }
	  adiv.addEventListener("click",function(e){
	  	if(e.target.nodeName.toLowerCase()=="a"){
	  		for(var j=0;j<od.length;j++){
	  			od[j].style.display="none";
	  			ali[j].className="";
	  		}
	  		ali[e.target.index].className="ahover";
	  		od[e.target.index].style.display="block";
	  	}
	  },false);
}
</script>
	 <div class="contact commonWidth">
      <div class="contact-title" id="middle">
      	<a href="#1" class="ahover">我要留言</a>
	    <a href="#2">查看近期</a>
      </div>
      <div class="contacts" id="main">
     		<div class="contact-content" style="background:url(../img/index/liuyan.jpg);">
     			<form action="../../liuyanServlet?method=add" method="post">
     				<table  width="560" height="410">
     					<tr>
     						<td>姓名</td>
     						<td><input type="text" name="name" required="required"></td>
     						
     					</tr>
     					<tr>
     						<td>联系方式</td>
     						<td><input type="number" name="phone" required="required"></td>
     					</tr>
     					<tr>
     						<td>邮箱</td>
     						<td><input type="email" name="email" required="required"></td>
     					</tr>
     					<tr>
     						<td>留言内容</td>
     						<td colspan=""><textarea name="content" cols="50" rows="10" required="required"></textarea></td>
     					</tr>
     					<tr>
     						<td></td>
     						<td ><input type="submit" value="提交留言"></td>
     					</tr>
     				</table>
     			</form>
     		</div>
     		<div class="contact-main2" style="display:none;">
     			<ul>
     				<%
			  	  LiuyanDao picture=new LiuyanDao();
			  	  ArrayList<Liuyan> pic=picture.getAllLiuyan();
			  	  if(pic!=null && pic.size()>0){
			  		  for(int i=0;i<pic.size();i++){
			  			  Liuyan p=pic.get(i);
			  		
			  	%>
     				<li>
     					 <b><%=p.getName() %>   <i><%=p.getTime()%></i></b>
     					<%=p.getContent() %>
     				</li>
     		<%}
			  		  } %>
     			</ul>
     		</div>
     </div>
    </div> 
	<div class="footer">
		<div class="footer-content">
			<a href="#">公司简介</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
			<a href="#">加入收藏</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
			<a href="#">诚聘英才</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp; &nbsp; 
			<a href="#">Investor Relations</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp; &nbsp;
			<a href="#">缺书招商</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp; &nbsp; 
			<a href="#">机构销售</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp; &nbsp;
			<a href="#">手机缺书</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp; &nbsp;
			<a href="#">关于我们</a>&nbsp;&nbsp;&nbsp;<br />
		</div>
		<div class="footer-content2">
            <a href="#">友情链接</a>：&nbsp;&nbsp;&nbsp;			
            <a href="#">百度</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
			<a href="#">淘宝</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp; &nbsp; 
			<a href="#">京东</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp; &nbsp;
			<a href="#">缺书招商</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp; &nbsp; 
			<a href="#">机构销售</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp; &nbsp;
			<a href="#">手机缺书</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp; &nbsp;
			<a href="#">关于我们</a>&nbsp;&nbsp;&nbsp;
		</div>
		<div class=" footer-b commonWidth">
			<img src="../img/index/validate.gif"> (C) 缺书网 2017-2067, All Rights Reserved
		</div>
		
	</div>
	</body>
</html>
