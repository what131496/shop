<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8" %>
<%@ page import="entity.Book1"%>
<%@ page import="dao.BookNameDao"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%        request.setCharacterEncoding("utf-8");
          BookNameDao itemsDao=new BookNameDao();
          /* String book2=request.getParameter("bookname");
          out.print(book2); */
          Book1 book = itemsDao.getBookByName(request.getParameter("bookname"));
          if(book!=null){
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
		<title><%=book.getBookName() %></title>
	<link rel="shortcut icon" href="../img/book.ico" />
	<script src="../Bootstrap/js/jquery.min.js"></script>
	<script src="../js/book1.js"></script>
	<script src="../js/payfor.js"></script>
	<script src="../js/lhgcore.js"></script>
	<script src="../js/lhgdialog.js"></script>
	<link href="../Bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
	<link href="../css/all.css"  rel="stylesheet" type="text/css"/> 
	<link href="../css/reset.css"  rel="stylesheet" type="text/css" />
	<link href="../css/active_login_box.css" rel="stylesheet" type="text/css" />
	</head>
	<script type="text/javascript">
      function selflog_show(id)
      { 
         var num =  document.getElementById("qty_item_1").value; 
         J.dialog.get({id: 'haoyue_creat',title: '购物成功',width: 600,height:400, link: '<%=path%>/servlet/CartServlet?id='+id+'&num='+num+'&action=add', cover:true});
      }
    </script>
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
			$('.theme-login').click(function(){
				alert("请您先登录");
				/* return false; */
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
						<a href="index.jsp"><img src="../img/logo.png" title="logo" /></a>
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
	<div class="book1 clearfix commonWidth">
		<div class="crub commonWidth">
			<span>您现在所处的位置：</span>
			<a href="index.jsp">全部分类</a>
			<span> > </span>
			<a href="index.jsp">文学小说</a>
			<span> > </span>
			<a href="#">小说集</a>
		</div>
		<!--
        	作者：1359102632@qq.com
        	时间：2017-04-07
        	描述：图书购买区
        -->
        
        <div class="book1-buy">
	       	<div class="pic fl">
	       		<img src="../img/book1/<%=book.getBigPicture() %>" />
	        </div>
        	<div class="b-sumarry fl">
        		<div class="b-name">
        			<%=book.getBookName() %>
        		</div>
        		<div class="b-detail">
        			<ul>
        				<li class="t1">作者：<a href="#"><%=book.getAuthor()%></a></li>
        				<li class="t2">出版社：<a href="#"><%=book.getPublisher() %></a></li>
        				<li class="t3">ISBN：<%=book.getISBN() %></li>
        			</ul>
        			<ul>
        				<li class="t1">出版日期：<%=book.getPublishDate()%></li>
        				<li class="t2">页数：<%=book.getPages() %></li>
        				<li class="t3">定价：<%=book.getRealPrice() %></li>
        			</ul>
        		</div>
        		<div class="b-buy">
        			<div class="b-price clearfix">
        				<h5 class="fl">缺书价格：</h5>
        				<span class="curren-price" id="price_item_1">￥<%=book.getCurrentPrice() %></span>
        				<h5>[6.5折]</h5>
        			</div>
        			<div class="b-common">
        				<h5 class="fl">配送：</h5>
        				<span class="b-send">满36元免运费</span>
        			</div>
        			<div class="b-common">
        			   <h5 class="fl">优惠活动：</h5>
        			   <span class="b-discount">送 2530 积分，每 10 点积分可用于支付 0.01 元。<a href="#">[详细介绍]</a></span>
        			   <div class="b-real">真实库存，24小时发货！</div>
        			</div>
        		</div>
        		<div class="buy-area">
        			<div class="b-select">
        				<h5 class="fl">选择新旧：</h5>
        				<span class="new-old">
        					<a href="#">旧书</a>
        					<a href="#">新书</a>
        					<a href="#">新旧说明</a>
        				</span>
        			</div>
        			<div class="b-num">
        				<h5>购买数量：</h5>
        				<div class="p_number fl">
							<div class="f_l add_chose">
								<a class="reduce" onClick="setAmount.reduce('#qty_item_1')" href="javascript:void(0)">
								-</a>
								<input type="text" name="qty_item_1" value="1" id="qty_item_1" onKeyUp="setAmount.modify('#qty_item_1')" class="text" />
								<a class="add" onClick="setAmount.add('#qty_item_1')" href="javascript:void(0)">
								+</a>
							</div>
							<div class="f_l buy">
								总价：<span class="total-font" id="total_item_1">￥<%=book.getCurrentPrice() %></span>
								<input type="hidden" name="total_price" id="total_price" value="" />
								<span class="jifen">可获得：<b id="total_points">18</b>积分</span>
							</div>
							<span class="fr b-save">库存：<%=book.getReset()%></span>
						</div>
						
        			</div>
        		</div>
        	
        	</div>
        </div>
	</div>
	<div class="b-confirm clearfix commonWidth">
	    <div class="fl b-other">
	      <img src="../img/book1/collect.png" />
	      <b><a href="#">收藏到缺书网</a></b>
	      <img src="../img/book1/tuijian.png"> 
	      <b><a href="#">推荐给好友</a></b>
	      <p class="b-talk">在线交谈：<a href="#"><img src="../img/book1/talk.png"></a></p>
	      <span class="b-share">
	      	分享到：<a href="#"><img src="../img/book1/wexin.png"></a>
	      	<a href="#"><img src="../img/book1/qq.png"></a>
	      	<a href="#"><img src="../img/book1/weibo.png"></a>
	      	<a href="#"><img src="../img/book1/dou.png"></a>
	      </span>
	    </div>
	    <div class="b-btn fl">
	        <!-- 弹出登录窗体 -->
	       <div class="login_box">登录窗体</div>
	    	<a href="javascript:selflog_show(<%=book.getId()%>)"  ><span class="btn1"><img src="../img/book1/shopcar.png" />加入购物车</span></a>
	    	<a href="../../CartServlet?action=show"  class="theme-login"><span>立即购买</span></a>
	    </div>
	</div>
	<div >
	</div>
	<div class="commonWidth b-introduce clearfix">
		<div class="fl b-like">
			<h3>猜你喜欢</h3>
			<a href="#"><img src="../img/book1/like1.png" /></a>
			<a href="#"><img src="../img/book1/like2.png" /></a>
			<a href="#"><img src="../img/book1/like3.png" /></a>
		</div>
		<div class="fr book-introduce" id="book">
			<div id="book-t" class="book-t clearfix">
				<ul>
					<li class="bookhover">图书详情</li>
					<li >图书评价</li>
				</ul>
			</div>
		    <div class="book-detail" id="book-c">
		    	<div class="book-a bo1">
		    		<span class="b-detail">
        			<ul>
        				<li class="t1">作者：<a href="#"><%=book.getAuthor() %></a></li>
        				<li class="t2">出版社：<a href="#"><%=book.getPublisher() %></a></li>
        				<li class="t3">ISBN：<%=book.getISBN() %></li>
        			</ul>
        			<ul>
        				<li class="t1">出版日期：<%=book.getPublishDate() %></li>
        				<li class="t2">页数：<%=book.getPages() %></li>
        				<li class="t3">定价：<%=book.getRealPrice() %></li>
        			</ul>
        		    </span>
        		    <span class="book-in clearfix">
        		    	<h4>图书简介：</h4>
        		    	<p> <%=book.getContent() %></p>
        		    </span>
        		    <span class="book-in author-in">
        		    	<h4>作者简介：</h4>
        		    	<p>  
        		    	<%=book.getAuthorin() %>
        		    	</p>
        		    </span>
        		    <span class="mulu-in book-in">
        		    	<h4>目录：（共十一章）</h4>
        		    	<p>  
        		    	     <ol class="clearfix">
        		    	     	<li>夺命大乌苏</li>
        		    	     	<li>叔叔再见</li>
        		    	     	<li>旁人笑我太疯癫</li>
        		    	     	<li>寻人启事</li>
        		    	     	<li>台北爸爸</li>
        		    	     	<li>新疆姑娘</li>
        		    	     	<li>最后一个义工</li>
        		    	     	<li>夺命大乌苏</li>
        		    	     	<li>美少女壮士</li>
        		    	     	<li>斗茶</li>
        		    	     	<li>最后一个义工</li>
        		    	     	<li>姐姐</li>
        		    	     </ol>
        		    	</p>
        		    </span>
		    	</div>
		    	<div class="book-a bo2" style="display: none;">
		    		<span class="book-critical">
		    			<h4>评论（562条）</h4>
		    			<ul>
		    				<li><img src="../img/book1/usericon.jpg">还可以<span>2017年1月12日</span></li>
		    				<li><img src="../img/book1/usericon.jpg">不错好评<span>2017年1月12日</span></li>
		    				<li><img src="../img/book1/usericon.jpg">不错好评<span>2017年1月12日</span></li>
		    				<li><img src="../img/book1/usericon.jpg">不错好评<span>2017年1月12日</span></li>
		    				<li><img src="../img/book1/usericon.jpg">不错好评<span>2017年1月12日</span></li>
		    				<li><img src="../img/book1/usericon.jpg">不错好评<span>2017年1月12日</span></li>
		    				<li><img src="../img/book1/usericon.jpg">不错好评<span>2017年1月12日</span></li>
		    				<li><img src="../img/book1/usericon.jpg">不错好评<span>2017年1月12日</span></li>
		    			</ul>
		    		</span>
		    	</div>
		    </div>
		    <%}else{
		    	out.print("您查询的书籍不存在");
		    %>
		</div>
	</div>
	<div>
         <iframe align="center" width="100%" height="100%" src="../need/footer.html" frameborder="no" border="0" marginwidth="0" marginheight="0" scrolling="no"></iframe>
	</div>
	<%} %>
	</body>
</html>
