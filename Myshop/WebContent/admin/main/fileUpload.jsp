<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ page import="entity.Users"%>
<%@ page import="dao.UsersDao"%>
<%@ page isELIgnored="false" %>  
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<link rel="stylesheet" href="<%=path %>/admin/css/reset.css" />
<link rel="stylesheet" href="<%=path %>/admin/css/main.css" />
</head>
<body style="background: url(<%=path %>/admin/img/mbg.jpg);">
	
 <div class="updatetitle commonw">
    <h3>上传文件</h3>
 </div>
 <div class="updatemain commonw">
     <form action="<%=path %>/UploadServlet" method="post" enctype="multipart/form-data">
     <table>
        <tr>
           <td>请选择文件：</td>
           <td><input id="myfile" name="myfile" type="file" /></td>
        </tr>
        <tr>
           <td>用户名：</td>
           <td><input type="text" required="required" name="username"></td>
        </tr>
        <tr>
           <td>联系方式：</td>
           <td><input type="text" required="required" name="phone" ></td>
        </tr>
        <tr>
           <td colspan=2><input type="submit"  value="确定提交"></td>
        </tr>
        <tr>
           <td colspan=2>${result}</td>
        </tr>
     </table>
    </form>
 </div>
</body>
</html>