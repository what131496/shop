package servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dataBase.Connect;

@WebServlet("/validate")
public class validate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public validate() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//List<String> users=Arrays.asList("aa","bb","cc");
		String userName=request.getParameter("username");
		String sql="SELECT * FROM users where username='"+userName+"'";
	    try {
			Connection	con=Connect.getConnection();
			PreparedStatement stmt=con.prepareStatement(sql);
			ResultSet rs=null;
			rs=stmt.executeQuery();
			String result=null;
			if(rs.next()){
				result="<font color='red'>用户名已经存在</font>";
			}else{
				result="<font color='green'>输入正确</font>";
			}
			response.setContentType("text/html");
			response.setCharacterEncoding("utf-8");
			response.getWriter().print(result);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
