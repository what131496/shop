package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dataBase.Connect;

@WebServlet("/logonServlet")
public class logonServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public logonServlet() {
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
		String result;
		Connection con=null;
		Statement stmt = null ;
		ResultSet rs = null ;
		String username=request.getParameter("users");
		String password=request.getParameter("pass");
		try {
			con=Connect.getConnection();
			stmt=con.createStatement();
			String sql="select * from users where username='"+username+"' and password='"+password+"'";
			rs=stmt.executeQuery(sql);
			
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		HttpSession session=request.getSession();
		session.setAttribute("username", username);  // 登录成功后将username设置为session变量的username
		session.setMaxInactiveInterval(15*24*60*60);
		try{
			if (rs.next()){ //如果记录集非空，表明有匹配的用户名和密码，登陆成功
			          // 这样在后面就可以通过 session.getAttribute("username") 来获取用户名，
				 // 同时这样还可以作为用户登录与否的判断依据
				Cookie name = new Cookie("name",URLEncoder.encode(username, "UTF-8")); // 中文转码
				response.addCookie(name);
				name.setMaxAge(10*60*60*24); //设置过期时间为十天
				//out.println("<script language='javascript'>alert('登录成功');</script>"); 
			    out.print("<meta http-equiv=\"refresh\" content=\"0.1; url=front/main/index.jsp\">");
			}else{
				out.println("<script language='javascript'>alert('用户名或者密码错误');</script>"); 
				out.print("<meta http-equiv=\"refresh\" content=\"0.1; url=front/main/logon.html\">");
			}        
		}catch(Exception ed){
			ed.printStackTrace();
		}
	}

}
