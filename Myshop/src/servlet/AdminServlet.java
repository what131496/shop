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
import entity.Admin;

@WebServlet("/AdminServlet")
public class AdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public AdminServlet() {
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
				String sql="delete from admin where id='"+Id+"'";
				stmt=con.prepareStatement(sql);
				//stmt.setInt(1,Id);
				int count = stmt.executeUpdate();
				System.out.println(count);
				if(count>0){
					out.println("<script language='javascript'>alert('删除成功');</script>"); 
					response.sendRedirect("../admin/main/admin.jsp");
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
				String name=request.getParameter("names");
				String username=request.getParameter("username");
				String password=request.getParameter("password");
				String regtime=request.getParameter("regtime");
				try{
					con=Connect.getConnection();
					String sql="update admin set name='"+name+"',username='"+username+"', password='"+password+"',regtime='"+regtime+"' where id='"+Id+"'";
					stmt=con.prepareStatement(sql);
					//stmt.setInt(1,Id);
					int count = stmt.executeUpdate();
					System.out.println(count);
					if(count>0){
						out.println("<script language='javascript'>alert('更改成功');</script>"); 
						response.sendRedirect("../admin/main/admin.jsp");
					}else{
						out.println("<script language='javascript'>alert('更改失败');</script>"); 
					}
				}catch(Exception e){
					e.printStackTrace();
				}
		  }else if("add".equals(method)){
			  Connection con=null;
				PreparedStatement stmt=null;
				String name=request.getParameter("names");
				String username=request.getParameter("username");
				String password=request.getParameter("password");
				String regtime=request.getParameter("regtime");
				try{
					con=Connect.getConnection();
					String sql="insert into admin (name,username,password,regtime) values(?,?,?,?)";
					stmt=con.prepareStatement(sql);
					stmt.setString(1,name);
					stmt.setString(2,username);
					stmt.setString(3, password);
					stmt.setString(4, regtime);
					int count = stmt.executeUpdate();
					System.out.println(count);
					if(count>0){
						out.println("<script language='javascript'>alert('更改成功');</script>"); 
						response.sendRedirect("../admin/main/admin.jsp");
					}else{
						out.println("<script language='javascript'>alert('更改失败');</script>"); 
					}
				}catch(Exception e){
					e.printStackTrace();
				}
		  }else if("heigh".equals(method)){
			  String name=request.getParameter("name");
			  String username=request.getParameter("username");
			   Connection con=null;
			   PreparedStatement stmt=null;
			   ResultSet rs=null;
			   ArrayList<Admin> admin=new ArrayList<Admin>();
			   try{
				   con=Connect.getConnection();
				   String sql="select * from admin where username='"+username+"' or name='"+name+"'";
				   stmt=con.prepareStatement(sql);
				   rs=stmt.executeQuery();
				   while(rs.next()){
					   Admin ad=new Admin();
					   ad.setId(rs.getInt("id"));
					   ad.setName(rs.getString("name"));
					   ad.setUsername(rs.getString("username"));
					   ad.setPassword(rs.getString("password"));
					   ad.setRegtime(rs.getString("regtime"));
					   admin.add(ad);
				   }
				   request.setAttribute("heighAdmin", admin);
				   request.getRequestDispatcher("../admin/main/heighadmin.jsp").forward(request,response);
			   }catch(Exception e){
				   e.printStackTrace();
			   }
		  }else if("blur".equals(method)){
			  String name=request.getParameter("name");
			  String username=request.getParameter("username");
			   Connection con=null;
			   PreparedStatement stmt=null;
			   ResultSet rs=null;
			   ArrayList<Admin> admin=new ArrayList<Admin>();
			   try{
				   con=Connect.getConnection();
				   String sql="select * from admin where username like '"+username+"%'";
				   stmt=con.prepareStatement(sql);
				   rs=stmt.executeQuery();
				   while(rs.next()){
					   Admin ad=new Admin();
					   ad.setId(rs.getInt("id"));
					   ad.setName(rs.getString("name"));
					   ad.setUsername(rs.getString("username"));
					   ad.setPassword(rs.getString("password"));
					   ad.setRegtime(rs.getString("regtime"));
					   admin.add(ad);
				   }
				   request.setAttribute("BlurAdmin", admin);
				   request.getRequestDispatcher("../admin/main/bluradmin.jsp").forward(request,response);
			   }catch(Exception e){
				   e.printStackTrace();
			   }
		  }
			
	}

}
