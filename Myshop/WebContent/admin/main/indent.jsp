<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
String path= request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
    <%@ page import="entity.Indent" %>
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
			<div class="adtitle">订单信息</div>
			<div class="heigh">
			   <form action="<%=path %>/IndentServlet?method=heigh" method="post">
			      <b>订单号：</b> <input type="text"  name="number" placeholder="请输入正确号码">
			      <b>用户名：</b> <input type="text" name="username" placeholder="请输入姓名">
			      <input type="submit" class="heigh-btn" required="required" title="请输入完整信息" value="精确查询"> 
			      <input type="submit" class="heigh-btn" formaction="<%=path %>/IndentServlet?method=blur" title="输入订单号信息中的关键字" value="模糊查询"> 
			   </form>
			</div>
			<table class="datatable" width="990" height="auto" border="1">
				<tr style="background:#339900;color:white;font-size:16px;font-weight:bold">
					<td width="60">订单号</td>
					<td width="60">商品</td>
					<td width="80">数量</td>
					<td>用户名</td>
					<td>地址</td>
					<td>联系方式</td>
					<td width="60">收获者</td>
					<td width="80">发货时间</td>
					<td>是否发货</td>
					<td>是否付款</td>
					<td width="70" colspan=2>操作</td>
				</tr>
				<jsp:useBean id="PageIndent" scope="request" class="page.IndetPage"/>
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
					String s=String.valueOf(PageIndent.getCurPage());
					ArrayList list1=PageIndent.getResult(s).data;
					for(int i=0;i<list1.size();i++){
					  Indent a=(Indent)list1.get(i);
					%>
				<tr>
				    <td><%=a.getId() %></td>
					<td><%=a.getProduct() %></td>
					<td><%=a.getNum() %></td>
					<td><%=a.getUsername() %></td>
					<td><%=a.getAddress() %></td>
					<td><%=a.getPhone() %></td>
					<td><%=a.getReceiver() %></td>
					<td><%=a.getSettime() %></td>
					<td><%=a.getSetstate() %></td>
					<td><%=a.getPaystate() %></td>
					<td width="30"><A href="<%=path %>/IndentServlet?id=<%=a.getId()%>&method=delete" onclick="return confirm('删除操作不能恢复，确定删除吗')">删除</A></td>
					<td width="30"><a href="<%=path %>/admin/main/indentUpdate.jsp?id=<%=a.getId()%>">修改</a></td>
				
				</tr>
				<%}
				 %>
		</table>
		<style>
				   .page{margin:10px 120px; }
				 </style>
			<div class="page">
				 <%if(PageIndent.getMaxPage()!=1){ %>
				<form name="PageForm"  action="<%=path %>/IndentPageServlet" method="post">
				每页
				<%=PageIndent.rowsPerPage%>
				行
				第
				<%=PageIndent.getCurPage()%>
				页
				共
				<%=PageIndent.getMaxPage()%>页
				<%
				  if (PageIndent.getCurPage() == 1) {
				    out.print(" 首页 上一页");
				  }
				  else {
				%>
				<a HREF="javascript:gotoPage(1)">首页</A>
				<a HREF="javascript:gotoPage(<%=PageIndent.getCurPage()-1%>)">上一页</A>
				<%}%>
				<%
				  if (PageIndent.getCurPage() == PageIndent.getMaxPage()) {
				    out.print("下一页 尾页");
				  }
				  else {
				%>
				<a HREF="javascript:gotoPage(<%=PageIndent.getCurPage()+1%>)">下一页</A>
				<a HREF="javascript:gotoPage(<%=PageIndent.getMaxPage()%>)">尾页</A>
				<%}%>
				转到第
				<SELECT name="jumpPage" onchange="Jumping()">
				<%
				  for (int i = 1; i <= PageIndent.getMaxPage(); i++) {
				    if (i == PageIndent.getCurPage()) {
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
