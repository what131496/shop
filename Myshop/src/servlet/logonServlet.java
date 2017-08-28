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
		session.setAttribute("username", username);  // ��¼�ɹ���username����Ϊsession������username
		session.setMaxInactiveInterval(15*24*60*60);
		try{
			if (rs.next()){ //�����¼���ǿգ�������ƥ����û��������룬��½�ɹ�
			          // �����ں���Ϳ���ͨ�� session.getAttribute("username") ����ȡ�û�����
				 // ͬʱ������������Ϊ�û���¼�����ж�����
				Cookie name = new Cookie("name",URLEncoder.encode(username, "UTF-8")); // ����ת��
				response.addCookie(name);
				name.setMaxAge(10*60*60*24); //���ù���ʱ��Ϊʮ��
				//out.println("<script language='javascript'>alert('��¼�ɹ�');</script>"); 
			    out.print("<meta http-equiv=\"refresh\" content=\"0.1; url=front/main/index.jsp\">");
			}else{
				out.println("<script language='javascript'>alert('�û��������������');</script>"); 
				out.print("<meta http-equiv=\"refresh\" content=\"0.1; url=front/main/logon.html\">");
			}        
		}catch(Exception ed){
			ed.printStackTrace();
		}
	}

}
