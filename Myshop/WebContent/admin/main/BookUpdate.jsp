<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ page import="entity.Book1"%>
<%@ page import="dao.Book1Dao"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
		  Book1Dao adminDao=new Book1Dao();
		  Book1 admin= adminDao.getBookById(Integer.parseInt(request.getParameter("id")));
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
    <h3><b></b>图书信息更改   </h3>
 </div>
 <div class="updatemain commonw">
   <form action="<%=path %>/BookServlet?id=<%=admin.getId()%>&method=update" method="post">
     <table width="1050">
        <tr>
           <td>商品号：</td>
           <td><input type="text" readonly="readonly" name="number" value="<%=admin.getId() %>"></td>
           <td>商品图片：</td>
           <td><input type="text" name="picture" value="<%=admin.getPicture() %>"></td>
           <td>书名：</td>
           <td><input type="text" name="name" value="<%=admin.getBookName()%>"></td>
        </tr>
        <tr>
           <td>作者：</td>
           <td><input type="text" name="author" value="<%=admin.getAuthor()%>"></td>
           <td>原价：</td>
           <td><input type="text" name="currentPrice" value="<%=admin.getCurrentPrice()%>"></td>
           <td>现价：</td>
           <td><input type="text" name="realPrice" value=<%=admin.getRealPrice() %>></td>
        </tr>
        <tr>
           <td>ISBN：</td>
           <td><input type="text" name="ISBN" value=<%=admin.getISBN()%>></td>
           <td>出版日期：</td>
           <td><input type="text" name="publisDate" value="<%=admin.getPublishDate()%>"></td>
           <td>页数：</td>
           <td><input type="text" name="pages" value="<%=admin.getPages()%>"></td>
        
        </tr>
        <tr>
          <td>书籍简介</td>
          <td colspan=2><textarea name="content" cols="55" rows="10"><%=admin.getContent() %></textarea></td>
          <td width="10">作者简介</td>
          <td colspan=3><textarea name="authorin" cols="40" rows="10"><%=admin.getAuthorin() %></textarea></td>
        </tr>
        <tr >
            <td>库存量：</td>
           <td><input type="text" name="reset" value="<%=admin.getReset()%>"></td>
           <td colspan=4><input type="submit" value="确定提交"/></td>
        </tr>
     </table>
     <%} %>
   </form>
 </div>
</body>
</html>