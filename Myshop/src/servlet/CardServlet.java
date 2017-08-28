package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dataBase.Connect;
import entity.Users;

@WebServlet("/CardServlet")
public class CardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public CardServlet() {
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
		String username,card,cardnumber,idnumber,phone,pwd;
		try{
			username=request.getParameter("name");
		    card=request.getParameter("card");
			cardnumber=request.getParameter("cardnumber");
			idnumber=request.getParameter("IDnumber");
		    phone=request.getParameter("phone");
			pwd=request.getParameter("pwd");
			Connection con=null;
			PreparedStatement stmt=null;
			con=Connect.getConnection();
			String sql="insert into card (username,card,cardNumber,IDnumber,cardPassword,Cphone) values(?,?,?,?,?,?)";
			stmt=con.prepareStatement(sql);
			stmt.setString(1,username);
			stmt.setString(2,card);
			stmt.setString(3,cardnumber);
			stmt.setString(4,idnumber);
			stmt.setString(5,pwd);
			stmt.setString(6,phone);
			int count=stmt.executeUpdate();
			if(count>0){
			System.out.println(count);
		    out.println("<script language='javascript'>alert('添加 成功');</script>"); 
		    out.print("<meta http-equiv=\"refresh\" content=\"0.1; url=front/main/pay.jsp\">");
			}else{
				out.println("<script language='javascript'>alert('哇塞，不好意思出错了');</script>"); 
			    out.print("<meta http-equiv=\"refresh\" content=\"0.1; url=front/main/pay.jsp\">");
			}
		}catch(Exception ex){
			ex.printStackTrace();
		}
	}

}
