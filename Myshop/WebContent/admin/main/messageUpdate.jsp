<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ page import="entity.Message"%>
<%@ page import="dao.MessageDao"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
          MessageDao adminDao=new MessageDao();
          Message admin= adminDao.getMessageById(Integer.parseInt(request.getParameter("id")));
          if(admin!=null){
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<link rel="stylesheet" href="../css/reset.css" />
<link rel="stylesheet" href="../css/main.css" />
</head>
<body style="background: url(../img/mbg.jpg);">
	
 <div class="updatetitle commonw">
    <h3><b></b>留言板信息更改   </h3>
 </div>
 <div class="updatemain commonw">
   <form action="../../servlet/AdminServlet?id=<%=admin.getId()%>&method=update" method="post">
     <table>
        <tr>
           <td>姓名：</td>
           <td><input type="text" name="names" value="<%=admin.getName() %>"></td>
        </tr>
        <tr>
           <td>时间：</td>
           <td><input type="text" name="username" value="<%=admin.getTime()%>"></td>
        </tr>
        <tr>
           <td>联系方式：</td>
           <td><input type="text" name="password" value="<%=admin.getPhone()%>"></td>
        </tr>
        <tr>
           <td>邮箱：</td>
           <td><input type="text" name="regtime" value=<%=admin.getEmail() %>></td>
        </tr>
        <tr>
           <td>内容：</td>
           <td><textarea  name="regtime" cols="45" rows="10"><%=admin.getContent()%></textarea></td>
        </tr>
        <tr>
           <td colspan=2><input type="submit" value="确定提交"/></td>
        </tr>
     </table>
     <%} %>
   </form>
 </div>
</body>
</html>