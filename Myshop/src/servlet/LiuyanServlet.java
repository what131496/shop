package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dataBase.Connect;

/**
 * Servlet implementation class LiuyanServlet
 */
@WebServlet("/LiuyanServlet")
public class LiuyanServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LiuyanServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("text/html;charset='utf-8'");
		request.setCharacterEncoding("utf-8");  
	    response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		String method=request.getParameter("method");
		if("add".equals(method)){
	   Connection con=null;
	   PreparedStatement stmt=null;
	   String name=request.getParameter("name");
	   String email=request.getParameter("email");
	   String phone=request.getParameter("phone");
	   String content=request.getParameter("content");
	   Date currentTime = new Date();  
	   String time = new SimpleDateFormat("yyyy年MM月dd日").format(currentTime);
	   
	   try {
		con=Connect.getConnection();
		String sql="insert into message (name,phone,email,content,time) values(?,?,?,?,?)";
		stmt=con.prepareStatement(sql);
		stmt.setString(1, name);
		stmt.setString(2, phone);
		stmt.setString(3, email);
		stmt.setString(4, content);
		stmt.setString(5, time);
		int count = stmt.executeUpdate();
		System.out.println(count+"行留言数据被插入");
		if(count>0){
			out.println("<script language='javascript'>alert('感谢您的留言');</script>"); 
			out.print("<meta http-equiv=\"refresh\" content=\"0.1; url=front/main/contact.jsp\">");
		}else{
			out.println("<script language='javascript'>alert('留言失败');</script>"); 
		}
	  } catch (Exception e) {
		e.printStackTrace();
	  }
	}else if("delete".equals(method)){
		Connection con=null;
		PreparedStatement stmt=null;
		int Id=Integer.valueOf(request.getParameter("id"));
		try{
			con=Connect.getConnection();
			String sql="delete from message where id='"+Id+"'";
			stmt=con.prepareStatement(sql);
			//stmt.setInt(1,Id);
			int count = stmt.executeUpdate();
			System.out.println(count+"行留言数据被删除");
			if(count>0){
				out.println("<script language='javascript'>alert('删除成功');</script>"); 
				response.sendRedirect("admin/main/message.jsp");
			}else{
				out.println("<script language='javascript'>alert('删除失败');</script>"); 
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	  }
		
	}

}
