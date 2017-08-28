<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
String path= request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
    <%@ page import="entity.Message" %>
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
	<body style="background: url(<%=path %>/admin/img/mbg.jpg);background-repeat:no-repeat;">
		<div class="admin-in">
			<div class="adtitle">留言板信息</div>
			<div class="heigh">
			   <form action="<%=path %>/servlet/AdminServlet?method=heigh" method="post">
			      <b>用户名：</b> <input type="text"  name="username" placeholder="请输入用户名">
			      <b>联系方式：</b> <input type="text" name="name" placeholder="请输入姓名">
			      <input type="submit" class="heigh-btn" title="请输入完整信息" value="精确查询"> 
			      <input type="submit" class="heigh-btn" formaction="<%=path %>/servlet/AdminServlet?method=blur" title="输入用户名信息中的关键字" value="模糊查询"> 
			   </form>
			</div>
			<table class="datatable" width="1080" height="auto" border="1">
				<tr style="background:orange;font-size:16px;font-weight:bold">
					<td width="60">用户名</td>
					<td width="80">留言时间</td>
					<td>联系方式</td>
					<td>邮箱</td>
					<td>留言内容</td>
					<td width="70" colspan=2>操作</td>
				</tr>
				<jsp:useBean id="PageMessage" scope="request" class="page.MessagePage"/>
					<script language="JavaScript" type="text/JavaScript">
					function Jumping(){
					  document.PageForm.submit();
					  return ;
					}
					function gotoPage(pagenum){
					  document.PageForm.jumpPage.value = pagenum;
					  document.PageForm.submit();
					  return ;
					}
					</script>
				<%
					String s=String.valueOf(PageMessage.getCurPage());
					ArrayList list1=PageMessage.getResult(s).data;
					for(int i=0;i<list1.size();i++){
					  Message a=(Message)list1.get(i);
					%>
				<tr>
					<td><%=a.getName() %></td>
					<td><%=a.getTime() %></td>
					<td><%=a.getPhone() %></td>
					<td><%=a.getEmail() %></td>
					<td><%=a.getContent() %></td>
					<td width="30"><A href="<%=path %>/liuyanServlet?id=<%=a.getId()%>&method=delete" onclick="return confirm('删除操作不能恢复，确定删除吗')">删除</A></td>
					<td width="30"><a href="<%=path %>/admin/main/messageUpdate.jsp?id=<%=a.getId()%>">修改</a></td>
				</tr>
				<%}
				 %>
		</table>
		<style>
				   .page{margin:10px 50px; }
				 </style>
			<div class="page">
				 <%if(PageMessage.getMaxPage()!=1){ %>
				<form name="PageForm"  action="<%=path %>/MessageServlet" method="post">
				每页
				<%=PageMessage.rowsPerPage%>
				行
				第
				<%=PageMessage.getCurPage()%>
				页
				共
				<%=PageMessage.getMaxPage()%>页
				<%
				  if (PageMessage.getCurPage() == 1) {
				    out.print(" 首页 上一页");
				  }
				  else {
				%>
				<a HREF="javascript:gotoPage(1)">首页</A>
				<a HREF="javascript:gotoPage(<%=PageMessage.getCurPage()-1%>)">上一页</A>
				<%}%>
				<%
				  if (PageMessage.getCurPage() == PageMessage.getMaxPage()) {
				    out.print("下一页 尾页");
				  }
				  else {
				%>
				<a HREF="javascript:gotoPage(<%=PageMessage.getCurPage()+1%>)">下一页</A>
				<a HREF="javascript:gotoPage(<%=PageMessage.getMaxPage()%>)">尾页</A>
				<%}%>
				转到第
				<SELECT name="jumpPage" onchange="Jumping()">
				<%
				  for (int i = 1; i <= PageMessage.getMaxPage(); i++) {
				    if (i == PageMessage.getCurPage()) {
				%>
				  <OPTION selected value="<%=i%>"><%=i%> </OPTION>
				<%} else {%>
				  <OPTION value="<%=i%>"><%=i%> </OPTION>
				<%}
				  }%>
				</SELECT>
				页
				</form>
				<%}%>
			 </div>
		</div>
	</body>
</html>
