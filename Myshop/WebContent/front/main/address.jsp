<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="entity.Cart" %>
 <%@ page import="entity.Book1" %>
 <%@ page import="entity.Address" %>
 <%@ page import="dao.AddressDao" %>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>收货地址填写-缺书网</title>
	<link rel="shortcut icon" href="../img/book.ico" />
	<script src="../Bootstrap/js/jquery.min.js"></script>
	<script src="../js/Area.js"></script>
	<script src="../js/AreaData_min.js"></script>
	<script src="../js/address.js"></script>
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
						<img src="../img/book1/car2.png">
					</div>
				</div>
		</div>
	</div>
	<div class="commonWidth buy-detail">
	   <h4>您的购物详情为：</h4>
	   <table width="800">
	   <%
	    		 //首先判断session中是否存在
	    		 if(request.getSession().getAttribute("cart")!=null){
	    			// 循环的开始 
	    			Cart cart=(Cart)request.getSession().getAttribute("cart");
	    			HashMap<Book1,Integer> goods=cart.getGoods();
	    			Set<Book1> book=goods.keySet();
	    			Iterator<Book1> it=book.iterator();
	    			while(it.hasNext()){
	    				Book1 b=it.next();
	    			
	    		%>
	   	<tr>
	   		<td>书名：<%=b.getBookName() %></td>
	   		<td>作者：<%=b.getAuthor() %></td>
	   		<td>数量：<%=goods.get(b) %></td>
	   		<td style="font-size:15px">金额：<%=b.getCurrentPrice()*goods.get(b) %>￥</td>
	   	</tr>
	   	<%}
	    			}%>
	   </table>
	</div>
	<%
          AddressDao itemsDao=new AddressDao();
          Address address = itemsDao.getBookByName(request.getSession().getAttribute("username").toString());
          if(address!=null) {
    %>
	<div class="commonWidth clearfix default-add">
	    <h5>您的默认地址为：<b id="useradd"><%=address.getArea()%>&nbsp;<%=address.getAddress() %>&nbsp;电话：<%=address.getPhone()%></b></h5> <a href="pay.jsp" id="useAdd">使用默认地址》</a>
	</div>
	<%} %>
	<div class="car-main2 clearfix commonWidth">
		<div class="fl">
			<div id="demo" style="height: 300px; width: 380px; overflow: hidden;margin: 20px auto;">
				<div id="demo1">
					<a href="#"><img src="../img/cart/001.png"></a>
					<a href="#"><img src="../img/cart/002.png"></a>
					<a href="#"><img src="../img/cart/003.png"></a>
					<a href="#"><img src="../img/cart/004.png"></a>
				</div>
				<div id="demo2"></div>
				<script>
				   var speed=80
				   demo2.innerHTML=demo1.innerHTML
				   function Marquee(){
				   if(demo2.offsetTop-demo.scrollTop<=0)
				   demo.scrollTop-=demo1.offsetHeight
				   else{
				   demo.scrollTop++
				   }
				   }
				   var MyMar=setInterval(Marquee,speed)
				   demo.onmouseover=function() {clearInterval(MyMar)}
				   demo.onmouseout=function() {MyMar=setInterval(Marquee,speed)}
			   </script>
			</div>
			
		</div>
		<div class="fr address">
			<h4>新增收货人信息：</h4>
			<a href="cart.jsp">《&nbsp;返回购物车</a>
			<form action="../../AddressServlet" method="post">
				<ul>	
					<li><i>*</i>收货人姓名：<input type="text" name="name" required="required" placeholder="请你填写真实姓名"></li>
					<li class="a1"><i>*</i>电话：<input type="number" name="phone" required="required" placeholder="请你填写有效的手机号码"></li>
					<li class="a3">固定电话：<input type="number" name="fixPhone" placeholder="最好填写为了您的利益"></li>
					<li class="a2"><i>*</i>所在地区：
						<select id="seachprov" name="seachprov" onChange="changeComplexProvince(this.value, sub_array, 'seachcity', 'seachdistrict');"></select>&nbsp;&nbsp;
						<select id="seachcity" name="homecity" onChange="changeCity(this.value,'seachdistrict','seachdistrict');"></select>&nbsp;&nbsp;
						<span id="seachdistrict_div"><select id="seachdistrict" name="seachdistrict"></select></span>
					</li>
					<input type="hidden" name="area" id="area"/>
					<li class="a4"><i>*</i>详细地址：<input type="text" name="address" required="required" placeholder="请尽量写的详细可靠"></li>
					<li class="a5"><i>*</i>邮箱：<input type="text" name="aEmail" required="required" placeholder="填写有效的邮箱"></li>
					<li class="a6"> <input type="submit" value="确定" onClick="showAreaID()"></li>
				</ul>
			</form>
		</div>
	</div>
	<div class="" style="width: 1010px; margin: 5px auto;">
	   <img src="../img/cart/address1.png">
	</div>
	<div class="footer">
		  <iframe align="center" width="100%" height="100%" src="../need/footer.html" frameborder="no" border="0" marginwidth="0" marginheight="0" scrolling="no"></iframe>
	</div>
	</body>
</html>
