<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ page import="entity.Book1"%>
<%@ page import="dao.Book1Dao"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
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
    <h3><b></b>添加图书信息   </h3>
 </div>
 <div class="updatemain commonw">
   <form action="<%=path %>/BookServlet?method=add" method="post">
     <table width="1050">
        <tr>
           <td>商品号：</td>
           <td><input type="text" readonly="readonly" name="number" ></td>
           <td>商品图片：</td>
           <td><input type="text" name="picture"></td>
           <td>书名：</td>
           <td><input type="text" name="name" ></td>
        </tr>
        <tr>
           <td>作者：</td>
           <td><input type="text" name="author" ></td>
           <td>原价：</td>
           <td><input type="text" name="currentPrice" ></td>
           <td>现价：</td>
           <td><input type="text" name="realPrice" ></td>
        </tr>
        <tr>
           <td>ISBN：</td>
           <td><input type="text" name="ISBN" ></td>
           <td>出版日期：</td>
           <td><input type="text" name="publisDate" ></td>
           <td>页数：</td>
           <td><input type="text" name="pages" ></td>
        
        </tr>
        <tr>
          <td>书籍简介</td>
          <td colspan=2><textarea name="content" cols="55" rows="10"></textarea></td>
          <td width="10">作者简介</td>
          <td colspan=3><textarea name="authorin" cols="40" rows="10"></textarea></td>
        </tr>
        <tr >
            <td>库存量：</td>
           <td><input type="text" name="reset" ></td>
           <td colspan=4><input type="submit" value="确定提交"/></td>
        </tr>
     </table>
   </form>
 </div>
</body>
</html>