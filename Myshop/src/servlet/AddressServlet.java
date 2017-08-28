package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dataBase.Connect;

import entity.Address;
import dataBase.Connect;

@WebServlet("/AddressServlet")
public class AddressServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AddressServlet() {
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
		Address ad=new Address();
		String name,area,address,aEmail,phone,fixPhone;
		try {
			name=request.getParameter("name");
			area=request.getParameter("area");
			address=request.getParameter("address");
			aEmail=request.getParameter("aEmail");
			phone=request.getParameter("phone");
			fixPhone=request.getParameter("fixPhone");
			Connection con=null;
			PreparedStatement st=null;
			con=Connect.getConnection();
			String username=(String) request.getSession().getAttribute("username");
			String sql="insert into address (name,area,address,phone,fixPhone,aEmail,username) values(?,?,?,?,?,?,?)";
		    st=con.prepareStatement(sql);
		    st.setString(1,name);
		    st.setString(2, area);
		    st.setString(3, address);
		    st.setString(4, phone);
		    st.setString(5, fixPhone);
		    st.setString(6,aEmail);
		    st.setString(7,username);
		    st.executeUpdate();
		    out.println("<script language='javascript'>alert('ÃÓ–¥≥…π¶');</script>"); 
		    out.print("<meta http-equiv=\"refresh\" content=\"0.1; url=front/main/pay.jsp\">");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	    
	}

}
