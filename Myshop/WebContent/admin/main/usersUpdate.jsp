<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ page import="entity.Users"%>
<%@ page import="dao.UsersDao"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
         UsersDao adminDao=new UsersDao();
          Users user= adminDao.getUsersById(Integer.parseInt(request.getParameter("id")));
          if(user!=null){
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
    <h3><b>《<%=user.getUsername() %>》</b>用户的信息更改   <a href="users.jsp">返回不修改</a></h3>
 </div>
 <div class="updatemain commonw">
   <form action="<%=path %>/UsersServlet?id=<%=user.getId()%>&method=update" method="post">
     <table>
        <tr>
           <td>用户名：</td>
           <td><input type="text" name="username" value="<%=user.getUsername() %>"></td>
        </tr>
        <tr>
           <td>密码：</td>
           <td><input type="text" name="password" value="<%=user.getPassword()%>"></td>
        </tr>
        <tr>
           <td>邮箱：</td>
           <td><input type="text" name="email" value="<%=user.getEmail()%>"></td>
        </tr>
        <tr>
           <td>注册时间：</td>
           <td><input type="text" name="regtime" value=<%=user.getRegtime() %>></td>
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