<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="entity.Book1"%>
<%@ page import="dao.Book1Dao"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>我的商城我做主</title>
	<link rel="shortcut icon" href="../img/book.ico" />
	<script src="../Bootstrap/js/jquery.min.js"></script>
	<script src="../js/index.js"></script>
	<script src="../Bootstrap/js/bootstrap.min.js"></script>
	<link href="../Bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
	<link href="../css/all.css"  rel="stylesheet" type="text/css"/> 
	<link href="../css/reset.css"  rel="stylesheet" type="text/css" />
	</head>
	<!-- <Script>
	$(document).ready(function(){
		if(flag=true){
			$('#welcome').fadeOut(0.01);
			$('#user').fadeIn(0.01);
		}else{
			$('#user').fadeOut(0.01);
			$('#welcome').fadeIn(0.01);
		}
	});
	</Script> -->
	<body>
	<div class="header">
		<div class="topbar">
			<div class="commonWidth">
				<div class="fl top-place">
					兰州
				</div>
				<div class="top-message fr">
					<ul>
						<li><a href="logon.html"  target="_blank" id="welcome">你好，请登录|</a></li>
						<li><a href="register.html" target="_blank">免费注册 |</a></li>
						<li><a href="#">我的订单|</a></li>
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
			<div id="menu2" class="menu fr">
				<ul>
				<li><a href="#">图书</a></li>
				<li><a href="#">童书</a></li>
				<li><a href="#">教育</a></li>
				<li><a href="#">小说</a></li>
				<li><a href="#">言情</a></li>
				<li><a href="#">励志</a></li>
				<li><a href="#">考试</a></li>
			    <li><a href="#">关于我们</a></li>
				<li><a href="#">电子书</a></li>
				<li><a href="#">留言板</a></li>
				</ul>
			</div>
		</div>
	</div>
	<div class="banner-bar commonWidth">
		<div class="banner-nav  fl" id="banner-nav">
			<dl>
	            <dt><span class="main-icon ">[]</span><a href="#"> 教材 </a> /<a href="#"> 小说  </a> / <a  class="alink" href="#"> 最需要  </a><span class="right-icon"> > </span></dt>
                <div class="show1 show-common fl" style="displayblock;">
			   	  <div class="show1-one fl">
			   		<div class="show1-title">
			   			<span class="show1-title-image"></span><h3 class="fl">教材</h3>
						<h3 class="fr"><a href="#"> 更多</a></h3>  
			   		</div>
			   		<div class="show-text">
						   <ul>
						   	<li><a href="#">语文</a></li>
						   	<li><a href="#">数学</a></li>
						   	<li><a href="#">英语</a></li>
						   	<li><a href="#">历史</a></li>
						   	<li><a href="#">地理</a></li>
						   	<li><a href="#">生物</a></li>
						   	<li><a href="#">信息技术导论</a></li>
						   	<li><a href="#">计算机网络</a></li>
						   	<li><a href="#">数据库</a></li>
						   	<li><a href="#">Java基础</a></li>
						   </ul>
					</div>
				    </div>	
					<div class="show1-one fl">
				   		<div class="show1-title fl">
				   			<span class="show1-title-image"></span><h3 class="fl">小说</h3>
							<h3 class="fr"><a href="#"> 更多</a></h3>  
				   	    </div>
				   		<div class="show-text">
							   <ul>
							   	<li><a href="#">夏至未至</a></li>
							   	<li><a href="#">无极</a></li>
							   	<li><a href="#">梦幻的明天</a></li>
							   	<li><a href="#">美好的我们</a></li>
							   	<li><a href="#">未来的</a></li>
							   	<li><a href="#">幸福不知</a></li>
							   	<li><a href="#">爱情自由天意</a></li>
							   	<li><a href="#">狐狸的下雨天</a></li>
							   	<li><a href="#">花千骨</a></li>
							   </ul>
						</div>
				    </div>
				    <div class="show-message fl">
				    	<a href="#"><img src="../img/index/show1.png" alt="展示广告"></a>
				    </div>
				<div class="show1-like fr">
					<div class="like-title">
						<h1>猜你需要</h1>
					</div> 
				</div>
		      </div>
			</dl>
            <dl>
	            <dt><span class="main-icon ">[]</span><a href="#"> 童话</a> /<a href="#"> 寓言  </a> / <a  class="alink" href="#"> 你知道  </a><span class="right-icon"> > </span></dt>
                <div class="show2 show-common">
			    	<div class="show1-one fl">
			   		<div class="show1-title fl">
			   			<span class="show1-title-image"></span><h3 class="fl">童话</h3>
						<h3 class="fr"><a href="#"> 更多</a></h3>  
			   		 </div>
			   		 <div class="show-text">
						   <ul>
						   	<li><a href="#">语文</a></li>
						   	<li><a href="#">语文</a></li>
						   	<li><a href="#">语文</a></li>
						   	<li><a href="#">语文</a></li>
						   	<li><a href="#">语文</a></li>
						   	<li><a href="#">语文</a></li>
						   	<li><a href="#">语文</a></li>
						   	<li><a href="#">语文</a></li>
						   	<li><a href="#">语文</a></li>
						   	<li><a href="#">语文</a></li>
						   	<li><a href="#">语文</a></li>
						   	<li><a href="#">语文</a></li>
						   	<li><a href="#">语文</a></li>
						   	<li><a href="#">语文</a></li>				
						   </ul>
					   </div>
					</div>	
					<div class="show1-one fl">
				   		<div class="show1-title fl">
				   			<span class="show1-title-image"></span><h3 class="fl">寓言</h3>
							<h3 class="fr"><a href="#"> 更多</a></h3>  
				   		</div>
				   		<div class="show-text">
						   <ul>
						   	<li><a href="#">语文</a></li>
						   	<li><a href="#">语文</a></li>
						   	<li><a href="#">语文</a></li>
						   	<li><a href="#">语文</a></li>
						   	<li><a href="#">语文</a></li>
						   	<li><a href="#">语文</a></li>
						   	<li><a href="#">语文</a></li>
						   	<li><a href="#">语文</a></li>
						   	<li><a href="#">语文</a></li>
						   	<li><a href="#">语文</a></li>
						   	<li><a href="#">语文</a></li>
						   	<li><a href="#">语文</a></li>
						   	<li><a href="#">语文</a></li>
						   	<li><a href="#">语文</a></li>				
						   </ul>
					   </div>
					</div>
					 <div class="show-message fl">
				    	<a href="#"><img src="../img/index/show1.png" alt="展示广告"></a>
				    </div>
					<div class="show1-like fr">
						<div class="like-title">
							<h1>猜你需要</h1>
						</div> 
					</div>
	          </div>
            </dl>
            <dl>
	            <dt><span class="main-icon ">[]</span><a href="#"> 考研 </a> /<a href="#"> 公务员  </a> / <a  class="alink" href="#"> 可以  </a><span class="right-icon"> > </span></dt>
                  <div class="show3 show-common">
				   	<div class="show1-one fl">
				   		<div class="show1-title fl">
				   			<span class="show1-title-image"></span><h3 class="fl">考研</h3>
							<h3 class="fr"><a href="#"> 更多</a></h3>  
				   		</div>
				   		<div class="show-text">
						   <ul>
						   	<li><a href="#">本地</a></li>
						   	<li><a href="#">外地</a></li>
						   	<li><a href="#">省内</a></li>
						   	<li><a href="#">省外</a></li>
						   	<li><a href="#">语文</a></li>
						   	<li><a href="#">语文</a></li>
						   	<li><a href="#">语文</a></li>
						   	<li><a href="#">语文</a></li>
						   	<li><a href="#">语文</a></li>
						   	<li><a href="#">语文</a></li>
						   	<li><a href="#">语文</a></li>
						   	<li><a href="#">语文</a></li>
						   	<li><a href="#">语文</a></li>
						   	<li><a href="#">语文</a></li>				
						   </ul>
					    </div>
					</div>	
						<div class="show1-one fl">
					   		<div class="show1-title fl">
					   			<span class="show1-title-image"></span><h3 class="fl">公务员</h3>
								<h3 class="fr"><a href="#"> 更多</a></h3>  
					   		</div>
					   		<div class="show-text">
						   <ul>
						   	<li><a href="#">语文</a></li>
						   	<li><a href="#">语文</a></li>
						   	<li><a href="#">语文</a></li>
						   	<li><a href="#">语文</a></li>
						   	<li><a href="#">语文</a></li>
						   	<li><a href="#">语文</a></li>
						   	<li><a href="#">语文</a></li>
						   	<li><a href="#">语文</a></li>
						   	<li><a href="#">语文</a></li>
						   	<li><a href="#">语文</a></li>
						   	<li><a href="#">语文</a></li>
						   	<li><a href="#">语文</a></li>
						   	<li><a href="#">语文</a></li>
						   	<li><a href="#">语文</a></li>				
						   </ul>
							   </div>
					</div>
					<div class="show-message fl">
				    	<a href="#"><img src="../img/index/show1.png" alt="展示广告"></a>
				    </div>
					<div class="show1-like fr">
						<div class="like-title">
							<h1>猜你需要</h1>
						</div> 
					</div>
			    </div>
            </dl>
            <dl>
	            <dt><span class="main-icon ">[]</span><a href="#"> 教材 </a> /<a href="#"> 小说  </a> / <a  class="alink" href="#"> 最需要  </a><span class="right-icon"> > </span></dt>
            </dl>
            <dl>
	            <dt><span class="main-icon ">[]</span><a href="#"> 教材 </a> /<a href="#"> 小说  </a> / <a  class="alink" href="#"> 最需要  </a><span class="right-icon"> > </span></dt>
            </dl>
            <dl>
	            <dt><span class="main-icon ">[]</span><a href="#"> 教材 </a> /<a href="#"> 小说  </a> / <a  class="alink" href="#"> 最需要  </a><span class="right-icon"> > </span></dt>
            </dl>
            <dl>
	            <dt><span class="main-icon ">[]</span><a href="#"> 教材 </a> /<a href="#"> 小说  </a> / <a  class="alink" href="#"> 最需要  </a><span class="right-icon"> > </span></dt>
            </dl>
		</div>
		<div class="banner-box fr">
			 <div id="myCarousel" class="carousel slide">
	                        <!-- 轮播（Carousel）指标 -->
					 <ol class="carousel-indicators">
					        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
					        <li data-target="#myCarousel" data-slide-to="1"></li>
					        <li data-target="#myCarousel" data-slide-to="2"></li>
					        <li data-target="#myCarousel" data-slide-to="3"></li>
					 </ol>   
					    <!-- 轮播（Carousel）项目 -->
					    <div class="carousel-inner">
					        <div class="item active">
					            <img src="../img/2.jpg" alt="First slide">
					            <div class="carousel-caption">曾经一味地以为青春会永存</div>
					        </div>
					        <div class="item">
					            <img src="../img/1.jpg" alt="Second slide">
					            <div class="carousel-caption">只是因为那时候的我们年少无知</div>
					        </div>
					        <div class="item">
					            <img src="../img/3.jpg" alt="Third slide">
					            <div class="carousel-caption">最终还是长大了</div>
					        </div>
					         <div class="item">
					            <img src="../img/4.jpg" alt="Four slide">
					            <div class="carousel-caption">迎来了属于我们的年纪</div>
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
		<div class="case-box fl">
			<table width="700">
				<tr>
					<td colspan="5" height=50 width=700 style="border-bottom: 2px dotted goldenrod;"  >
						<span class="shop-hot fl"><img src="../img/index/t1.png"> 新书上架</span><b  class="case-more fr"><a href="#">更多more</a></b>
					</td>
				</tr>
				<tr>
				   <% 
               Book1Dao itemsDao = new Book1Dao(); 
               ArrayList<Book1> list = itemsDao.getAllbook();
               if(list!=null&&list.size()>0)
               {
	               for(int i=0;i<list.size();i++)
	               {
	                  Book1 item = list.get(i);
           %>   
					<td height=80 width=175 style="padding-top: 10px; padding-bottom: 10px;" >
						<a href="#">
							<img src="../img/<%=item.getPicture()%>" />
						</a>
						<p class="book-name">
							<a href="#"><%=item.getBookName()%></a>
						</p>	
						<p class="author">
							<%=item.getAuthor() %>
						</p>
						<p class="book-price">
							<span class="price">￥<%=item.getCurrentPrice() %></span>
							<span class="price-d">￥<%=item.getRealPrice() %></span>
						</p>
					</td>
					<%
                   }
              } 
          %>
				</tr>
				<tr>
					<td height=80 width=175 style="padding-top: 10px;padding-bottom: 10px; border-top:2px dotted goldenrod ;" >
						<a href="#">
							<img src="../img/new-book3.jpg" />
						</a>
						<p class="book-name">
							<a href="#">有匪2：离恨楼</a>
						</p>	
						<p class="author">
							Priest
						</p>
						<p class="book-price">
							<span class="price">￥37.20</span>
							<span class="price-d">￥42.0</span>
						</p>
					</td>
					<td height=80 width=175  style="padding-top: 10px; padding-bottom: 10px; border-top:2px dotted goldenrod ;">
						<a href="#">
							<img src="../img/new-book1.jpg" />
						</a>
						<p class="book-name">
							<a href="#">人心之上：杜月笙</a>
						</p>	
						<p class="author">
							雾满拦江
						</p>
						<p class="book-price">
							<span class="price">￥35.20</span>
							<span class="price-d">￥41.5</span>
						</p>
					</td>
					<td height=80 width=175 style="padding-top: 10px; padding-bottom: 10px; border-top:2px dotted goldenrod ;" >
						<a href="#">
							<img src="../img/new-book2.jpg" />
						</a>
						<p class="book-name">
							<a href="#">任正非和华为</a>
						</p>	
						<p class="author">
							雾满明天
						</p>
						<p class="book-price">
							<span class="price">￥42.20</span>
							<span class="price-d">￥46.0</span>
						</p>
					</td>
					<td height=80 width=175 style="padding-top: 10px; padding-bottom: 10px; border-top:2px dotted goldenrod ;" >
						<a href="#">
							<img src="../img/new-book4.jpg" />
						</a>
						<p class="book-name">
							<a href="#">中国缺少什么？</a>
						</p>	
						<p class="author">
							永远的未来
						</p>
						<p class="book-price">
							<span class="price">￥52.20</span>
							<span class="price-d">￥60.0</span>
						</p>
					</td>
				</tr>
			</table>
		</div>
	    <div class="fr case-hot">
	     <div class="hot-title">
	    	 新书热卖
	     </div>
         <iframe align="center" width="100%" height="310px" src="../need/gundong.html" frameborder="no" border="0" marginwidth="0" marginheight="0" scrolling="no"></iframe>
	     <div class="shop-bottom">
	     	 <div id="myCarousel" class="carousel slide">
	                        <!-- 轮播（Carousel）指标 -->
					    <!-- 轮播（Carousel）项目 -->
					    <div class="carousel-inner">
					        <div class="item active">
					            <a href="#"><img src="../img/index/2-1.png" alt="First slide"></a>
					        </div>
					        <div class="item">
					           <a href="#"> <img src="../img/index/2-2.png" alt="Second slide"></a>
					        </div>
					        <div class="item">
					            <a href="#"><img src="../img/index/2-3.png" alt="Third slide"></a>
					        </div>
					         <div class="item">
					            <a href="#"><img src="../img/index/2-4.png" alt="Four slide"></a>
					        </div>
					    </div>
					    <!-- 轮播（Carousel）导航 -->
	        </div>
	     </div>
	    </div>
	</div>
	<div class="shop-main commonWidth">
		<div class="clearfix">
		   <div class="shop-tab fl">
		   	  <div class="tab-header">
		   	  	<span class="shop-hot fl"><img src="../img/index/t2.png"> 店长推荐</span><b  class="tab-more fr"><a href="#">更多more</a></b>
		   	  </div>
		   	  <div id="tab-title">
			   	  <ul class="tab-title">
			   	  	<li class="lihover"><span>主打</span></li>
			   	  	<li><span>童书</span></li>
			   	  	<li><span>文艺</span></li>
			   	  	<li><span>小说</span></li>
			   	  	<li><span>青春励志</span></li>
			   	  	<li><span>社科</span></li>
			   	  	<li><span>生活</span></li>
			   	  	<li><span>教育</span></li>
			   	  	<li><span>电子书</span></li>
			   	  </ul>
		   	  </div>
		   	<div class="tab-contents" id="tab-contents">
		   	  <div class="tab1 contents" style="display:none;">
		   	  	<ul>
		   	  		<li class="line1">
		   	  			<a title="新书" href="#"><img src="../img/book1.jpg"></a>
		   	  			<p class="tab-name"><a href="#">我的路8：星辉谷</a></p>
		   	  			<p class="tab-coin">缺书网独家特供</p>
		   	  			<p class="tab-price">
		   	  			   <span class="price">￥35.20</span>
						   <span class="price-d">￥41.5</span>
		   	  			</p>
		   	  		</li>
		   	  		<li class="line2">
		   	  			<a title="新书" href="#"><img src="../img/book2.jpg"></a>
		   	  			<p class="tab-name"><a href="#">宛如昨日：生存游戏</a></p>
		   	  			<p class="tab-coin">缺书网独家特供</p>
		   	  			<p class="tab-price">
		   	  			   <span class="price">￥33.20</span>
						   <span class="price-d">￥41.5</span>
		   	  			</p>
		   	  		</li>
		   	  		<li class="line3">
		   	  			<a title="新书" href="#"><img src="../img/book3.jpg"></a>
		   	  			<p class="tab-name"><a href="#">跟乐嘉学性格色彩</a></p>
		   	  			<p class="tab-coin">缺书网独家特供</p>
		   	  			<p class="tab-price">
		   	  			   <span class="price">￥25.20</span>
						   <span class="price-d">￥29.5</span>
		   	  			</p>
		   	  		</li>
		   	  		<li class="line4">
		   	  			<a title="新书" href="#"><img src="../img/book4.jpg"></a>
		   	  			<p class="tab-name"><a href="#">熟识真味道</a></p>
		   	  			<p class="tab-coin">缺书网独家特供</p>
		   	  			<p class="tab-price">
		   	  			   <span class="price">￥45.20</span>
						   <span class="price-d">￥56.5</span>
		   	  			</p>
		   	  		</li>
		   	  		<li class="line1">
		   	  			<a title="新书" href="#"><img src="../img/book1.jpg"></a>
		   	  			<p class="tab-name"><a href="#">我的路8：星辉谷</a></p>
		   	  			<p class="tab-coin">缺书网独家特供</p>
		   	  			<p class="tab-price">
		   	  			   <span class="price">￥35.20</span>
						   <span class="price-d">￥41.5</span>
		   	  			</p>
		   	  		</li>
		   	  		<li class="line2">
		   	  			<a title="新书" href="#"><img src="../img/book2.jpg"></a>
		   	  			<p class="tab-name"><a href="#">宛如昨日：生存游戏</a></p>
		   	  			<p class="tab-coin">缺书网独家特供</p>
		   	  			<p class="tab-price">
		   	  			   <span class="price">￥33.20</span>
						   <span class="price-d">￥41.5</span>
		   	  			</p>
		   	  		</li>
		   	  		<li class="line3">
		   	  			<a title="新书" href="#"><img src="../img/book3.jpg"></a>
		   	  			<p class="tab-name"><a href="#">跟乐嘉学性格色彩</a></p>
		   	  			<p class="tab-coin">缺书网独家特供</p>
		   	  			<p class="tab-price">
		   	  			   <span class="price">￥25.20</span>
						   <span class="price-d">￥29.5</span>
		   	  			</p>
		   	  		</li>
		   	  		<li class="line4">
		   	  			<a title="新书" href="#"><img src="../img/book4.jpg"></a>
		   	  			<p class="tab-name"><a href="#">熟识真味道</a></p>
		   	  			<p class="tab-coin">缺书网独家特供</p>
		   	  			<p class="tab-price">
		   	  			   <span class="price">￥45.20</span>
						   <span class="price-d">￥56.5</span>
		   	  			</p>
		   	  		</li>
		   	  	</ul>
		   	  </div>
		      <div class="tab2 contents" style="display: block;">
		   	  	<ul>
		   	  		<li class="line1">
		   	  			<a title="新书" href="#"><img src="../img/2-1.jpg"></a>
		   	  			<p class="tab-name"><a href="#">十万个为什么！</a></p>
		   	  			<p class="tab-coin">缺书网独家特供</p>
		   	  			<p class="tab-price">
		   	  			   <span class="price">￥29.80</span>
						   <span class="price-d">￥31.5</span>
		   	  			</p>
		   	  		</li>
		   	  		<li class="line2">
		   	  			<a title="新书" href="#"><img src="../img/2-2.jpg"></a>
		   	  			<p class="tab-name"><a href="#">不要随便发脾气</a></p>
		   	  			<p class="tab-coin">缺书网独家特供</p>
		   	  			<p class="tab-price">
		   	  			   <span class="price">￥49.20</span>
						   <span class="price-d">￥56.5</span>
		   	  			</p>
		   	  		</li>
		   	  		<li class="line3">
		   	  			<a title="新书" href="#"><img src="../img/2-3.jpg"></a>
		   	  			<p class="tab-name"><a href="#">和老爸一起动手爱发明</a></p>
		   	  			<p class="tab-coin">缺书网独家特供</p>
		   	  			<p class="tab-price">
		   	  			   <span class="price">￥19.90</span>
						   <span class="price-d">￥29.5</span>
		   	  			</p>
		   	  		</li>
		   	  		<li class="line4">
		   	  			<a title="新书" href="#"><img src="../img/2-4.jpg"></a>
		   	  			<p class="tab-name"><a href="#">丁丁在刚果</a></p>
		   	  			<p class="tab-coin">缺书网独家特供</p>
		   	  			<p class="tab-price">
		   	  			   <span class="price">￥45.20</span>
						   <span class="price-d">￥56.5</span>
		   	  			</p>
		   	  		</li>
		   	  		<li class="line1">
		   	  			<a title="新书" href="#"><img src="../img/2-1.jpg"></a>
		   	  			<p class="tab-name"><a href="#">十万个为什么！</a></p>
		   	  			<p class="tab-coin">缺书网独家特供</p>
		   	  			<p class="tab-price">
		   	  			   <span class="price">￥29.80</span>
						   <span class="price-d">￥31.5</span>
		   	  			</p>
		   	  		</li>
		   	  		<li class="line2">
		   	  			<a title="新书" href="#"><img src="../img/2-2.jpg"></a>
		   	  			<p class="tab-name"><a href="#">不要随便发脾气</a></p>
		   	  			<p class="tab-coin">缺书网独家特供</p>
		   	  			<p class="tab-price">
		   	  			   <span class="price">￥49.20</span>
						   <span class="price-d">￥56.5</span>
		   	  			</p>
		   	  		</li>
		   	  		<li class="line3">
		   	  			<a title="新书" href="#"><img src="../img/2-3.jpg"></a>
		   	  			<p class="tab-name"><a href="#">和老爸一起动手爱发明</a></p>
		   	  			<p class="tab-coin">缺书网独家特供</p>
		   	  			<p class="tab-price">
		   	  			   <span class="price">￥19.90</span>
						   <span class="price-d">￥29.5</span>
		   	  			</p>
		   	  		</li>
		   	  		<li class="line4">
		   	  			<a title="新书" href="#"><img src="../img/2-4.jpg"></a>
		   	  			<p class="tab-name"><a href="#">丁丁在刚果</a></p>
		   	  			<p class="tab-coin">缺书网独家特供</p>
		   	  			<p class="tab-price">
		   	  			   <span class="price">￥45.20</span>
						   <span class="price-d">￥56.5</span>
		   	  			</p>
		   	  		</li>
		   	  	</ul>
		   	  </div>
		      <div class="tab3 contents" style="display: none;">
		   	  	<ul>
		   	  		<li class="line1">
		   	  			<a title="新书" href="#"><img src="../img/3-1.jpg"></a>
		   	  			<p class="tab-name"><a href="#">单反摄影宝典：你需要</a></p>
		   	  			<p class="tab-coin">缺书网独家特供</p>
		   	  			<p class="tab-price">
		   	  			   <span class="price">￥36</span>
						   <span class="price-d">￥41.5</span>
		   	  			</p>
		   	  		</li>
		   	  		<li class="line2">
		   	  			<a title="新书" href="#"><img src="../img/3-2.jpg"></a>
		   	  			<p class="tab-name"><a href="#">这是一首感情的诗歌</a></p>
		   	  			<p class="tab-coin">缺书网独家特供</p>
		   	  			<p class="tab-price">
		   	  			   <span class="price">￥22.2</span>
						   <span class="price-d">￥32.5</span>
		   	  			</p>
		   	  		</li>
		   	  		<li class="line3">
		   	  			<a title="新书" href="#"><img src="../img/3-3.jpg"></a>
		   	  			<p class="tab-name"><a href="#">丰子恺：无宠不经过</a></p>
		   	  			<p class="tab-coin">缺书网独家特供</p>
		   	  			<p class="tab-price">
		   	  			   <span class="price">￥25.20</span>
						   <span class="price-d">￥29.5</span>
		   	  			</p>
		   	  		</li>
		   	  		<li class="line4">
		   	  			<a title="新书" href="#"><img src="../img/3-4.jpg"></a>
		   	  			<p class="tab-name"><a href="#">让你读完最美古诗词</a></p>
		   	  			<p class="tab-coin">缺书网独家特供</p>
		   	  			<p class="tab-price">
		   	  			   <span class="price">￥36.6</span>
						   <span class="price-d">￥42</span>
		   	  			</p>
		   	  		</li>
		   	  		<li class="line1">
		   	  			<a title="新书" href="#"><img src="../img/3-1.jpg"></a>
		   	  			<p class="tab-name"><a href="#">单反摄影宝典：你需要</a></p>
		   	  			<p class="tab-coin">缺书网独家特供</p>
		   	  			<p class="tab-price">
		   	  			   <span class="price">￥36</span>
						   <span class="price-d">￥41.5</span>
		   	  			</p>
		   	  		</li>
		   	  		<li class="line2">
		   	  			<a title="新书" href="#"><img src="../img/3-2.jpg"></a>
		   	  			<p class="tab-name"><a href="#">这是一首感情的诗歌</a></p>
		   	  			<p class="tab-coin">缺书网独家特供</p>
		   	  			<p class="tab-price">
		   	  			   <span class="price">￥22.2</span>
						   <span class="price-d">￥32.5</span>
		   	  			</p>
		   	  		</li>
		   	  		<li class="line3">
		   	  			<a title="新书" href="#"><img src="../img/3-3.jpg"></a>
		   	  			<p class="tab-name"><a href="#">丰子恺：无宠不经过</a></p>
		   	  			<p class="tab-coin">缺书网独家特供</p>
		   	  			<p class="tab-price">
		   	  			   <span class="price">￥25.20</span>
						   <span class="price-d">￥29.5</span>
		   	  			</p>
		   	  		</li>
		   	  		<li class="line4">
		   	  			<a title="新书" href="#"><img src="../img/3-4.jpg"></a>
		   	  			<p class="tab-name"><a href="#">让你读完最美古诗词</a></p>
		   	  			<p class="tab-coin">缺书网独家特供</p>
		   	  			<p class="tab-price">
		   	  			   <span class="price">￥36.6</span>
						   <span class="price-d">￥42</span>
		   	  			</p>
		   	  		</li>
		   	  	</ul>
		   	  </div>
	          <div class="tab4 contents" style="display: none;">
		   	  	<ul>
		   	  		<li class="line1">
		   	  			<a title="新书" href="#"><img src="../img/4-1.jpg"></a>
		   	  			<p class="tab-name"><a href="#">长恨歌密码</a></p>
		   	  			<p class="tab-coin">缺书网独家特供</p>
		   	  			<p class="tab-price">
		   	  			   <span class="price">￥32</span>
						   <span class="price-d">￥39.5</span>
		   	  			</p>
		   	  		</li>
		   	  		<li class="line2">
		   	  			<a title="新书" href="#"><img src="../img/4-2.jpg"></a>
		   	  			<p class="tab-name"><a href="#">十里度人：你好</a></p>
		   	  			<p class="tab-coin">缺书网独家特供</p>
		   	  			<p class="tab-price">
		   	  			   <span class="price">￥31.2</span>
						   <span class="price-d">￥32.5</span>
		   	  			</p>
		   	  		</li>
		   	  		<li class="line3">
		   	  			<a title="新书" href="#"><img src="../img/4-3.jpg"></a>
		   	  			<p class="tab-name"><a href="#">渡边宠：临终遗作</a></p>
		   	  			<p class="tab-coin">缺书网独家特供</p>
		   	  			<p class="tab-price">
		   	  			   <span class="price">￥28.20</span>
						   <span class="price-d">￥29.5</span>
		   	  			</p>
		   	  		</li>
		   	  		<li class="line4">
		   	  			<a title="新书" href="#"><img src="../img/4-4.jpg"></a>
		   	  			<p class="tab-name"><a href="#">若真有情，愿你懂得</a></p>
		   	  			<p class="tab-coin">缺书网独家特供</p>
		   	  			<p class="tab-price">
		   	  			   <span class="price">￥38.3</span>
						   <span class="price-d">￥42</span>
		   	  			</p>
		   	  		</li>
		   	  		<li class="line1">
		   	  			<a title="新书" href="#"><img src="../img/3-1.jpg"></a>
		   	  			<p class="tab-name"><a href="#">单反摄影宝典：你需要</a></p>
		   	  			<p class="tab-coin">缺书网独家特供</p>
		   	  			<p class="tab-price">
		   	  			   <span class="price">￥36</span>
						   <span class="price-d">￥41.5</span>
		   	  			</p>
		   	  		</li>
		   	  		<li class="line2">
		   	  			<a title="新书" href="#"><img src="../img/3-2.jpg"></a>
		   	  			<p class="tab-name"><a href="#">这是一首感情的诗歌</a></p>
		   	  			<p class="tab-coin">缺书网独家特供</p>
		   	  			<p class="tab-price">
		   	  			   <span class="price">￥22.2</span>
						   <span class="price-d">￥32.5</span>
		   	  			</p>
		   	  		</li>
		   	  		<li class="line3">
		   	  			<a title="新书" href="#"><img src="../img/3-3.jpg"></a>
		   	  			<p class="tab-name"><a href="#">丰子恺：无宠不经过</a></p>
		   	  			<p class="tab-coin">缺书网独家特供</p>
		   	  			<p class="tab-price">
		   	  			   <span class="price">￥25.20</span>
						   <span class="price-d">￥29.5</span>
		   	  			</p>
		   	  		</li>
		   	  		<li class="line4">
		   	  			<a title="新书" href="#"><img src="../img/3-4.jpg"></a>
		   	  			<p class="tab-name"><a href="#">让你读完最美古诗词</a></p>
		   	  			<p class="tab-coin">缺书网独家特供</p>
		   	  			<p class="tab-price">
		   	  			   <span class="price">￥36.6</span>
						   <span class="price-d">￥42</span>
		   	  			</p>
		   	  		</li>
		   	  	</ul>
		   	  </div>
	          <div class="tab5 contents" style="display: none;">
		   	  	<ul>
		   	  		<li class="line1">
		   	  			<a title="新书" href="#"><img src="../img/3-1.jpg"></a>
		   	  			<p class="tab-name"><a href="#">单反摄影宝典：你需要</a></p>
		   	  			<p class="tab-coin">缺书网独家特供</p>
		   	  			<p class="tab-price">
		   	  			   <span class="price">￥36</span>
						   <span class="price-d">￥41.5</span>
		   	  			</p>
		   	  		</li>
		   	  		<li class="line2">
		   	  			<a title="新书" href="#"><img src="../img/3-2.jpg"></a>
		   	  			<p class="tab-name"><a href="#">这是一首感情的诗歌</a></p>
		   	  			<p class="tab-coin">缺书网独家特供</p>
		   	  			<p class="tab-price">
		   	  			   <span class="price">￥22.2</span>
						   <span class="price-d">￥32.5</span>
		   	  			</p>
		   	  		</li>
		   	  		<li class="line3">
		   	  			<a title="新书" href="#"><img src="../img/3-3.jpg"></a>
		   	  			<p class="tab-name"><a href="#">丰子恺：无宠不经过</a></p>
		   	  			<p class="tab-coin">缺书网独家特供</p>
		   	  			<p class="tab-price">
		   	  			   <span class="price">￥25.20</span>
						   <span class="price-d">￥29.5</span>
		   	  			</p>
		   	  		</li>
		   	  		<li class="line4">
		   	  			<a title="新书" href="#"><img src="../img/3-4.jpg"></a>
		   	  			<p class="tab-name"><a href="#">让你读完最美古诗词</a></p>
		   	  			<p class="tab-coin">缺书网独家特供</p>
		   	  			<p class="tab-price">
		   	  			   <span class="price">￥36.6</span>
						   <span class="price-d">￥42</span>
		   	  			</p>
		   	  		</li>
		   	  		<li class="line1">
		   	  			<a title="新书" href="#"><img src="../img/3-1.jpg"></a>
		   	  			<p class="tab-name"><a href="#">单反摄影宝典：你需要</a></p>
		   	  			<p class="tab-coin">缺书网独家特供</p>
		   	  			<p class="tab-price">
		   	  			   <span class="price">￥36</span>
						   <span class="price-d">￥41.5</span>
		   	  			</p>
		   	  		</li>
		   	  		<li class="line2">
		   	  			<a title="新书" href="#"><img src="../img/3-2.jpg"></a>
		   	  			<p class="tab-name"><a href="#">这是一首感情的诗歌</a></p>
		   	  			<p class="tab-coin">缺书网独家特供</p>
		   	  			<p class="tab-price">
		   	  			   <span class="price">￥22.2</span>
						   <span class="price-d">￥32.5</span>
		   	  			</p>
		   	  		</li>
		   	  		<li class="line3">
		   	  			<a title="新书" href="#"><img src="../img/3-3.jpg"></a>
		   	  			<p class="tab-name"><a href="#">丰子恺：无宠不经过</a></p>
		   	  			<p class="tab-coin">缺书网独家特供</p>
		   	  			<p class="tab-price">
		   	  			   <span class="price">￥25.20</span>
						   <span class="price-d">￥29.5</span>
		   	  			</p>
		   	  		</li>
		   	  		<li class="line4">
		   	  			<a title="新书" href="#"><img src="../img/3-4.jpg"></a>
		   	  			<p class="tab-name"><a href="#">让你读完最美古诗词</a></p>
		   	  			<p class="tab-coin">缺书网独家特供</p>
		   	  			<p class="tab-price">
		   	  			   <span class="price">￥36.6</span>
						   <span class="price-d">￥42</span>
		   	  			</p>
		   	  		</li>
		   	  	</ul>
		   	  </div>
			  <div class="tab6 contents" style="display: none;">
		   	  	<ul>
		   	  		<li class="line1">
		   	  			<a title="新书" href="#"><img src="../img/3-1.jpg"></a>
		   	  			<p class="tab-name"><a href="#">单反摄影宝典：你需要</a></p>
		   	  			<p class="tab-coin">缺书网独家特供</p>
		   	  			<p class="tab-price">
		   	  			   <span class="price">￥36</span>
						   <span class="price-d">￥41.5</span>
		   	  			</p>
		   	  		</li>
		   	  		<li class="line2">
		   	  			<a title="新书" href="#"><img src="../img/3-2.jpg"></a>
		   	  			<p class="tab-name"><a href="#">这是一首感情的诗歌</a></p>
		   	  			<p class="tab-coin">缺书网独家特供</p>
		   	  			<p class="tab-price">
		   	  			   <span class="price">￥22.2</span>
						   <span class="price-d">￥32.5</span>
		   	  			</p>
		   	  		</li>
		   	  		<li class="line3">
		   	  			<a title="新书" href="#"><img src="../img/3-3.jpg"></a>
		   	  			<p class="tab-name"><a href="#">丰子恺：无宠不经过</a></p>
		   	  			<p class="tab-coin">缺书网独家特供</p>
		   	  			<p class="tab-price">
		   	  			   <span class="price">￥25.20</span>
						   <span class="price-d">￥29.5</span>
		   	  			</p>
		   	  		</li>
		   	  		<li class="line4">
		   	  			<a title="新书" href="#"><img src="../img/3-4.jpg"></a>
		   	  			<p class="tab-name"><a href="#">让你读完最美古诗词</a></p>
		   	  			<p class="tab-coin">缺书网独家特供</p>
		   	  			<p class="tab-price">
		   	  			   <span class="price">￥36.6</span>
						   <span class="price-d">￥42</span>
		   	  			</p>
		   	  		</li>
		   	  		<li class="line1">
		   	  			<a title="新书" href="#"><img src="../img/3-1.jpg"></a>
		   	  			<p class="tab-name"><a href="#">单反摄影宝典：你需要</a></p>
		   	  			<p class="tab-coin">缺书网独家特供</p>
		   	  			<p class="tab-price">
		   	  			   <span class="price">￥36</span>
						   <span class="price-d">￥41.5</span>
		   	  			</p>
		   	  		</li>
		   	  		<li class="line2">
		   	  			<a title="新书" href="#"><img src="../img/3-2.jpg"></a>
		   	  			<p class="tab-name"><a href="#">这是一首感情的诗歌</a></p>
		   	  			<p class="tab-coin">缺书网独家特供</p>
		   	  			<p class="tab-price">
		   	  			   <span class="price">￥22.2</span>
						   <span class="price-d">￥32.5</span>
		   	  			</p>
		   	  		</li>
		   	  		<li class="line3">
		   	  			<a title="新书" href="#"><img src="../img/3-3.jpg"></a>
		   	  			<p class="tab-name"><a href="#">丰子恺：无宠不经过</a></p>
		   	  			<p class="tab-coin">缺书网独家特供</p>
		   	  			<p class="tab-price">
		   	  			   <span class="price">￥25.20</span>
						   <span class="price-d">￥29.5</span>
		   	  			</p>
		   	  		</li>
		   	  		<li class="line4">
		   	  			<a title="新书" href="#"><img src="../img/3-4.jpg"></a>
		   	  			<p class="tab-name"><a href="#">让你读完最美古诗词</a></p>
		   	  			<p class="tab-coin">缺书网独家特供</p>
		   	  			<p class="tab-price">
		   	  			   <span class="price">￥36.6</span>
						   <span class="price-d">￥42</span>
		   	  			</p>
		   	  		</li>
		   	  	</ul>
		   	  </div>
			  <div class="tab7 contents" style="display: none;">
		   	  	<ul>
		   	  		<li class="line1">
		   	  			<a title="新书" href="#"><img src="../img/3-1.jpg"></a>
		   	  			<p class="tab-name"><a href="#">单反摄影宝典：你需要</a></p>
		   	  			<p class="tab-coin">缺书网独家特供</p>
		   	  			<p class="tab-price">
		   	  			   <span class="price">￥36</span>
						   <span class="price-d">￥41.5</span>
		   	  			</p>
		   	  		</li>
		   	  		<li class="line2">
		   	  			<a title="新书" href="#"><img src="../img/3-2.jpg"></a>
		   	  			<p class="tab-name"><a href="#">这是一首感情的诗歌</a></p>
		   	  			<p class="tab-coin">缺书网独家特供</p>
		   	  			<p class="tab-price">
		   	  			   <span class="price">￥22.2</span>
						   <span class="price-d">￥32.5</span>
		   	  			</p>
		   	  		</li>
		   	  		<li class="line3">
		   	  			<a title="新书" href="#"><img src="../img/3-3.jpg"></a>
		   	  			<p class="tab-name"><a href="#">丰子恺：无宠不经过</a></p>
		   	  			<p class="tab-coin">缺书网独家特供</p>
		   	  			<p class="tab-price">
		   	  			   <span class="price">￥25.20</span>
						   <span class="price-d">￥29.5</span>
		   	  			</p>
		   	  		</li>
		   	  		<li class="line4">
		   	  			<a title="新书" href="#"><img src="../img/3-4.jpg"></a>
		   	  			<p class="tab-name"><a href="#">让你读完最美古诗词</a></p>
		   	  			<p class="tab-coin">缺书网独家特供</p>
		   	  			<p class="tab-price">
		   	  			   <span class="price">￥36.6</span>
						   <span class="price-d">￥42</span>
		   	  			</p>
		   	  		</li>
		   	  		<li class="line1">
		   	  			<a title="新书" href="#"><img src="../img/3-1.jpg"></a>
		   	  			<p class="tab-name"><a href="#">单反摄影宝典：你需要</a></p>
		   	  			<p class="tab-coin">缺书网独家特供</p>
		   	  			<p class="tab-price">
		   	  			   <span class="price">￥36</span>
						   <span class="price-d">￥41.5</span>
		   	  			</p>
		   	  		</li>
		   	  		<li class="line2">
		   	  			<a title="新书" href="#"><img src="../img/3-2.jpg"></a>
		   	  			<p class="tab-name"><a href="#">这是一首感情的诗歌</a></p>
		   	  			<p class="tab-coin">缺书网独家特供</p>
		   	  			<p class="tab-price">
		   	  			   <span class="price">￥22.2</span>
						   <span class="price-d">￥32.5</span>
		   	  			</p>
		   	  		</li>
		   	  		<li class="line3">
		   	  			<a title="新书" href="#"><img src="../img/3-3.jpg"></a>
		   	  			<p class="tab-name"><a href="#">丰子恺：无宠不经过</a></p>
		   	  			<p class="tab-coin">缺书网独家特供</p>
		   	  			<p class="tab-price">
		   	  			   <span class="price">￥25.20</span>
						   <span class="price-d">￥29.5</span>
		   	  			</p>
		   	  		</li>
		   	  		<li class="line4">
		   	  			<a title="新书" href="#"><img src="../img/3-4.jpg"></a>
		   	  			<p class="tab-name"><a href="#">让你读完最美古诗词</a></p>
		   	  			<p class="tab-coin">缺书网独家特供</p>
		   	  			<p class="tab-price">
		   	  			   <span class="price">￥36.6</span>
						   <span class="price-d">￥42</span>
		   	  			</p>
		   	  		</li>
		   	  	</ul>
		   	  </div>
	          <div class="tab8 contents" style="display: none;">
		   	  	<ul>
		   	  		<li class="line1">
		   	  			<a title="新书" href="#"><img src="../img/3-1.jpg"></a>
		   	  			<p class="tab-name"><a href="#">单反摄影宝典：你需要</a></p>
		   	  			<p class="tab-coin">缺书网独家特供</p>
		   	  			<p class="tab-price">
		   	  			   <span class="price">￥36</span>
						   <span class="price-d">￥41.5</span>
		   	  			</p>
		   	  		</li>
		   	  		<li class="line2">
		   	  			<a title="新书" href="#"><img src="../img/3-2.jpg"></a>
		   	  			<p class="tab-name"><a href="#">这是一首感情的诗歌</a></p>
		   	  			<p class="tab-coin">缺书网独家特供</p>
		   	  			<p class="tab-price">
		   	  			   <span class="price">￥22.2</span>
						   <span class="price-d">￥32.5</span>
		   	  			</p>
		   	  		</li>
		   	  		<li class="line3">
		   	  			<a title="新书" href="#"><img src="../img/3-3.jpg"></a>
		   	  			<p class="tab-name"><a href="#">丰子恺：无宠不经过</a></p>
		   	  			<p class="tab-coin">缺书网独家特供</p>
		   	  			<p class="tab-price">
		   	  			   <span class="price">￥25.20</span>
						   <span class="price-d">￥29.5</span>
		   	  			</p>
		   	  		</li>
		   	  		<li class="line4">
		   	  			<a title="新书" href="#"><img src="../img/3-4.jpg"></a>
		   	  			<p class="tab-name"><a href="#">让你读完最美古诗词</a></p>
		   	  			<p class="tab-coin">缺书网独家特供</p>
		   	  			<p class="tab-price">
		   	  			   <span class="price">￥36.6</span>
						   <span class="price-d">￥42</span>
		   	  			</p>
		   	  		</li>
		   	  		<li class="line1">
		   	  			<a title="新书" href="#"><img src="../img/3-1.jpg"></a>
		   	  			<p class="tab-name"><a href="#">单反摄影宝典：你需要</a></p>
		   	  			<p class="tab-coin">缺书网独家特供</p>
		   	  			<p class="tab-price">
		   	  			   <span class="price">￥36</span>
						   <span class="price-d">￥41.5</span>
		   	  			</p>
		   	  		</li>
		   	  		<li class="line2">
		   	  			<a title="新书" href="#"><img src="../img/3-2.jpg"></a>
		   	  			<p class="tab-name"><a href="#">这是一首感情的诗歌</a></p>
		   	  			<p class="tab-coin">缺书网独家特供</p>
		   	  			<p class="tab-price">
		   	  			   <span class="price">￥22.2</span>
						   <span class="price-d">￥32.5</span>
		   	  			</p>
		   	  		</li>
		   	  		<li class="line3">
		   	  			<a title="新书" href="#"><img src="../img/3-3.jpg"></a>
		   	  			<p class="tab-name"><a href="#">丰子恺：无宠不经过</a></p>
		   	  			<p class="tab-coin">缺书网独家特供</p>
		   	  			<p class="tab-price">
		   	  			   <span class="price">￥25.20</span>
						   <span class="price-d">￥29.5</span>
		   	  			</p>
		   	  		</li>
		   	  		<li class="line4">
		   	  			<a title="新书" href="#"><img src="../img/3-4.jpg"></a>
		   	  			<p class="tab-name"><a href="#">让你读完最美古诗词</a></p>
		   	  			<p class="tab-coin">缺书网独家特供</p>
		   	  			<p class="tab-price">
		   	  			   <span class="price">￥36.6</span>
						   <span class="price-d">￥42</span>
		   	  			</p>
		   	  		</li>
		   	  	</ul>
		   	  </div>
	          <div class="tab9 contents" style="display: none;">
		   	  	<ul>
		   	  		<li class="line1">
		   	  			<a title="新书" href="#"><img src="../img/3-1.jpg"></a>
		   	  			<p class="tab-name"><a href="#">单反摄影宝典：你需要</a></p>
		   	  			<p class="tab-coin">缺书网独家特供</p>
		   	  			<p class="tab-price">
		   	  			   <span class="price">￥36</span>
						   <span class="price-d">￥41.5</span>
		   	  			</p>
		   	  		</li>
		   	  		<li class="line2">
		   	  			<a title="新书" href="#"><img src="../img/3-2.jpg"></a>
		   	  			<p class="tab-name"><a href="#">这是一首感情的诗歌</a></p>
		   	  			<p class="tab-coin">缺书网独家特供</p>
		   	  			<p class="tab-price">
		   	  			   <span class="price">￥22.2</span>
						   <span class="price-d">￥32.5</span>
		   	  			</p>
		   	  		</li>
		   	  		<li class="line3">
		   	  			<a title="新书" href="#"><img src="../img/3-3.jpg"></a>
		   	  			<p class="tab-name"><a href="#">丰子恺：无宠不经过</a></p>
		   	  			<p class="tab-coin">缺书网独家特供</p>
		   	  			<p class="tab-price">
		   	  			   <span class="price">￥25.20</span>
						   <span class="price-d">￥29.5</span>
		   	  			</p>
		   	  		</li>
		   	  		<li class="line4">
		   	  			<a title="新书" href="#"><img src="../img/3-4.jpg"></a>
		   	  			<p class="tab-name"><a href="#">让你读完最美古诗词</a></p>
		   	  			<p class="tab-coin">缺书网独家特供</p>
		   	  			<p class="tab-price">
		   	  			   <span class="price">￥36.6</span>
						   <span class="price-d">￥42</span>
		   	  			</p>
		   	  		</li>
		   	  		<li class="line1">
		   	  			<a title="新书" href="#"><img src="../img/3-1.jpg"></a>
		   	  			<p class="tab-name"><a href="#">单反摄影宝典：你需要</a></p>
		   	  			<p class="tab-coin">缺书网独家特供</p>
		   	  			<p class="tab-price">
		   	  			   <span class="price">￥36</span>
						   <span class="price-d">￥41.5</span>
		   	  			</p>
		   	  		</li>
		   	  		<li class="line2">
		   	  			<a title="新书" href="#"><img src="../img/3-2.jpg"></a>
		   	  			<p class="tab-name"><a href="#">这是一首感情的诗歌</a></p>
		   	  			<p class="tab-coin">缺书网独家特供</p>
		   	  			<p class="tab-price">
		   	  			   <span class="price">￥22.2</span>
						   <span class="price-d">￥32.5</span>
		   	  			</p>
		   	  		</li>
		   	  		<li class="line3">
		   	  			<a title="新书" href="#"><img src="../img/3-3.jpg"></a>
		   	  			<p class="tab-name"><a href="#">丰子恺：无宠不经过</a></p>
		   	  			<p class="tab-coin">缺书网独家特供</p>
		   	  			<p class="tab-price">
		   	  			   <span class="price">￥25.20</span>
						   <span class="price-d">￥29.5</span>
		   	  			</p>
		   	  		</li>
		   	  		<li class="line4">
		   	  			<a title="新书" href="#"><img src="../img/3-4.jpg"></a>
		   	  			<p class="tab-name"><a href="#">让你读完最美古诗词</a></p>
		   	  			<p class="tab-coin">缺书网独家特供</p>
		   	  			<p class="tab-price">
		   	  			   <span class="price">￥36.6</span>
						   <span class="price-d">￥42</span>
		   	  			</p>
		   	  		</li>
		   	  	</ul>
		   	  </div>
	
		   	</div>
		   </div>
		   <div class="shop-content fr">
		   	  <div class="hot-title">
		    	 图书畅销榜
		      </div>
		      <div class="hot-tab" id="hot-tab">
		    		<ul>
		    			<li class="tab1 tab-active"><a href="#">总榜</a></li>
		    			<li class="tab2"><a href="#">童书</a></li>
		    			<li class="tab3"><a href="#">教育</a></li>
		    			<li class="tab4"><a href="#">小说</a> </li>
		    			<li class="tab5"><a href="#">保健</a></li>
		    		</ul>
		    	</div>
		    	<div class="case-content clearfix" id="case-content">
		    		<div class="tabs-content tabs1"  style="display: block;">
		    			<ul id="tabs">
		    				<li style="display: none;"><span class="tabs-num">1</span> <a class="tabs-text"> 婴幼儿睡眠全书：教你守护</a></li>
		    				<li> <span class="tabs-num">1</span><a><img src="../img/index/b1.png"></a></li>
		    				<li><span class="tabs-num">1</span> <a  class="tabs-text"> 婴幼儿睡眠全书：教你守护</a></li>
		    				<li><span class="tabs-num">1</span> <a class="tabs-text"> 婴幼儿睡眠全书：教你守护</a></li>
		    				<li><span class="tabs-num">1</span> <a  class="tabs-text"> 婴幼儿睡眠全书：教你守护</a></li>
		    				<li><span class="tabs-num">1</span> <a  class="tabs-text"> 婴幼儿睡眠全书：教你守护</a></li>
		    				<li><span class="tabs-num">1</span> <a  class="tabs-text"> 婴幼儿睡眠全书：教你守护</a></li>
		    				<li><span class="tabs-num">1</span> <a  class="tabs-text"> 婴幼儿睡眠全书：教你守护</a></li>
		    				<li><span class="tabs-num">1</span> <a  class="tabs-text"> 婴幼儿睡眠全书：教你守护</a></li>
		    			    <li><span class="tabs-num">1</span> <a  class="tabs-text"> 婴幼儿睡眠全书：教你守护</a></li>
		    			</ul>
		    			<a href="#" class="look-main">查看完整榜单>></a>
		    		</div>
		    		<div class="tabs-content tabs1" style="display:none;">
		    			<img src="../img/index/hot1.png">
		    		</div>
		    		<div class="tabs-content tabs1" style="display: none;">
		    			<img src="../img/index/hot3.png">
		    		</div>
		    		<div class="tabs-content tabs1" style="display: none;">
		    			<img src="../img/index/hot4.png">
		    		</div>
		    		<div class="tabs-content tabs1" style="display: none;">
		    			<img src="../img/index/hot5.png">
		    		</div>
		    	</div>
		   </div>
		   <div class="shop-tab fl">
		   	  <div class="tab-header">
		   	  	<span class="shop-hot fl"><img src="../img/index/t3.png"> 最近很火</span><b  class="tab-more fr"><a href="#">更多more</a></b>
		   	  </div>
		   	  <div id="tab-title1">
			   	  <ul class="tab-title">
			   	  	<li class="lihover"><span>主打</span></li>
			   	  	<li><span>童书</span></li>
			   	  	<li><span>文艺</span></li>
			   	  	<li><span>小说</span></li>
			   	  	<li><span>青春励志</span></li>
			   	  	<li><span>社科</span></li>
			   	  	<li><span>生活</span></li>
			   	  	<li><span>教育</span></li>
			   	  	<li><span>电子书</span></li>
			   	  </ul>
		   	  </div>
		   	<div class="tab-contents" id="tab-contents1">
		   	  <div class="tab1 contents" style="display:none;">
		   	  	<ul>
		   	  		<li class="line1">
		   	  			<a title="新书" href="#"><img src="../img/book1.jpg"></a>
		   	  			<p class="tab-name"><a href="#">我的路8：星辉谷</a></p>
		   	  			<p class="tab-coin">缺书网独家特供</p>
		   	  			<p class="tab-price">
		   	  			   <span class="price">￥35.20</span>
						   <span class="price-d">￥41.5</span>
		   	  			</p>
		   	  		</li>
		   	  		<li class="line2">
		   	  			<a title="新书" href="#"><img src="../img/book2.jpg"></a>
		   	  			<p class="tab-name"><a href="#">宛如昨日：生存游戏</a></p>
		   	  			<p class="tab-coin">缺书网独家特供</p>
		   	  			<p class="tab-price">
		   	  			   <span class="price">￥33.20</span>
						   <span class="price-d">￥41.5</span>
		   	  			</p>
		   	  		</li>
		   	  		<li class="line3">
		   	  			<a title="新书" href="#"><img src="../img/book3.jpg"></a>
		   	  			<p class="tab-name"><a href="#">跟乐嘉学性格色彩</a></p>
		   	  			<p class="tab-coin">缺书网独家特供</p>
		   	  			<p class="tab-price">
		   	  			   <span class="price">￥25.20</span>
						   <span class="price-d">￥29.5</span>
		   	  			</p>
		   	  		</li>
		   	  		<li class="line4">
		   	  			<a title="新书" href="#"><img src="../img/book4.jpg"></a>
		   	  			<p class="tab-name"><a href="#">熟识真味道</a></p>
		   	  			<p class="tab-coin">缺书网独家特供</p>
		   	  			<p class="tab-price">
		   	  			   <span class="price">￥45.20</span>
						   <span class="price-d">￥56.5</span>
		   	  			</p>
		   	  		</li>
		   	  		<li class="line1">
		   	  			<a title="新书" href="#"><img src="../img/book1.jpg"></a>
		   	  			<p class="tab-name"><a href="#">我的路8：星辉谷</a></p>
		   	  			<p class="tab-coin">缺书网独家特供</p>
		   	  			<p class="tab-price">
		   	  			   <span class="price">￥35.20</span>
						   <span class="price-d">￥41.5</span>
		   	  			</p>
		   	  		</li>
		   	  		<li class="line2">
		   	  			<a title="新书" href="#"><img src="../img/book2.jpg"></a>
		   	  			<p class="tab-name"><a href="#">宛如昨日：生存游戏</a></p>
		   	  			<p class="tab-coin">缺书网独家特供</p>
		   	  			<p class="tab-price">
		   	  			   <span class="price">￥33.20</span>
						   <span class="price-d">￥41.5</span>
		   	  			</p>
		   	  		</li>
		   	  		<li class="line3">
		   	  			<a title="新书" href="#"><img src="../img/book3.jpg"></a>
		   	  			<p class="tab-name"><a href="#">跟乐嘉学性格色彩</a></p>
		   	  			<p class="tab-coin">缺书网独家特供</p>
		   	  			<p class="tab-price">
		   	  			   <span class="price">￥25.20</span>
						   <span class="price-d">￥29.5</span>
		   	  			</p>
		   	  		</li>
		   	  		<li class="line4">
		   	  			<a title="新书" href="#"><img src="../img/book4.jpg"></a>
		   	  			<p class="tab-name"><a href="#">熟识真味道</a></p>
		   	  			<p class="tab-coin">缺书网独家特供</p>
		   	  			<p class="tab-price">
		   	  			   <span class="price">￥45.20</span>
						   <span class="price-d">￥56.5</span>
		   	  			</p>
		   	  		</li>
		   	  	</ul>
		   	  </div>
		      <div class="tab2 contents" style="display: block;">
		   	  	<ul>
		   	  		<li class="line1">
		   	  			<a title="新书" href="#"><img src="../img/2-1.jpg"></a>
		   	  			<p class="tab-name"><a href="#">十万个为什么！</a></p>
		   	  			<p class="tab-coin">缺书网独家特供</p>
		   	  			<p class="tab-price">
		   	  			   <span class="price">￥29.80</span>
						   <span class="price-d">￥31.5</span>
		   	  			</p>
		   	  		</li>
		   	  		<li class="line2">
		   	  			<a title="新书" href="#"><img src="../img/2-2.jpg"></a>
		   	  			<p class="tab-name"><a href="#">不要随便发脾气</a></p>
		   	  			<p class="tab-coin">缺书网独家特供</p>
		   	  			<p class="tab-price">
		   	  			   <span class="price">￥49.20</span>
						   <span class="price-d">￥56.5</span>
		   	  			</p>
		   	  		</li>
		   	  		<li class="line3">
		   	  			<a title="新书" href="#"><img src="../img/2-3.jpg"></a>
		   	  			<p class="tab-name"><a href="#">和老爸一起动手爱发明</a></p>
		   	  			<p class="tab-coin">缺书网独家特供</p>
		   	  			<p class="tab-price">
		   	  			   <span class="price">￥19.90</span>
						   <span class="price-d">￥29.5</span>
		   	  			</p>
		   	  		</li>
		   	  		<li class="line4">
		   	  			<a title="新书" href="#"><img src="../img/2-4.jpg"></a>
		   	  			<p class="tab-name"><a href="#">丁丁在刚果</a></p>
		   	  			<p class="tab-coin">缺书网独家特供</p>
		   	  			<p class="tab-price">
		   	  			   <span class="price">￥45.20</span>
						   <span class="price-d">￥56.5</span>
		   	  			</p>
		   	  		</li>
		   	  		<li class="line1">
		   	  			<a title="新书" href="#"><img src="../img/2-1.jpg"></a>
		   	  			<p class="tab-name"><a href="#">十万个为什么！</a></p>
		   	  			<p class="tab-coin">缺书网独家特供</p>
		   	  			<p class="tab-price">
		   	  			   <span class="price">￥29.80</span>
						   <span class="price-d">￥31.5</span>
		   	  			</p>
		   	  		</li>
		   	  		<li class="line2">
		   	  			<a title="新书" href="#"><img src="../img/2-2.jpg"></a>
		   	  			<p class="tab-name"><a href="#">不要随便发脾气</a></p>
		   	  			<p class="tab-coin">缺书网独家特供</p>
		   	  			<p class="tab-price">
		   	  			   <span class="price">￥49.20</span>
						   <span class="price-d">￥56.5</span>
		   	  			</p>
		   	  		</li>
		   	  		<li class="line3">
		   	  			<a title="新书" href="#"><img src="../img/2-3.jpg"></a>
		   	  			<p class="tab-name"><a href="#">和老爸一起动手爱发明</a></p>
		   	  			<p class="tab-coin">缺书网独家特供</p>
		   	  			<p class="tab-price">
		   	  			   <span class="price">￥19.90</span>
						   <span class="price-d">￥29.5</span>
		   	  			</p>
		   	  		</li>
		   	  		<li class="line4">
		   	  			<a title="新书" href="#"><img src="../img/2-4.jpg"></a>
		   	  			<p class="tab-name"><a href="#">丁丁在刚果</a></p>
		   	  			<p class="tab-coin">缺书网独家特供</p>
		   	  			<p class="tab-price">
		   	  			   <span class="price">￥45.20</span>
						   <span class="price-d">￥56.5</span>
		   	  			</p>
		   	  		</li>
		   	  	</ul>
		   	  </div>
		      <div class="tab3 contents" style="display: none;">
		   	  	<ul>
		   	  		<li class="line1">
		   	  			<a title="新书" href="#"><img src="../img/3-1.jpg"></a>
		   	  			<p class="tab-name"><a href="#">单反摄影宝典：你需要</a></p>
		   	  			<p class="tab-coin">缺书网独家特供</p>
		   	  			<p class="tab-price">
		   	  			   <span class="price">￥36</span>
						   <span class="price-d">￥41.5</span>
		   	  			</p>
		   	  		</li>
		   	  		<li class="line2">
		   	  			<a title="新书" href="#"><img src="../img/3-2.jpg"></a>
		   	  			<p class="tab-name"><a href="#">这是一首感情的诗歌</a></p>
		   	  			<p class="tab-coin">缺书网独家特供</p>
		   	  			<p class="tab-price">
		   	  			   <span class="price">￥22.2</span>
						   <span class="price-d">￥32.5</span>
		   	  			</p>
		   	  		</li>
		   	  		<li class="line3">
		   	  			<a title="新书" href="#"><img src="../img/3-3.jpg"></a>
		   	  			<p class="tab-name"><a href="#">丰子恺：无宠不经过</a></p>
		   	  			<p class="tab-coin">缺书网独家特供</p>
		   	  			<p class="tab-price">
		   	  			   <span class="price">￥25.20</span>
						   <span class="price-d">￥29.5</span>
		   	  			</p>
		   	  		</li>
		   	  		<li class="line4">
		   	  			<a title="新书" href="#"><img src="../img/3-4.jpg"></a>
		   	  			<p class="tab-name"><a href="#">让你读完最美古诗词</a></p>
		   	  			<p class="tab-coin">缺书网独家特供</p>
		   	  			<p class="tab-price">
		   	  			   <span class="price">￥36.6</span>
						   <span class="price-d">￥42</span>
		   	  			</p>
		   	  		</li>
		   	  		<li class="line1">
		   	  			<a title="新书" href="#"><img src="../img/3-1.jpg"></a>
		   	  			<p class="tab-name"><a href="#">单反摄影宝典：你需要</a></p>
		   	  			<p class="tab-coin">缺书网独家特供</p>
		   	  			<p class="tab-price">
		   	  			   <span class="price">￥36</span>
						   <span class="price-d">￥41.5</span>
		   	  			</p>
		   	  		</li>
		   	  		<li class="line2">
		   	  			<a title="新书" href="#"><img src="../img/3-2.jpg"></a>
		   	  			<p class="tab-name"><a href="#">这是一首感情的诗歌</a></p>
		   	  			<p class="tab-coin">缺书网独家特供</p>
		   	  			<p class="tab-price">
		   	  			   <span class="price">￥22.2</span>
						   <span class="price-d">￥32.5</span>
		   	  			</p>
		   	  		</li>
		   	  		<li class="line3">
		   	  			<a title="新书" href="#"><img src="../img/3-3.jpg"></a>
		   	  			<p class="tab-name"><a href="#">丰子恺：无宠不经过</a></p>
		   	  			<p class="tab-coin">缺书网独家特供</p>
		   	  			<p class="tab-price">
		   	  			   <span class="price">￥25.20</span>
						   <span class="price-d">￥29.5</span>
		   	  			</p>
		   	  		</li>
		   	  		<li class="line4">
		   	  			<a title="新书" href="#"><img src="../img/3-4.jpg"></a>
		   	  			<p class="tab-name"><a href="#">让你读完最美古诗词</a></p>
		   	  			<p class="tab-coin">缺书网独家特供</p>
		   	  			<p class="tab-price">
		   	  			   <span class="price">￥36.6</span>
						   <span class="price-d">￥42</span>
		   	  			</p>
		   	  		</li>
		   	  	</ul>
		   	  </div>
	          <div class="tab4 contents" style="display: none;">
		   	  	<ul>
		   	  		<li class="line1">
		   	  			<a title="新书" href="#"><img src="../img/4-1.jpg"></a>
		   	  			<p class="tab-name"><a href="#">长恨歌密码</a></p>
		   	  			<p class="tab-coin">缺书网独家特供</p>
		   	  			<p class="tab-price">
		   	  			   <span class="price">￥32</span>
						   <span class="price-d">￥39.5</span>
		   	  			</p>
		   	  		</li>
		   	  		<li class="line2">
		   	  			<a title="新书" href="#"><img src="../img/4-2.jpg"></a>
		   	  			<p class="tab-name"><a href="#">十里度人：你好</a></p>
		   	  			<p class="tab-coin">缺书网独家特供</p>
		   	  			<p class="tab-price">
		   	  			   <span class="price">￥31.2</span>
						   <span class="price-d">￥32.5</span>
		   	  			</p>
		   	  		</li>
		   	  		<li class="line3">
		   	  			<a title="新书" href="#"><img src="../img/4-3.jpg"></a>
		   	  			<p class="tab-name"><a href="#">渡边宠：临终遗作</a></p>
		   	  			<p class="tab-coin">缺书网独家特供</p>
		   	  			<p class="tab-price">
		   	  			   <span class="price">￥28.20</span>
						   <span class="price-d">￥29.5</span>
		   	  			</p>
		   	  		</li>
		   	  		<li class="line4">
		   	  			<a title="新书" href="#"><img src="../img/4-4.jpg"></a>
		   	  			<p class="tab-name"><a href="#">若真有情，愿你懂得</a></p>
		   	  			<p class="tab-coin">缺书网独家特供</p>
		   	  			<p class="tab-price">
		   	  			   <span class="price">￥38.3</span>
						   <span class="price-d">￥42</span>
		   	  			</p>
		   	  		</li>
		   	  		<li class="line1">
		   	  			<a title="新书" href="#"><img src="../img/3-1.jpg"></a>
		   	  			<p class="tab-name"><a href="#">单反摄影宝典：你需要</a></p>
		   	  			<p class="tab-coin">缺书网独家特供</p>
		   	  			<p class="tab-price">
		   	  			   <span class="price">￥36</span>
						   <span class="price-d">￥41.5</span>
		   	  			</p>
		   	  		</li>
		   	  		<li class="line2">
		   	  			<a title="新书" href="#"><img src="../img/3-2.jpg"></a>
		   	  			<p class="tab-name"><a href="#">这是一首感情的诗歌</a></p>
		   	  			<p class="tab-coin">缺书网独家特供</p>
		   	  			<p class="tab-price">
		   	  			   <span class="price">￥22.2</span>
						   <span class="price-d">￥32.5</span>
		   	  			</p>
		   	  		</li>
		   	  		<li class="line3">
		   	  			<a title="新书" href="#"><img src="../img/3-3.jpg"></a>
		   	  			<p class="tab-name"><a href="#">丰子恺：无宠不经过</a></p>
		   	  			<p class="tab-coin">缺书网独家特供</p>
		   	  			<p class="tab-price">
		   	  			   <span class="price">￥25.20</span>
						   <span class="price-d">￥29.5</span>
		   	  			</p>
		   	  		</li>
		   	  		<li class="line4">
		   	  			<a title="新书" href="#"><img src="../img/3-4.jpg"></a>
		   	  			<p class="tab-name"><a href="#">让你读完最美古诗词</a></p>
		   	  			<p class="tab-coin">缺书网独家特供</p>
		   	  			<p class="tab-price">
		   	  			   <span class="price">￥36.6</span>
						   <span class="price-d">￥42</span>
		   	  			</p>
		   	  		</li>
		   	  	</ul>
		   	  </div>
	          <div class="tab5 contents" style="display: none;">
		   	  	<ul>
		   	  		<li class="line1">
		   	  			<a title="新书" href="#"><img src="../img/3-1.jpg"></a>
		   	  			<p class="tab-name"><a href="#">单反摄影宝典：你需要</a></p>
		   	  			<p class="tab-coin">缺书网独家特供</p>
		   	  			<p class="tab-price">
		   	  			   <span class="price">￥36</span>
						   <span class="price-d">￥41.5</span>
		   	  			</p>
		   	  		</li>
		   	  		<li class="line2">
		   	  			<a title="新书" href="#"><img src="../img/3-2.jpg"></a>
		   	  			<p class="tab-name"><a href="#">这是一首感情的诗歌</a></p>
		   	  			<p class="tab-coin">缺书网独家特供</p>
		   	  			<p class="tab-price">
		   	  			   <span class="price">￥22.2</span>
						   <span class="price-d">￥32.5</span>
		   	  			</p>
		   	  		</li>
		   	  		<li class="line3">
		   	  			<a title="新书" href="#"><img src="../img/3-3.jpg"></a>
		   	  			<p class="tab-name"><a href="#">丰子恺：无宠不经过</a></p>
		   	  			<p class="tab-coin">缺书网独家特供</p>
		   	  			<p class="tab-price">
		   	  			   <span class="price">￥25.20</span>
						   <span class="price-d">￥29.5</span>
		   	  			</p>
		   	  		</li>
		   	  		<li class="line4">
		   	  			<a title="新书" href="#"><img src="../img/3-4.jpg"></a>
		   	  			<p class="tab-name"><a href="#">让你读完最美古诗词</a></p>
		   	  			<p class="tab-coin">缺书网独家特供</p>
		   	  			<p class="tab-price">
		   	  			   <span class="price">￥36.6</span>
						   <span class="price-d">￥42</span>
		   	  			</p>
		   	  		</li>
		   	  		<li class="line1">
		   	  			<a title="新书" href="#"><img src="../img/3-1.jpg"></a>
		   	  			<p class="tab-name"><a href="#">单反摄影宝典：你需要</a></p>
		   	  			<p class="tab-coin">缺书网独家特供</p>
		   	  			<p class="tab-price">
		   	  			   <span class="price">￥36</span>
						   <span class="price-d">￥41.5</span>
		   	  			</p>
		   	  		</li>
		   	  		<li class="line2">
		   	  			<a title="新书" href="#"><img src="../img/3-2.jpg"></a>
		   	  			<p class="tab-name"><a href="#">这是一首感情的诗歌</a></p>
		   	  			<p class="tab-coin">缺书网独家特供</p>
		   	  			<p class="tab-price">
		   	  			   <span class="price">￥22.2</span>
						   <span class="price-d">￥32.5</span>
		   	  			</p>
		   	  		</li>
		   	  		<li class="line3">
		   	  			<a title="新书" href="#"><img src="../img/3-3.jpg"></a>
		   	  			<p class="tab-name"><a href="#">丰子恺：无宠不经过</a></p>
		   	  			<p class="tab-coin">缺书网独家特供</p>
		   	  			<p class="tab-price">
		   	  			   <span class="price">￥25.20</span>
						   <span class="price-d">￥29.5</span>
		   	  			</p>
		   	  		</li>
		   	  		<li class="line4">
		   	  			<a title="新书" href="#"><img src="../img/3-4.jpg"></a>
		   	  			<p class="tab-name"><a href="#">让你读完最美古诗词</a></p>
		   	  			<p class="tab-coin">缺书网独家特供</p>
		   	  			<p class="tab-price">
		   	  			   <span class="price">￥36.6</span>
						   <span class="price-d">￥42</span>
		   	  			</p>
		   	  		</li>
		   	  	</ul>
		   	  </div>
			  <div class="tab6 contents" style="display: none;">
		   	  	<ul>
		   	  		<li class="line1">
		   	  			<a title="新书" href="#"><img src="../img/3-1.jpg"></a>
		   	  			<p class="tab-name"><a href="#">单反摄影宝典：你需要</a></p>
		   	  			<p class="tab-coin">缺书网独家特供</p>
		   	  			<p class="tab-price">
		   	  			   <span class="price">￥36</span>
						   <span class="price-d">￥41.5</span>
		   	  			</p>
		   	  		</li>
		   	  		<li class="line2">
		   	  			<a title="新书" href="#"><img src="../img/3-2.jpg"></a>
		   	  			<p class="tab-name"><a href="#">这是一首感情的诗歌</a></p>
		   	  			<p class="tab-coin">缺书网独家特供</p>
		   	  			<p class="tab-price">
		   	  			   <span class="price">￥22.2</span>
						   <span class="price-d">￥32.5</span>
		   	  			</p>
		   	  		</li>
		   	  		<li class="line3">
		   	  			<a title="新书" href="#"><img src="../img/3-3.jpg"></a>
		   	  			<p class="tab-name"><a href="#">丰子恺：无宠不经过</a></p>
		   	  			<p class="tab-coin">缺书网独家特供</p>
		   	  			<p class="tab-price">
		   	  			   <span class="price">￥25.20</span>
						   <span class="price-d">￥29.5</span>
		   	  			</p>
		   	  		</li>
		   	  		<li class="line4">
		   	  			<a title="新书" href="#"><img src="../img/3-4.jpg"></a>
		   	  			<p class="tab-name"><a href="#">让你读完最美古诗词</a></p>
		   	  			<p class="tab-coin">缺书网独家特供</p>
		   	  			<p class="tab-price">
		   	  			   <span class="price">￥36.6</span>
						   <span class="price-d">￥42</span>
		   	  			</p>
		   	  		</li>
		   	  		<li class="line1">
		   	  			<a title="新书" href="#"><img src="../img/3-1.jpg"></a>
		   	  			<p class="tab-name"><a href="#">单反摄影宝典：你需要</a></p>
		   	  			<p class="tab-coin">缺书网独家特供</p>
		   	  			<p class="tab-price">
		   	  			   <span class="price">￥36</span>
						   <span class="price-d">￥41.5</span>
		   	  			</p>
		   	  		</li>
		   	  		<li class="line2">
		   	  			<a title="新书" href="#"><img src="../img/3-2.jpg"></a>
		   	  			<p class="tab-name"><a href="#">这是一首感情的诗歌</a></p>
		   	  			<p class="tab-coin">缺书网独家特供</p>
		   	  			<p class="tab-price">
		   	  			   <span class="price">￥22.2</span>
						   <span class="price-d">￥32.5</span>
		   	  			</p>
		   	  		</li>
		   	  		<li class="line3">
		   	  			<a title="新书" href="#"><img src="../img/3-3.jpg"></a>
		   	  			<p class="tab-name"><a href="#">丰子恺：无宠不经过</a></p>
		   	  			<p class="tab-coin">缺书网独家特供</p>
		   	  			<p class="tab-price">
		   	  			   <span class="price">￥25.20</span>
						   <span class="price-d">￥29.5</span>
		   	  			</p>
		   	  		</li>
		   	  		<li class="line4">
		   	  			<a title="新书" href="#"><img src="../img/3-4.jpg"></a>
		   	  			<p class="tab-name"><a href="#">让你读完最美古诗词</a></p>
		   	  			<p class="tab-coin">缺书网独家特供</p>
		   	  			<p class="tab-price">
		   	  			   <span class="price">￥36.6</span>
						   <span class="price-d">￥42</span>
		   	  			</p>
		   	  		</li>
		   	  	</ul>
		   	  </div>
			  <div class="tab7 contents" style="display: none;">
		   	  	<ul>
		   	  		<li class="line1">
		   	  			<a title="新书" href="#"><img src="../img/3-1.jpg"></a>
		   	  			<p class="tab-name"><a href="#">单反摄影宝典：你需要</a></p>
		   	  			<p class="tab-coin">缺书网独家特供</p>
		   	  			<p class="tab-price">
		   	  			   <span class="price">￥36</span>
						   <span class="price-d">￥41.5</span>
		   	  			</p>
		   	  		</li>
		   	  		<li class="line2">
		   	  			<a title="新书" href="#"><img src="../img/3-2.jpg"></a>
		   	  			<p class="tab-name"><a href="#">这是一首感情的诗歌</a></p>
		   	  			<p class="tab-coin">缺书网独家特供</p>
		   	  			<p class="tab-price">
		   	  			   <span class="price">￥22.2</span>
						   <span class="price-d">￥32.5</span>
		   	  			</p>
		   	  		</li>
		   	  		<li class="line3">
		   	  			<a title="新书" href="#"><img src="../img/3-3.jpg"></a>
		   	  			<p class="tab-name"><a href="#">丰子恺：无宠不经过</a></p>
		   	  			<p class="tab-coin">缺书网独家特供</p>
		   	  			<p class="tab-price">
		   	  			   <span class="price">￥25.20</span>
						   <span class="price-d">￥29.5</span>
		   	  			</p>
		   	  		</li>
		   	  		<li class="line4">
		   	  			<a title="新书" href="#"><img src="../img/3-4.jpg"></a>
		   	  			<p class="tab-name"><a href="#">让你读完最美古诗词</a></p>
		   	  			<p class="tab-coin">缺书网独家特供</p>
		   	  			<p class="tab-price">
		   	  			   <span class="price">￥36.6</span>
						   <span class="price-d">￥42</span>
		   	  			</p>
		   	  		</li>
		   	  		<li class="line1">
		   	  			<a title="新书" href="#"><img src="../img/3-1.jpg"></a>
		   	  			<p class="tab-name"><a href="#">单反摄影宝典：你需要</a></p>
		   	  			<p class="tab-coin">缺书网独家特供</p>
		   	  			<p class="tab-price">
		   	  			   <span class="price">￥36</span>
						   <span class="price-d">￥41.5</span>
		   	  			</p>
		   	  		</li>
		   	  		<li class="line2">
		   	  			<a title="新书" href="#"><img src="../img/3-2.jpg"></a>
		   	  			<p class="tab-name"><a href="#">这是一首感情的诗歌</a></p>
		   	  			<p class="tab-coin">缺书网独家特供</p>
		   	  			<p class="tab-price">
		   	  			   <span class="price">￥22.2</span>
						   <span class="price-d">￥32.5</span>
		   	  			</p>
		   	  		</li>
		   	  		<li class="line3">
		   	  			<a title="新书" href="#"><img src="../img/3-3.jpg"></a>
		   	  			<p class="tab-name"><a href="#">丰子恺：无宠不经过</a></p>
		   	  			<p class="tab-coin">缺书网独家特供</p>
		   	  			<p class="tab-price">
		   	  			   <span class="price">￥25.20</span>
						   <span class="price-d">￥29.5</span>
		   	  			</p>
		   	  		</li>
		   	  		<li class="line4">
		   	  			<a title="新书" href="#"><img src="../img/3-4.jpg"></a>
		   	  			<p class="tab-name"><a href="#">让你读完最美古诗词</a></p>
		   	  			<p class="tab-coin">缺书网独家特供</p>
		   	  			<p class="tab-price">
		   	  			   <span class="price">￥36.6</span>
						   <span class="price-d">￥42</span>
		   	  			</p>
		   	  		</li>
		   	  	</ul>
		   	  </div>
	          <div class="tab8 contents" style="display: none;">
		   	  	<ul>
		   	  		<li class="line1">
		   	  			<a title="新书" href="#"><img src="../img/3-1.jpg"></a>
		   	  			<p class="tab-name"><a href="#">单反摄影宝典：你需要</a></p>
		   	  			<p class="tab-coin">缺书网独家特供</p>
		   	  			<p class="tab-price">
		   	  			   <span class="price">￥36</span>
						   <span class="price-d">￥41.5</span>
		   	  			</p>
		   	  		</li>
		   	  		<li class="line2">
		   	  			<a title="新书" href="#"><img src="../img/3-2.jpg"></a>
		   	  			<p class="tab-name"><a href="#">这是一首感情的诗歌</a></p>
		   	  			<p class="tab-coin">缺书网独家特供</p>
		   	  			<p class="tab-price">
		   	  			   <span class="price">￥22.2</span>
						   <span class="price-d">￥32.5</span>
		   	  			</p>
		   	  		</li>
		   	  		<li class="line3">
		   	  			<a title="新书" href="#"><img src="../img/3-3.jpg"></a>
		   	  			<p class="tab-name"><a href="#">丰子恺：无宠不经过</a></p>
		   	  			<p class="tab-coin">缺书网独家特供</p>
		   	  			<p class="tab-price">
		   	  			   <span class="price">￥25.20</span>
						   <span class="price-d">￥29.5</span>
		   	  			</p>
		   	  		</li>
		   	  		<li class="line4">
		   	  			<a title="新书" href="#"><img src="../img/3-4.jpg"></a>
		   	  			<p class="tab-name"><a href="#">让你读完最美古诗词</a></p>
		   	  			<p class="tab-coin">缺书网独家特供</p>
		   	  			<p class="tab-price">
		   	  			   <span class="price">￥36.6</span>
						   <span class="price-d">￥42</span>
		   	  			</p>
		   	  		</li>
		   	  		<li class="line1">
		   	  			<a title="新书" href="#"><img src="../img/3-1.jpg"></a>
		   	  			<p class="tab-name"><a href="#">单反摄影宝典：你需要</a></p>
		   	  			<p class="tab-coin">缺书网独家特供</p>
		   	  			<p class="tab-price">
		   	  			   <span class="price">￥36</span>
						   <span class="price-d">￥41.5</span>
		   	  			</p>
		   	  		</li>
		   	  		<li class="line2">
		   	  			<a title="新书" href="#"><img src="../img/3-2.jpg"></a>
		   	  			<p class="tab-name"><a href="#">这是一首感情的诗歌</a></p>
		   	  			<p class="tab-coin">缺书网独家特供</p>
		   	  			<p class="tab-price">
		   	  			   <span class="price">￥22.2</span>
						   <span class="price-d">￥32.5</span>
		   	  			</p>
		   	  		</li>
		   	  		<li class="line3">
		   	  			<a title="新书" href="#"><img src="../img/3-3.jpg"></a>
		   	  			<p class="tab-name"><a href="#">丰子恺：无宠不经过</a></p>
		   	  			<p class="tab-coin">缺书网独家特供</p>
		   	  			<p class="tab-price">
		   	  			   <span class="price">￥25.20</span>
						   <span class="price-d">￥29.5</span>
		   	  			</p>
		   	  		</li>
		   	  		<li class="line4">
		   	  			<a title="新书" href="#"><img src="../img/3-4.jpg"></a>
		   	  			<p class="tab-name"><a href="#">让你读完最美古诗词</a></p>
		   	  			<p class="tab-coin">缺书网独家特供</p>
		   	  			<p class="tab-price">
		   	  			   <span class="price">￥36.6</span>
						   <span class="price-d">￥42</span>
		   	  			</p>
		   	  		</li>
		   	  	</ul>
		   	  </div>
	          <div class="tab9 contents" style="display: none;">
		   	  	<ul>
		   	  		<li class="line1">
		   	  			<a title="新书" href="#"><img src="../img/3-1.jpg"></a>
		   	  			<p class="tab-name"><a href="#">单反摄影宝典：你需要</a></p>
		   	  			<p class="tab-coin">缺书网独家特供</p>
		   	  			<p class="tab-price">
		   	  			   <span class="price">￥36</span>
						   <span class="price-d">￥41.5</span>
		   	  			</p>
		   	  		</li>
		   	  		<li class="line2">
		   	  			<a title="新书" href="#"><img src="../img/3-2.jpg"></a>
		   	  			<p class="tab-name"><a href="#">这是一首感情的诗歌</a></p>
		   	  			<p class="tab-coin">缺书网独家特供</p>
		   	  			<p class="tab-price">
		   	  			   <span class="price">￥22.2</span>
						   <span class="price-d">￥32.5</span>
		   	  			</p>
		   	  		</li>
		   	  		<li class="line3">
		   	  			<a title="新书" href="#"><img src="../img/3-3.jpg"></a>
		   	  			<p class="tab-name"><a href="#">丰子恺：无宠不经过</a></p>
		   	  			<p class="tab-coin">缺书网独家特供</p>
		   	  			<p class="tab-price">
		   	  			   <span class="price">￥25.20</span>
						   <span class="price-d">￥29.5</span>
		   	  			</p>
		   	  		</li>
		   	  		<li class="line4">
		   	  			<a title="新书" href="#"><img src="../img/3-4.jpg"></a>
		   	  			<p class="tab-name"><a href="#">让你读完最美古诗词</a></p>
		   	  			<p class="tab-coin">缺书网独家特供</p>
		   	  			<p class="tab-price">
		   	  			   <span class="price">￥36.6</span>
						   <span class="price-d">￥42</span>
		   	  			</p>
		   	  		</li>
		   	  		<li class="line1">
		   	  			<a title="新书" href="#"><img src="../img/3-1.jpg"></a>
		   	  			<p class="tab-name"><a href="#">单反摄影宝典：你需要</a></p>
		   	  			<p class="tab-coin">缺书网独家特供</p>
		   	  			<p class="tab-price">
		   	  			   <span class="price">￥36</span>
						   <span class="price-d">￥41.5</span>
		   	  			</p>
		   	  		</li>
		   	  		<li class="line2">
		   	  			<a title="新书" href="#"><img src="../img/3-2.jpg"></a>
		   	  			<p class="tab-name"><a href="#">这是一首感情的诗歌</a></p>
		   	  			<p class="tab-coin">缺书网独家特供</p>
		   	  			<p class="tab-price">
		   	  			   <span class="price">￥22.2</span>
						   <span class="price-d">￥32.5</span>
		   	  			</p>
		   	  		</li>
		   	  		<li class="line3">
		   	  			<a title="新书" href="#"><img src="../img/3-3.jpg"></a>
		   	  			<p class="tab-name"><a href="#">丰子恺：无宠不经过</a></p>
		   	  			<p class="tab-coin">缺书网独家特供</p>
		   	  			<p class="tab-price">
		   	  			   <span class="price">￥25.20</span>
						   <span class="price-d">￥29.5</span>
		   	  			</p>
		   	  		</li>
		   	  		<li class="line4">
		   	  			<a title="新书" href="#"><img src="../img/3-4.jpg"></a>
		   	  			<p class="tab-name"><a href="#">让你读完最美古诗词</a></p>
		   	  			<p class="tab-coin">缺书网独家特供</p>
		   	  			<p class="tab-price">
		   	  			   <span class="price">￥36.6</span>
						   <span class="price-d">￥42</span>
		   	  			</p>
		   	  		</li>
		   	  	</ul>
		   	  </div>
	
		   	</div>
		   </div>
		   <div class="shop-content fr">
		   	  <div class="hot-title">
		    	 图书热卖
		      </div>
		      <div class="hot-tab" id="hot-tab1">
		    		<ul>
		    			<li class="tab1 tab-active"><a href="#">总榜</a></li>
		    			<li class="tab2"><a href="#">童书</a></li>
		    			<li class="tab3"><a href="#">教育</a></li>
		    			<li class="tab4"><a href="#">小说</a> </li>
		    			<li class="tab5"><a href="#">保健</a></li>
		    		</ul>
		    	</div>
		    	<div class="case-content clearfix" id="case-content1">
		    		<div class="tabs-content tabs1"  style="display: block;">
		    			<ul id="tabs">
		    				<li style="display: none;"><span class="tabs-num">1</span> <a class="tabs-text"> 婴幼儿睡眠全书：教你守护</a></li>
		    				<li> <span class="tabs-num">1</span><a><img src="../img/index/b1.png"></a></li>
		    				<li><span class="tabs-num">1</span> <a  class="tabs-text"> 婴幼儿睡眠全书：教你守护</a></li>
		    				<li><span class="tabs-num">1</span> <a class="tabs-text"> 婴幼儿睡眠全书：教你守护</a></li>
		    				<li><span class="tabs-num">1</span> <a  class="tabs-text"> 婴幼儿睡眠全书：教你守护</a></li>
		    				<li><span class="tabs-num">1</span> <a  class="tabs-text"> 婴幼儿睡眠全书：教你守护</a></li>
		    				<li><span class="tabs-num">1</span> <a  class="tabs-text"> 婴幼儿睡眠全书：教你守护</a></li>
		    				<li><span class="tabs-num">1</span> <a  class="tabs-text"> 婴幼儿睡眠全书：教你守护</a></li>
		    				<li><span class="tabs-num">1</span> <a  class="tabs-text"> 婴幼儿睡眠全书：教你守护</a></li>
		    			    <li><span class="tabs-num">1</span> <a  class="tabs-text"> 婴幼儿睡眠全书：教你守护</a></li>
		    			</ul>
		    			<a href="#" class="look-main">查看完整榜单>></a>
		    		</div>
		    		<div class="tabs-content tabs1" style="display:none;">
		    			 <img src="../img/index/hot2.png">
		    		</div>
		    		<div class="tabs-content tabs1" style="display: none;">
		    			<img src="../img/index/hot3.png">
		    		</div>
		    		<div class="tabs-content tabs1" style="display: none;">
		    			<img src="../img/index/hot4.png">
		    		</div>
		    		<div class="tabs-content tabs1" style="display: none;">
		    			<img src="../img/index/hot5.png">
		    		</div>
		    	</div>
		   </div>
		 </div>
	   <div class="footer-a">
	     <iframe align="center" width="100%" height="173px" src="../need/free-left.html" frameborder="no" border="0" marginwidth="0" marginheight="0" scrolling="no"></iframe>
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
