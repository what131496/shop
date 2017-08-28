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
import entity.Users;

@WebServlet("/UsersServlet")
public class UsersServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public UsersServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("text/html");
		request.setCharacterEncoding("utf-8");  
	    response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		String method=request.getParameter("method");
			if("delete".equals(method)){
			Connection con=null;
			PreparedStatement stmt=null;
			int Id=Integer.valueOf(request.getParameter("id"));
			try{
				con=Connect.getConnection();
				String sql="delete from users where id='"+Id+"'";
				stmt=con.prepareStatement(sql);
				//stmt.setInt(1,Id);
				int count = stmt.executeUpdate();
				System.out.println(count+"行用户数据被删除");
				if(count>0){
					out.println("<script language='javascript'>alert('删除成功');</script>"); 
					response.sendRedirect("admin/main/users.jsp");
				}else{
					out.println("<script language='javascript'>alert('删除失败');</script>"); 
				}
			}catch(Exception e){
				e.printStackTrace();
			}
		  }else if("update".equals(method)){
			    Connection con=null;
				PreparedStatement stmt=null;
				int Id=Integer.valueOf(request.getParameter("id"));
				String name=request.getParameter("username");
				String password=request.getParameter("password");
				String email=request.getParameter("email");
				String regtime=request.getParameter("regtime");
				try{
					con=Connect.getConnection();
					String sql="update users set username='"+name+"',password='"+password+"', email='"+email+"',regtime='"+regtime+"' where id='"+Id+"'";
					stmt=con.prepareStatement(sql);
					//stmt.setInt(1,Id);
					int count = stmt.executeUpdate();
					System.out.println(count+"行数据被更新");
					if(count>0){
						out.println("<script language='javascript'>alert('更改成功');</script>"); 
						response.sendRedirect("admin/main/users.jsp");
					}else{
						out.println("<script language='javascript'>alert('更改失败');</script>"); 
					}
				}catch(Exception e){
					e.printStackTrace();
				}
		  }else if("add".equals(method)){
			  Connection con=null;
				PreparedStatement stmt=null;
				String username=request.getParameter("username");
				String password=request.getParameter("password");
				String email=request.getParameter("email");
				String regtime=request.getParameter("regtime");
				try{
					con=Connect.getConnection();
					String sql="insert into users (username,password,email,regtime) values(?,?,?,?)";
					stmt=con.prepareStatement(sql);
					stmt.setString(1,username);
					stmt.setString(2,password);
					stmt.setString(3, email);
					stmt.setString(4, regtime);
					int count = stmt.executeUpdate();
					System.out.println(count+"行用户数据被添加");
					if(count>0){
						out.println("<script language='javascript'>alert('更改成功');</script>"); 
						response.sendRedirect("admin/main/users.jsp");
					}else{
						out.println("<script language='javascript'>alert('更改失败');</script>"); 
					}
				}catch(Exception e){
					e.printStackTrace();
				}
		  }else if("heigh".equals(method)){
			  String username=request.getParameter("username");
			   Connection con=null;
			   PreparedStatement stmt=null;
			   ResultSet rs=null;
			   ArrayList<Users> admin=new ArrayList<Users>();
			   try{
				   con=Connect.getConnection();
				   String sql="select * from users where username='"+username+"'";
				   stmt=con.prepareStatement(sql);
				   rs=stmt.executeQuery();
				   while(rs.next()){
					   Users ad=new Users();
					   ad.setId(rs.getInt("id"));
					   ad.setUsername(rs.getString("username"));
					   ad.setPassword(rs.getString("password"));
					   ad.setEmail(rs.getString("email"));
					   ad.setRegtime(rs.getString("regtime"));
					   admin.add(ad);
				   }
				   request.setAttribute("heighUsers", admin);
				   request.getRequestDispatcher("admin/main/heighUsers.jsp").forward(request,response);
			   }catch(Exception e){
				   e.printStackTrace();
			   }
		  }
	}

}
