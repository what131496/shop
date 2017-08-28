package page;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/BookpageServlet")
public class BookpageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BookpageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
			  bookPage page1=new bookPage();
			  bookPage page5=page1.getResult((String)request.getParameter("jumpPage"));
		      request.setAttribute("PageBook", page5);
		  }catch(Exception e){
			  e.printStackTrace();
		  }
		  request.getRequestDispatcher("admin/main/book.jsp").forward(request,response);
		}

		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 doGet(request,response);
		}

	}

