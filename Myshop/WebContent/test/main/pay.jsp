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
	<title>付款-缺书网</title>  
	<link rel="shortcut icon" href="../img/book.ico" />
	<script src="../Bootstrap/js/jquery.min.js"></script>
	<script src="../js/payfor.js"></script>
	<script src="../js/car.js"></script>
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
		};
		$('#user,.user-manager').mouseover(function(){
			$('.user-manager').fadeIn(0.0001);
		});
		$('#user,.user-manager').mouseout(function(){
			$('.user-manager').fadeOut(0.0001);
		});
		/* 弹出登录窗口 */
		$('.theme-login').click(function(){
			$('.theme-popover-mask').fadeIn(100);
			$('.theme-popover').slideDown(200);
		});
		$('.theme-poptit .close').click(function(){
			$('.theme-popover-mask').fadeOut(100);
			$('.theme-popover').slideUp(200);
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
						<a href="index.html" target="_blank"><img src="../img/logo.png" title="logo" /></a>
					</div>
					<div class="fr procudre">
						<img src="../img/book1/car3.png">
					</div>
				</div>
		</div>
	</div>
	<div class="car-main commonWidth">
		<div class="car-title">
			<b>清点款项</b>
			<div class="fr car-back">
				<a href="cart.jsp">《&nbsp;返回购物车</a>
			</div>
		</div>
		   <%
	    		 //首先判断session中是否存在
	    		    if(request.getSession().getAttribute("cart")!=null){
	    			// 循环的开始 
	    			Cart cart=(Cart)request.getSession().getAttribute("cart");
	    	%>
		<div class="commonWidth buy-total">
			<div class="total-title clearfix">
				<h4>订单提交成功，请您尽快付款</h4>
				<h6>请您尽快在<span id="LeftTime"></span>分钟之后付款。否则我们会取消订单。（库存紧张，仅以订单为准）</h6>
				<h5 class="fr">应付金额：<b><%=cart.getTotalPrice() %>元</b></h5>
				<script>
					function show(){
						var hpn= document.getElementById('hpn');
					        var btn= document.getElementById('strHREF');
						hpn.style.display="block";
						btn.innerHTML='收起详情--';
						btn.href="javascript:hide();"
						}
					   function  hide(){
						var hpn= document.getElementById('hpn');
					    var btn= document.getElementById('strHREF');
						hpn.style.display="none";
						btn.innerHTML='购物详情++';
						btn.href="javascript:show();"
						}
				</script>
				<div id="pn" class="pn">
					<p class="pn-p"><a href="javascript:show();" id="strHREF" class="btn">购物详情++</a></p>
			         <div id="hpn" class="hpn" style="display:none">
			           <p>收货地址：
			           <%
					          AddressDao itemsDao=new AddressDao();
					          Address address = itemsDao.getBookByName(request.getSession().getAttribute("username").toString());
					          if(address!=null){
					    %>
			             <b><%=address.getArea()%>&nbsp;<%=address.getAddress() %>&nbsp;电话：<%=address.getPhone()%></b>
			           </p>
			           <%} %>
			           <p>商品名称：
			             <table width="800">
			           <%
	    			HashMap<Book1,Integer> goods=cart.getGoods();
	    			Set<Book1> book=goods.keySet();
	    			Iterator<Book1> it=book.iterator();
	    			while(it.hasNext()){
	    				Book1 b=it.next();
	    		%>
						   	<tr>
						   		<td width="200">书名：<%=b.getBookName() %></td>
						   		<td width="200">作者：<%=b.getAuthor() %></td>
						   		<td width="200">数量：<%=goods.get(b) %></td>
						   		<td style="font-size:15px">金额：<%=b.getCurrentPrice()*goods.get(b) %>￥</td>
						   	</tr>
						  	<%} %>
						   </table>
			           </p>
			         </div>
			     </div>
			</div>
			
			<div class="total-content">
				<h4>请选择支付方式：</h4>
				<ul class="">
					<li class="pay">支付宝<img src="../img/cart/alipay.jpg"><b class="fr">应付金额：<%=cart.getTotalPrice() %></b></li>
					<li class="payhover"> 微信<img src="../img/cart/weixin.jpg"></li>
					<li class="payhover"> 农业银行（2546）<img src="../img/cart/nonghang.jpg"></li>
				</ul>
				<%
	    			}%>
				 <a href="#" class="theme-login">添加银行卡</a>
			</div>
			<div class="theme-popover">
			      <div class="theme-poptit">
			          <a href="javascript:;" title="关闭" class="close">×</a>
			          <h3>填写你的银行卡信息</h3>
			      </div>
			      <div class="theme-popbod dform">
			           <form class="theme-signin" name="loginform" action="../../CardServlet" method="post">
			                <ol>
			                     <li><h4>请你填写信息！</h4></li>
			                     <li><strong>用户名：</strong><input class="ipt" type="text" name="name" value="<%=request.getSession().getAttribute("username") %>" size="20" /></li>
			                     <li><strong>身份证号：</strong><input class="ipt" type="text" name="IDnumber" value="" size="20" /></li>
			                     <li><strong>预留手机：</strong><input class="ipt" type="text" name="phone" value="" size="20" /></li>
			                     <li><strong>密码：</strong><input class="ipt" type="password" name="pwd" value="" size="20" /></li>
			                     <li><input class="btn btn-primary" type="submit" name="submit" value=" 确定提交 " /></li>
			                </ol>
			           </form>
			      </div>
			</div>
			<div class="theme-popover-mask"></div>
			<div class="add-ic">
				   <a href="#" class="fr"><input type="button" value="立即支付" /></a>
			</div>
			 
		</div>
	</div>
	</body>
</html>
