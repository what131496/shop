package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dataBase.Connect;
import entity.Book1;
import entity.Indent;

@WebServlet("/BookServlet")
public class BookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BookServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("text/html;charset='utf-8'");
		request.setCharacterEncoding("utf-8");  
	    response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		String method=request.getParameter("method");
		if("blur".equals(method)){
			String name=request.getParameter("number");
			Connection con=null;
			PreparedStatement stmt=null;
			ResultSet rs=null;
			ArrayList<Indent> admin=new ArrayList<Indent>();
			try{
				con=Connect.getConnection();
				String sql="select * from indent where num like '"+name+"%'";
				stmt=con.prepareStatement(sql);
				rs=stmt.executeQuery();
				while(rs.next()){
					Indent u=new Indent(); 
					u.setId(rs.getLong("id"));
					u.setProduct(rs.getString("product"));
					u.setAddress(rs.getString("address"));
					u.setNum(rs.getInt("num"));
					u.setPhone(rs.getString("phone"));
					u.setReceiver(rs.getString("reciver"));
					u.setSettime(rs.getString("settime"));
					u.setUsername(rs.getString("username"));
					u.setPaystate(rs.getString("paystate"));
					u.setSetstate(rs.getString("setstate"));
					admin.add(u);
				}
				request.setAttribute("BlurIndent", admin);
				request.getRequestDispatcher("admin/main/blurIndent.jsp").forward(request,response);
			}catch(Exception e){
				e.printStackTrace();
			}
	   }else if("delete".equals(method)){
		Connection con=null;
		PreparedStatement stmt=null;
		String Id=request.getParameter("id");
		try{
			con=Connect.getConnection();
			String sql="delete from book1 where id='"+Id+"'";
			stmt=con.prepareStatement(sql);
			//stmt.setInt(1,Id);
			int count = stmt.executeUpdate();
			System.out.println(count+"行图书数据被删除");
			if(count>0){
				out.println("<script language='javascript'>alert('删除成功');</script>"); 
				response.sendRedirect("admin/main/book.jsp");
			}else{
				out.println("<script language='javascript'>alert('删除失败');</script>"); 
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	  }else if("heigh".equals(method)){
		  String author=request.getParameter("author");
		  String name=request.getParameter("name");
		   Connection con=null;
		   PreparedStatement stmt=null;
		   ResultSet rs=null;
		   ArrayList<Book1> admin=new ArrayList<Book1>();
		   try{
			   con=Connect.getConnection();
			   String sql="select * from book1 where author='"+author+"' or bookName='"+name+"'";
			   stmt=con.prepareStatement(sql);
			   rs=stmt.executeQuery();
			   while(rs.next()){
				   Book1 book=new Book1(); 
					book.setId(rs.getInt("id"));
					book.setPicture(rs.getString("picture"));
					book.setBookName(rs.getString("bookName"));
					book.setAuthor(rs.getString("author"));
					book.setCurrentPrice(rs.getLong("currentPrice"));
					book.setRealPrice(rs.getLong("realPrice"));
					book.setPublisher(rs.getString("publisher"));
					book.setISBN(rs.getString("ISBN"));
					book.setPublishDate(rs.getString("publishDate"));
					book.setPages(rs.getInt("pages"));
					book.setBigPicture(rs.getString("bigPicture"));
					book.setContent(rs.getString("content"));
					book.setAuthorin(rs.getString("author-in"));
					book.setReset(rs.getInt("rest"));
				   admin.add(book);
			   }
			   request.setAttribute("heighBook1", admin);
			   request.getRequestDispatcher("admin/main/heighbook1.jsp").forward(request,response);
		   }catch(Exception e){
			   e.printStackTrace();
		   }
	  }else if("update".equals(method)){
		    Connection con=null;
			PreparedStatement stmt=null;
			String Id=request.getParameter("number");
			String a=request.getParameter("picture");
			String b=request.getParameter("name");
			String c=request.getParameter("author");
			String d=request.getParameter("currentPrice");
			String e=request.getParameter("realPrice");
			String f=request.getParameter("ISBN");
			String g=request.getParameter("publisDate");
			String h=request.getParameter("pages");
			String i=request.getParameter("content");
			String j=request.getParameter("authorin");
			String k=request.getParameter("reset");
			String l=request.getParameter("publisher");
			try{
				con=Connect.getConnection();
				String sql="update book1 set picture='"+a+"', bookName='"+b+"',author='"+c+"', " +
				"currentPrice='"+d+"',realPrice='"+e+"', publisher='"+l+"',ISBN='"+f+"',publishDate='"+g+"'," +
				"pages='"+h+"',content='"+i+"',rest='"+k+"' where id='"+Id+"'";
				stmt=con.prepareStatement(sql);
				//stmt.setInt(1,Id);
				int count = stmt.executeUpdate();
				System.out.println(count+"行商品数据被修改");
				if(count>0){
					out.println("<script language='javascript'>alert('更改成功');</script>"); 
					response.setHeader("refresh", "1;url=admin/main/book.jsp");
				}else{
					out.println("<script language='javascript'>alert('更改失败');</script>"); 
				}
			}catch(Exception ea){
				ea.printStackTrace();
			}
	  }
		
	}

}
