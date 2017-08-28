<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% String cp = request.getContextPath();%>
    <%@ page import="entity.Users" %>
    <%@ page import="dao.UsersDao" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<link rel="stylesheet" href="<%=cp %>/admin/css/reset.css" />
		<link rel="stylesheet" href="<%=cp %>/admin/css/main.css" />
	</head>
	<style>
	  .datatable tr:hover,.datatable tr.hilite
	    {
	    background-color:#99FF66;
	    
		 }
		 table tr:nth-child(odd){
background: #ccc;
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
	<body style="background: url(<%=cp %>/admin/img/mbg.jpg);">
		<div class="admin-in">
			<div class="adtitle">已经注册用户的信息</div>
			<div class="heigh">
			   <form action="<%=cp %>/servlet/UsersServlet?method=heigh" method="post">
			      <b>用户名：</b> <input type="text"  name="username"  required="required">
			      <input type="submit" class="heigh-btn" value="精确查询"> 
			   </form>
			</div>
			<table class="datatable" width="1080" height="auto" border="1" >
				<tr style="background:orange;font-size:16px;font-weight:bold">
					<td>用户名</td>
					<td>密码</td>
					<td>邮箱</td>
					<td>注册时间</td>
					<td colspan=2>操作</td>
				</tr>
				
				<%
					List<Users> list1=(List<Users>)request.getAttribute("heighUsers");
					for(int i=0;i<list1.size();i++){
						Users u=(Users)list1.get(i);
					%>
				<tr>
					<td><%=u.getUsername() %></td>
					<td><%=u.getPassword() %></td>
					<td><%=u.getEmail() %></td>
					<td><%=u.getRegtime() %></td>
					<td><A href="<%=cp %>/servlet/UsersServlet?id=<%=u.getId()%>&method=delete" onclick="return confirm('确定删除吗')">删除</A></td>
					<td><a href="<%=cp %>/admin/main/usersUpdate.jsp?id=<%=u.getId()%>">修改</a></td>
				</tr>
				<%}%>
		</table>
		</div>
	</body>
</html>
