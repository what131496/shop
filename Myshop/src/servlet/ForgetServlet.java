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
import dataBase.Connect;
@WebServlet("/ForgetServlet")
public class ForgetServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ForgetServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	  doPost(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");  
	     request.setCharacterEncoding("utf-8");  
	     response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		String method=request.getParameter("method");
		if("forget".equals(method)){
		Connection con=null;
		Statement stmt = null ;
		ResultSet rs = null ;
		String username=request.getParameter("username");
		String email=request.getParameter("email");
		String code=request.getParameter("code");
		String picode=(String)request.getSession().getAttribute("piccode");
		code=code.toUpperCase();
		if(code.equals(picode)){
		try {
			con=Connect.getConnection();
			stmt=con.createStatement();
			String sql="select * from users where username='"+username+"' and email='"+email+"'";
			rs=stmt.executeQuery(sql);
			
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		try{
			if (rs.next()){ //如果记录集非空，表明有匹配的用户名和密码，
				 // 同时这样还可以作为用户登录与否的判断依据
				//out.println("<script language='javascript'>alert('登录成功');</script>"); 
			    out.print("<meta http-equiv=\"refresh\" content=\"0.1; url=front/main/find.html\">");
			}else{
				out.println("<script language='javascript'>alert('用户名或者邮箱输入有错误');</script>"); 
				out.print("<meta http-equiv=\"refresh\" content=\"0.1; url=front/main/forget.html\">");
			}        
		}catch(Exception ed){
			ed.printStackTrace();
		}
	}else{
		out.println("<script language='javascript'>alert('验证码错误呀！');</script>");
		out.print("<meta http-equiv=\"refresh\" content=\"0.1; url=front/main/forget.html\">");
	}
	}else if("find".equals(method)){
			Connection con=null;
			Statement stmt = null ;
			String pass=request.getParameter("pass");
			String username=request.getParameter("username");
			try {
				con=Connect.getConnection();
				stmt=con.createStatement();
				String sql="update users set password='"+pass+"' where username='"+username+"'";
				int count = stmt.executeUpdate(sql);;
				if (count>0){ //如果记录集非空，表明有匹配的用户名和密码，
					 // 同时这样还可以作为用户登录与否的判断依据
					out.println("<script language='javascript'>alert('修改成功');</script>"); 
				    out.print("<meta http-equiv=\"refresh\" content=\"0.1; url=front/main/logon.jsp\">");
				}else{
					out.println("<script language='javascript'>alert('修改失败，请重新尝试');</script>"); 
					out.print("<meta http-equiv=\"refresh\" content=\"0.1; url=front/main/forget.html\">");
				}        
			}catch(Exception ed){
				ed.printStackTrace();
			}
	  }
	}

}
