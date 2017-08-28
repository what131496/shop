package page;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/AdminPageServlet")
public class AdminPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AdminPageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
			  AdminPage page1=new AdminPage();
			  AdminPage Adminpage=page1.getResult((String)request.getParameter("jumpPage"));
		      request.setAttribute("PageAdmin", Adminpage);
		  }catch(Exception e){
			  e.printStackTrace();
		  }
		  request.getRequestDispatcher("admin/main/admin.jsp").forward(request,response);
		}

		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 doGet(request,response);
		}

	}

