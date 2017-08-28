package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dataBase.Connect;
import entity.Users;
@WebServlet("/RegServlet")
public class RegServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public RegServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 response.setContentType("text/html");  
	     request.setCharacterEncoding("utf-8");  
	     response.setCharacterEncoding("utf-8");  
		PrintWriter out = response.getWriter();
		request.setCharacterEncoding("utf-8");
		Users user=new Users();
		String username,password,email;
		try{
			username=request.getParameter("username");
			password=request.getParameter("password");
			email=request.getParameter("email");
		    Date currentTime = new Date();  
		    String time = new SimpleDateFormat("yyyy年MM月dd日").format(currentTime);
			Connection con=null;
			PreparedStatement stmt=null;
			con=Connect.getConnection();
			String sql="insert into users (username,password,email,regtime) values(?,?,?,?)";
			stmt=con.prepareStatement(sql);
			stmt.setString(1,username);
			stmt.setString(2,password);
			stmt.setString(3,email);
			stmt.setString(4,time);
			stmt.executeUpdate();
		    out.println("<script language='javascript'>alert('注册成功,进入登录');</script>"); 
		    out.print("<meta http-equiv=\"refresh\" content=\"0.1; url=front/main/logon.jsp\">");
		
		}catch(Exception ex){
			ex.printStackTrace();
		}
	}

}
