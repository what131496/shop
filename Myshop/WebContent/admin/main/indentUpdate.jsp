<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ page import="entity.Indent"%>
<%@ page import="dao.IndentDao"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
          IndentDao adminDao=new IndentDao();
          Indent admin= adminDao.getIndentById(request.getParameter("id"));
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
    <h3><b></b>订单信息更改   </h3>
 </div>
 <div class="updatemain commonw">
   <form action="<%=path %>/IndentServlet?id=<%=admin.getId()%>&method=update" method="post">
     <table>
        <tr>
           <td>订单号：</td>
           <td><input type="text" name="number" value="<%=admin.getId() %>"></td>
        </tr>
        <tr>
           <td>商品：</td>
           <td><input type="text" name="product" value="<%=admin.getProduct() %>"></td>
        </tr>
        <tr>
           <td>商品数量：</td>
           <td><input type="text" name="num" value="<%=admin.getNum() %>"></td>
        </tr>
        <tr>
           <td>用户名：</td>
           <td><input type="text" name="username" value="<%=admin.getUsername()%>"></td>
        </tr>
        <tr>
           <td>地址：</td>
           <td><input type="text" name="address" value="<%=admin.getAddress()%>"></td>
        </tr>
        <tr>
           <td>联系方式：</td>
           <td><input type="text" name="phone" value="<%=admin.getPhone()%>"></td>
        </tr>
        <tr>
           <td>发货时间：</td>
           <td><input type="text" name="settime" value=<%=admin.getSettime()%>></td>
        </tr>
        <tr>
           <td>是否发货：</td>
           <td><input type="text" name="setstate" value="<%=admin.getSetstate()%>"></td>
        </tr>
         <tr>
           <td>是否付款：</td>
           <td><input type="text" name="paystate" value="<%=admin.getPaystate()%>"></td>
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