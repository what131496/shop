<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="entity.Cart" %>
 <%@ page import="entity.Book1" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<title>购物车</title>
	<link rel="shortcut icon" href="../img/book.ico" />
	<script src="../Bootstrap/js/jquery.min.js"></script>
	<script src="../js/payfor.js"></script>
	<link href="../Bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
	<link href="../css/all.css"  rel="stylesheet" type="text/css"/> 
	<link href="../css/reset.css"  rel="stylesheet" type="text/css" />
	</head>
	<Script>
	<%
	Boolean flag;
	if(request.getSession().getAttribute("username")!=null){
		flag=true;
	}else{
		flag=false;
	}
	%>
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
						<li><a href="logon.html"  id="wel">你好，请登录|</a></li>
						<li style="color:orange;cursor:pointer"  id="user">你好 <%=request.getSession().getAttribute("username") %> &nbsp;|</li>
						<div class="user-manager"><a href="exit.jsp" onclick="return confirm('您确定要退出吗？')">注销登录</a></div>
						<li><a href="register.html" id="wel1">免费注册 |</a></li>
						<li id="carts"><a href="cart.jsp">我的购物车|</a></li>
						<li><a href="cart.jsp">我的订单|</a></li>
						<li><a href="#">我的书店 |</a></li>
						<li><a href="#">客户服务</a></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="logo-bar">
				<div class="commonWidth">
					<div class="logo fl">
						<a href="index.jsp" target="_blank"><img src="../img/logo.png" title="logo" /></a>
					</div>
					<div class="fr procudre">
						<img src="../img/book1/car1.png">
					</div>
				</div>
		</div>
	</div>
	<%
	    		 //首先判断session中是否存在
	    		 if(request.getSession().getAttribute("cart")!=null){
	    			// 循环的开始 
	    			Cart cart=(Cart)request.getSession().getAttribute("cart");
	    			HashMap<Book1,Integer> goods=cart.getGoods();
	    			Set<Book1> book=goods.keySet();
	    			Iterator<Book1> it=book.iterator();
	    			Book1 bo=new Book1();
	    %>
	<div class="car-main commonWidth clearfix">
		<div class="car-title">
			<b>选货清单</b>
			<div class="fr car-back">
				<a href="book1.jsp?id=1">《&nbsp;重新选购</a>
			</div>
		</div>
		<div class="car-thing">
			<div class="thing-title">
				<table width="980">
					<thead width="980">
						<td width="540">
						   <label for="j_select"><input id="j_select" type="checkbox">&nbsp;&nbsp;全选</label><b class="tabe1">商品详情</b>
						</td>
						<td>单价(元)</td>
						<td>数量(件)</td>
						<td>金额(元)</td>
						<td>操作</td>
					</thead>
				</table>
			</div>
		</div>
	    <div class="thing1 fr">
	    	<table>
	    		<thead>
	         		<label class="th2" for="j_select">
	         			<input id="j_select" type="checkbox">&nbsp;&nbsp;
	         		</label><b>缺书自营</b>
	    		</thead>
	    		
	    		
	    		<%	while(it.hasNext()){
	    				Book1 b=it.next();
	    			
	    		%>
	    		
	    		<tr>
	    			<td height="170"><label for="j_select"><input id="j_select" type="checkbox"></label>
	    				<img src="../img/<%=b.getPicture()%>"> 
	    			</td>
	    			<td width="322"><h5>这本书的最大优点在于真的不让人知道那个智慧在哪这本书的最大优点在于真的不让人知道那个智慧在哪</h5></td>
	    			<td width="120"><span id="price_item_1">￥<%=b.getCurrentPrice()%></span></td>
	    			<td width="80">
	    				<%=goods.get(b) %>
	    			</td>
	    			<td width="120">
	    				<%=b.getCurrentPrice()*goods.get(b) %>
	    			</td>
	    			<td width="120">
	    				<a onclick="return confirm('你确定删除吗？')" href="../../CartServlet?action=delete&id=<%=b.getId()%>">删除</a>
	    				<a href="#">加入收藏</a>
	    			</td>
	    		</tr>
	    		<%
	    		    } 
	    		%>
	    	</table>
	    </div>
	  
	</div>
	 <div class="commonWidth totalprice">总金额：<%=cart.getTotalPrice() %>￥
	    <a href="address.jsp">确定购买</a>
	 </div>
	<%} %>
	</body>
</html>
