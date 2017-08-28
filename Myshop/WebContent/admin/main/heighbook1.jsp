<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
String path= request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
    <%@ page import="entity.Book1" %>
    <%@ page import="dao.AdminDao" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<link rel="shortcut icon" href="<%=path %>/admin/img/book.ico" />
		<link rel="stylesheet" href="<%=path %>/admin/css/reset.css" />
		<link rel="stylesheet" href="<%=path %>/admin/css/main.css" />
	</head>
	<style>
	  .datatable tr:hover,.datatable tr.hilite
	    {
	    background-color:#99FF66;
	    
		 }
	</style>
	<script>
	 var rows = document.getElementsByTagName('tr');//取得行
	    for(var i=0 ;i<rows.length; i++)
	    {
	        rows[i].onmouseover = function(){//鼠标移上去,添加一个类'hilite'
	            this.className += 'hilite';
	        };
	        rows[i].onmouseout = function(){//鼠标移开,改变该类的名称
	            this.className = this.className.replace('hilite','');
	        };
	    }
	</script>
	<body style="background: url(<%=path %>/admin/img/mbg.jpg);">
		<div class="admin-in">
			<div class="select">
			    <a href="" class="hover">小说</a>
			    <a href="">网络文学</a>
			    <a href="">教育考试</a>
			    <a href="">童书</a>
			</div>
			<div class="heigh">
			   <form action="<%=path %>/BookServlet?method=heigh" method="post">
			      <b>作者：</b> <input type="text"  name="author" placeholder="请输入正确号码">
			      <b>书名：</b> <input type="text" name="name" placeholder="请输入姓名">
			      <input type="submit" class="heigh-btn" required="required" title="请输入完整信息" value="精确查询"> 
			      <input type="submit" class="heigh-btn" formaction="<%=path %>/IndentServlet?method=blur" title="输入订单号信息中的关键字" value="模糊查询"> 
			   </form>
			</div>
			<table class="datatable" width="1150" height="auto" border="1">
				<tr style="background:#339900;color:white;font-size:16px;font-weight:bold">
					<td width="60">商品号</td>
					<td width="60">商品图片</td>
					<td width="80">书名</td>
					<td>作者</td>
					<td>原价</td>
					<td>现价</td>
					<td width="60">出版社</td>
					<td width="40">ISBN</td>
					<td>出版日期</td>
					<td>页数</td>
					<td width="80">大图</td>
					<td width="280">主要内容</td>
					<td width="280">作者简介</td>
					<td>库存量</td>
					<td width="70" colspan=2>操作</td>
				</tr>
				<%
					List<Book1> list1=(List<Book1>)request.getAttribute("heighBook1");
					if(list1.size()>0){
				    for(int i=0;i<list1.size();i++){
				    	Book1 a=(Book1)list1.get(i);
					%>
				<tr>
				    <td><%=a.getId() %></td>
					<td><%=a.getPicture() %></td>
					<td><%=a.getBookName() %></td>
					<td><%=a.getAuthor() %></td>
					<td><%=a.getCurrentPrice() %></td>
					<td><%=a.getRealPrice() %></td>
					<td><%=a.getPublisher() %></td>
					<td><%=a.getISBN() %></td>
					<td><%=a.getPublishDate() %></td>
					<td><%=a.getPages() %></td>
					<td><%=a.getBigPicture() %></td>
					<td><%=a.getContent() %></td>
					<td><%=a.getAuthorin() %></td>
					<td><%=a.getReset() %></td>
					<td width="30"><A href="<%=path %>/BookServlet?id=<%=a.getId()%>&method=delete" onclick="return confirm('删除操作不能恢复，确定删除吗')">删除</A></td>
					<td width="30"><a href="<%=path %>/admin/main/BookUpdate.jsp?id=<%=a.getId()%>">修改</a></td>
				
				</tr>
				<%}
				    }
				 %>
		</table>
		</div>
	</body>
</html>
