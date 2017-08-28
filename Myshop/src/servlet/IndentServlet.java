package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dataBase.Connect;
import entity.Admin;
import entity.Indent;

@WebServlet("/IndentServlet")
public class IndentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public IndentServlet() {
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
					String sql="select * from indent where id like '"+name+"%'";
					stmt=con.prepareStatement(sql);
					rs=stmt.executeQuery();
					while(rs.next()){
						Indent u=new Indent(); 
						u.setId(rs.getLong("id"));
						u.setProduct(rs.getString("product"));
						u.setAddress(rs.getString("address"));
						u.setNum(rs.getInt("num"));
						u.setPhone(rs.getString("phone"));
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
				String sql="delete from indent where id='"+Id+"'";
				stmt=con.prepareStatement(sql);
				//stmt.setInt(1,Id);
				int count = stmt.executeUpdate();
				System.out.println(count+"行订单数据被删除");
				if(count>0){
					out.println("<script language='javascript'>alert('删除成功');</script>"); 
					response.sendRedirect("admin/main/indent.jsp");
				}else{
					out.println("<script language='javascript'>alert('删除失败');</script>"); 
				}
			}catch(Exception e){
				e.printStackTrace();
			}
		  }else if("update".equals(method)){
			    Connection con=null;
				PreparedStatement stmt=null;
				String Id=request.getParameter("number");
				String product=request.getParameter("product");
				String num=request.getParameter("num");
				String username=request.getParameter("username");
				String address=request.getParameter("address");
				String phone=request.getParameter("phone");
				String settime=request.getParameter("settime");
				String settate=request.getParameter("setstate");
				String paystate=request.getParameter("paystate");
				try{
					con=Connect.getConnection();
					String sql="update indent set product='"+product+"',num='"+num+"', username='"+username+"',address='"+address+"', " +
					"phone='"+phone+"', setstate='"+settate+"',settime='"+settime+"',paystate='"+paystate+"' where id='"+Id+"'";
					stmt=con.prepareStatement(sql);
					//stmt.setInt(1,Id);
					int count = stmt.executeUpdate();
					System.out.println(count+"行订单数据被修改");
					if(count>0){
						out.println("<script language='javascript'>alert('更改成功');</script>"); 
						response.sendRedirect("admin/main/indent.jsp");
					}else{
						out.println("<script language='javascript'>alert('更改失败');</script>"); 
					}
				}catch(Exception e){
					e.printStackTrace();
				}
		  }else if("heigh".equals(method)){
			  String number=request.getParameter("number");
			  String username=request.getParameter("username");
			   Connection con=null;
			   PreparedStatement stmt=null;
			   ResultSet rs=null;
			   ArrayList<Indent> admin=new ArrayList<Indent>();
			   try{
				   con=Connect.getConnection();
				   String sql="select * from indent where id='"+number+"' or username='"+username+"'";
				   stmt=con.prepareStatement(sql);
				   rs=stmt.executeQuery();
				   while(rs.next()){
					   Indent u=new Indent(); 
						u.setId(rs.getLong("id"));
						u.setProduct(rs.getString("product"));
						u.setAddress(rs.getString("address"));
						u.setNum(rs.getInt("num"));
						u.setPhone(rs.getString("phone"));
						u.setSettime(rs.getString("settime"));
						u.setUsername(rs.getString("username"));
						u.setPaystate(rs.getString("paystate"));
						u.setSetstate(rs.getString("setstate"));
					   admin.add(u);
				   }
				   request.setAttribute("heighIndent", admin);
				   request.getRequestDispatcher("admin/main/heighindent.jsp").forward(request,response);
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
		  }else if("add".equals(method)){
			    Connection conn = null;
				PreparedStatement stmt = null;
				String address=request.getParameter("address");
				String phone=request.getParameter("phone");
				String bookname=request.getParameter("bookname");
				String booknum=request.getParameter("booknum");
				String username=(String) request.getSession().getAttribute("username");
				Date currentTime = new Date();  
				String time = new SimpleDateFormat("yyyy年MM月dd日").format(currentTime);
				   
				int rs = 0;
				try {
					conn = Connect.getConnection();
					String sql = "insert into indent (product,num,username,address,phone,settime,paystate)values" +
							"('"+bookname+"','"+booknum+"','"+username+"','"+address+"','"+phone+"','"+time+"','是') ;"; // SQL语句
					stmt = conn.prepareStatement(sql);
					rs = stmt.executeUpdate();
					if (rs>0) {
						System.out.println("插入订单数据库成功");
					} else {
					}

				} catch (Exception ex) {
					ex.printStackTrace();
				} finally {
					// 释放语句对象
					if (stmt != null) {
						try {
							stmt.close();
							stmt = null;
						} catch (Exception ex) {
							ex.printStackTrace();
						}
					}

				}
			  response.sendRedirect("front/main/buy.jsp");
		  }
			
		}

	}
