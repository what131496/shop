<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
String path= request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
    <%@ page import="entity.Admin" %>
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
	<body style="background: url(<%=path %>/admin/img/mbg1.jpg);">
		<div class="admin-in">
			<div class="adtitle">管理员信息</div>
			<div class="heigh">
			   <form action="<%=path %>/servlet/AdminServlet?method=heigh" method="post">
			      <b>用户名：</b> <input type="text"  name="username" placeholder="请输入用户名">
			      <b>姓名：</b> <input type="text" name="name" placeholder="请输入姓名">
			      <input type="submit" class="heigh-btn" title="请输入完整信息" value="精确查询"> 
			      <input type="submit" class="heigh-btn" formaction="<%=path %>/servlet/AdminServlet?method=blur" title="输入信息中的关键字" value="模糊查询"> 
			   </form>
			</div>
			<table class="datatable" width="1080" height="auto" border="1">
				<tr style="background:orange;font-size:16px;font-weight:bold">
					<td >姓名</td>
					<td>用户名</td>
					<td>密码</td>
					<td>注册时间</td>
					<td colspan=2>操作</td>
				</tr>
				<%
					List<Admin> list1=(List<Admin>)request.getAttribute("BlurAdmin");
					if (list1.size()>0){
				    for(int i=0;i<list1.size();i++){
					  Admin a=(Admin)list1.get(i);
					%>
				<tr>
					<td><%=a.getName() %></td>
					<td><%=a.getUsername() %></td>
					<td><%=a.getPassword() %></td>
					<td><%=a.getRegtime() %></td>
					<td><A href="<%=path %>/servlet/AdminServlet?id=<%=a.getId()%>&method=delete" onclick="return confirm('删除操作不能恢复，确定删除吗')">删除</A></td>
					<td><a href="<%=path %>/admin/main/adminUpdate.jsp?id=<%=a.getId()%>">修改</a></td>
				</tr>
				<%}
					}else{
						out.print("<script>您查询的数据不存在</script>");
					}
				 %>
		</table>
		</div>
	</body>
</html>
