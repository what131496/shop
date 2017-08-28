package page;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/UserPageServlet")
public class UserPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UserPageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
			  UserPage page1=new UserPage();
			  UserPage page5=page1.getResult((String)request.getParameter("jumpPage"));
		      request.setAttribute("PageUser", page5);
		  }catch(Exception e){
			  e.printStackTrace();
		  }
		  request.getRequestDispatcher("admin/main/users.jsp").forward(request,response);
		}

		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 doGet(request,response);
		}

	}

