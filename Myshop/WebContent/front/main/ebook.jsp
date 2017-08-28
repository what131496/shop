<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="entity.Book3"%>
<%@ page import="dao.Book3Dao"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>电子书--缺书网</title>
	<link rel="shortcut icon" href="../img/book.ico" />
	<script src="../Bootstrap/js/jquery.min.js"></script>
	<script src="../js/index.js"></script>
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
	<style>
	.ebook-boxs{width:980px; height: 560px;margin: 5px auto;}
    .ebook-contents ul{ margin: 5px 52px; width:981px}
    .ebook-title{ display: block; margin: 5px 15px;}
   .ebook-case a img{ width: 150px; height: 150px;}
    .contents a img{width: 150px; height: 150px;}
	</style>
	<body>
	<!--返回顶部的代码-->
	<div id="tbox">
		<a id="pinglun" href="#tag_cmt"></a>
		<a id="xiangguan" href="#tag_about"></a>
		<a id="gotop" href="javascript:void(0)"></a>
    </div>
       <!--右侧的款姐菜单-->
     <div class="menu2">
     	<a href=""><img src="../img/index/taobao.png"></a>
     	<a href=""><img src="../img/index/jingdong.png"></a>
     	<a href=""><img src="../img/index/tianmao.png"></a>
     	<a href="http://www.baidu.com" target="_blank"><img src="../img/index/baidu.png"></a>
     	<a href=""><img src="../img/index/guge.png"></a>
     </div>
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
	 <div class="commonWidth ">
	     <div class="ebook-boxs clearfix">
			<b class="ebook-title">最新上线&网络最热</b>
			 <div id="myCarousel" class="carousel slide">
					    <!-- 轮播（Carousel）项目 -->
					    <div class="carousel-inner ebook-contents">
					        <div class="item active contents ">
					            <ul>
					            
				<% 
		               Book3Dao itemsDao = new Book3Dao(); 
		               ArrayList<Book3> list = itemsDao.getAllbook();
		               if(list!=null&&list.size()>0)
		               {
			               for(int i=0;i<10;i++)
			               {
			                  Book3 item = list.get(i);
		           %>   
						   	  		<li class="line1">
						   	  			<a title="新书" href="book3.jsp?id=<%=item.getId()%>"><img src="../img/ebook/<%=item.getPicture()%>.jpg"></a>
						   	  			<p class="tab-name"><a href="#"><%=item.getBookName() %></a></p>
						   	  			<p class="tab-coin">缺书网独家特供</p>
						   	  			<p class="tab-price">
						   	  			   <span class="price">￥<%=item.getCurrentPrice() %></span>
										   <span class="price-d">￥<%=item.getRealPrice() %></span>
						   	  			</p>
						   	  		</li>
						   	  <%}
			               } %>		
					   	  		</ul>
					        </div>
					        <div class="item contents">
					              <ul>
					          <%   for(int i=0;i<10;i++)
			               {
			                  Book3 item = list.get(i);
		           %>   
						   	  		<li class="line1">
						   	  			<a title="新书" href="book3.jsp?id=<%=item.getId()%>"><img src="../img/ebook/<%=item.getPicture()%>.jpg"></a>
						   	  			<p class="tab-name"><a href="#"><%=item.getBookName() %></a></p>
						   	  			<p class="tab-coin">缺书网独家特供</p>
						   	  			<p class="tab-price">
						   	  			   <span class="price">￥<%=item.getCurrentPrice() %></span>
										   <span class="price-d">￥<%=item.getRealPrice() %></span>
						   	  			</p>
						   	  		</li>
						   	  <%}
			               %>		
					   	  		</ul>
					        </div>
					        <div class="item contents">
					              <ul>
						   <%	  		for(int i=0;i<10;i++)
			               {
			                  Book3 item = list.get(i);
		           %>   
						   	  		<li class="line1">
						   	  			<a title="新书" href="book3.jsp?id=<%=item.getId()%>"><img src="../img/ebook/<%=item.getPicture()%>.jpg"></a>
						   	  			<p class="tab-name"><a href="#"><%=item.getBookName() %></a></p>
						   	  			<p class="tab-coin">缺书网独家特供</p>
						   	  			<p class="tab-price">
						   	  			   <span class="price">￥<%=item.getCurrentPrice() %></span>
										   <span class="price-d">￥<%=item.getRealPrice() %></span>
						   	  			</p>
						   	  		</li>
						   	  <%}
			               %>		
					   	  		</ul>
					        </div>
					    </div>
					    <!-- 轮播（Carousel）导航 -->
					    <a class="carousel-control left" href="#myCarousel" 
					        data-slide="prev">&lsaquo;
					    </a>
					    <a class="carousel-control right" href="#myCarousel" 
					        data-slide="next">&rsaquo;
					    </a>
	        </div>
		</div>
	 </div>
	 	<div class="shop-case  commonWidth">
		<div class="case-box">
			<table width="980">
				<tr>
					<td colspan="5" height=50 width=700 style="border-bottom: 2px dotted goldenrod;"  >
						<span class="shop-hot fl">男生@重磅推荐</span><b  class="case-more fr"><a href="#">更多more</a></b>
					</td>
				</tr>
				<tr>
				  <%	  		for(int i=10;i<14;i++)
			               {
			                  Book3 item = list.get(i);
		           %>   
					<td height=80 width=175 style="padding-top: 10px; padding-bottom: 10px;" >
						<a href="book3.jsp?id=<%=item.getId()%>">
							<img src="../img/ebook/<%=item.getPicture() %>.jpg" />
						</a>
						<p class="book-name">
							<a href="#"><%=item.getBookName() %></a>
						</p>	
						<p class="author">
							<%=item.getAuthor() %>
						</p>
						<p class="book-price">
							<span class="price">￥<%=item.getCurrentPrice() %></span>
							<span class="price-d">￥<%=item.getRealPrice() %></span>
						</p>
					</td>
					<%} %>
				</tr>
				<tr>
					<%	  		for(int i=10;i<14;i++)
			               {
			                  Book3 item = list.get(i);
		           %>   
					<td height=80 width=175 style="padding-top: 10px; padding-bottom: 10px;" >
						<a href="book3.jsp?id=<%=item.getId()%>">
							<img src="../img/ebook/<%=item.getPicture() %>.jpg" />
						</a>
						<p class="book-name">
							<a href="#"><%=item.getBookName() %></a>
						</p>	
						<p class="author">
							<%=item.getAuthor() %>
						</p>
						<p class="book-price">
							<span class="price">￥<%=item.getCurrentPrice() %></span>
							<span class="price-d">￥<%=item.getRealPrice() %></span>
						</p>
					</td>
					<%} %>
				</tr>
			</table>
		</div>
	</div>
	<div class="shop-case  commonWidth">
		<div class="case-box ebook-case clearfix">
			<table width="980">
				<tr>
					<td colspan="5" height=50 width=700 style="border-bottom: 2px dotted goldenrod;"  >
						<span class="shop-hot fl"> 女生@重磅推荐</span><b  class="case-more fr"><a href="#">更多more</a></b>
					</td>
				</tr>
				<tr>
					<%	  		for(int i=14;i<18;i++)
			               {
			                  Book3 item = list.get(i);
		           %>   
					<td height=80 width=175 style="padding-top: 10px; padding-bottom: 10px;" >
						<a href="book3.jsp?id=<%=item.getId()%>">
							<img src="../img/ebook/<%=item.getPicture() %>.jpg" />
						</a>
						<p class="book-name">
							<a href="#"><%=item.getBookName() %></a>
						</p>	
						<p class="author">
							<%=item.getAuthor() %>
						</p>
						<p class="book-price">
							<span class="price">￥<%=item.getCurrentPrice() %></span>
							<span class="price-d">￥<%=item.getRealPrice() %></span>
						</p>
					</td>
					<%} %>
				</tr>
				<tr>
					<%	  		for(int i=14;i<18;i++)
			               {
			                  Book3 item = list.get(i);
		           %>   
					<td height=80 width=175 style="padding-top: 10px; padding-bottom: 10px;" >
						<a href="#">
							<img src="../img/ebook/<%=item.getPicture() %>.jpg" />
						</a>
						<p class="book-name">
							<a href="book3.jsp?id=<%=item.getId()%>"><%=item.getBookName() %></a>
						</p>	
						<p class="author">
							<%=item.getAuthor() %>
						</p>
						<p class="book-price">
							<span class="price">￥<%=item.getCurrentPrice() %></span>
							<span class="price-d">￥<%=item.getRealPrice() %></span>
						</p>
					</td>
					<%} %>
				</tr>
			</table>
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
