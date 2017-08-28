package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dataBase.Connect;
@WebServlet("/AdminLogonServlet")
public class AdminLogonServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AdminLogonServlet() {
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
		Connection con=null;
		Statement stmt = null ;
		ResultSet rs = null ;
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		String code=request.getParameter("code");
		String picode=(String)request.getSession().getAttribute("piccode");
		code=code.toUpperCase();
		if(code.equals(picode)){
		try {
			con=Connect.getConnection();
			stmt=con.createStatement();
			String sql="select * from admin where username='"+username+"' and password='"+password+"'";
			rs=stmt.executeQuery(sql);
			if (rs.next()){ //如果记录集非空，表明有匹配的用户名和密码，登陆成功
		//out.println("<script language='javascript'>alert('登录成功');</script>"); 
		    response.sendRedirect("admin/main/index.jsp");
		}else{
			out.println("<script language='javascript'>alert('用户名或者密码错误');</script>"); 
			out.print("<meta http-equiv=\"refresh\" content=\"0.1; url=admin/main/logon.jsp\">");
		}        
			HttpSession session=request.getSession();
			session.setAttribute("shopadminname", username);  // 登录成功后将username设置为session变量的username
			session.setMaxInactiveInterval(15*24*60*60);
		} catch (Exception e) {
			
			e.printStackTrace();
		}
	 }else{
		 out.println("<script language='javascript'>alert('验证码错误呀！');</script>");
		out.print("<meta http-equiv=\"refresh\" content=\"0.1; url=admin/main/logon.jsp\">");
	 }
	}

}
