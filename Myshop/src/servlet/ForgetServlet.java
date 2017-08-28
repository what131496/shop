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
			if (rs.next()){ //�����¼���ǿգ�������ƥ����û��������룬
				 // ͬʱ������������Ϊ�û���¼�����ж�����
				//out.println("<script language='javascript'>alert('��¼�ɹ�');</script>"); 
			    out.print("<meta http-equiv=\"refresh\" content=\"0.1; url=front/main/find.html\">");
			}else{
				out.println("<script language='javascript'>alert('�û����������������д���');</script>"); 
				out.print("<meta http-equiv=\"refresh\" content=\"0.1; url=front/main/forget.html\">");
			}        
		}catch(Exception ed){
			ed.printStackTrace();
		}
	}else{
		out.println("<script language='javascript'>alert('��֤�����ѽ��');</script>");
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
				if (count>0){ //�����¼���ǿգ�������ƥ����û��������룬
					 // ͬʱ������������Ϊ�û���¼�����ж�����
					out.println("<script language='javascript'>alert('�޸ĳɹ�');</script>"); 
				    out.print("<meta http-equiv=\"refresh\" content=\"0.1; url=front/main/logon.jsp\">");
				}else{
					out.println("<script language='javascript'>alert('�޸�ʧ�ܣ������³���');</script>"); 
					out.print("<meta http-equiv=\"refresh\" content=\"0.1; url=front/main/forget.html\">");
				}        
			}catch(Exception ed){
				ed.printStackTrace();
			}
	  }
	}

}
