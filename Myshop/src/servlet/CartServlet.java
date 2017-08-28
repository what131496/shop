package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Book1Dao;
import dataBase.Connect;
import entity.Book1;
import entity.Cart;

@WebServlet("/CartServlet")

public class CartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
     private String action;
     private Book1Dao book=new Book1Dao();//获取业务逻辑类
     
    public CartServlet() {
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
		if(request.getParameter("action")!=null){
			this.action=request.getParameter("action");
			if(action.equals("add")){
				String id=request.getParameter("id");
				//如果是添加购物车
				if(addToCart(request,response)){
					request.getRequestDispatcher("/success.jsp").forward(request, response);
				}else{
					request.getRequestDispatcher("/failure.jsp").forward(request, response);
				}
				Connection conn = null;
				PreparedStatement stmt = null;
				int rs = 0;
				try {
					conn = Connect.getConnection();
					String sql = "insert into cart (content,picture,price,book) select content,picture,realPrice,bookName from book1 where id='"+id+"';"; // SQL语句
					stmt = conn.prepareStatement(sql);
					rs = stmt.executeUpdate();
					if (rs>0) {
						System.out.println("插入购物车数据库成功");
					} else {
					}

				} catch (Exception ex) {
					ex.printStackTrace();
				} finally {
					// 释放语句对象
					if (stmt != null) {
						try {
							stmt.close();
							stmt = null;
						} catch (Exception ex) {
							ex.printStackTrace();
						}
					}

				}
			}
			if(action.equals("show")){
				out.print("<meta http-equiv=\"refresh\" content=\"0.1; url=front/main/cart.jsp\">");
			}
			if(action.equals("delete")){
				if(deleteCart(request,response)){
					out.print("<meta http-equiv=\"refresh\" content=\"0.1; url=front/main/cart.jsp\">");
				}else{
					out.print("<meta http-equiv=\"refresh\" content=\"0.1; url=front/main/cart.jsp\">");
				}
			}
		}
	}
	private Boolean addToCart(HttpServletRequest request, HttpServletResponse response)
	{
		String id=request.getParameter("id");
		String num=request.getParameter("num");
		Book1 book1=book.getBookById(Integer.parseInt(id));
//		判断是否第一次加入购物车,是的话添加session
		if(request.getSession().getAttribute("cart")==null){
			Cart cart=new Cart();
			request.getSession().setAttribute("cart", cart);
		}
			Cart cart = (Cart)request.getSession().getAttribute("cart");
			if(cart.addGoodsInCart(book1, Integer.parseInt(num)))
			{
				return true;
			}
			else
			{
				return false;
			}
			
	}
	//删除购物车的商品
	private Boolean deleteCart(HttpServletRequest request, HttpServletResponse response){
		String id=request.getParameter("id");
		Cart cart=(Cart)request.getSession().getAttribute("cart");
		Book1 b=book.getBookById(Integer.parseInt(id));
		if(cart.removeGoodsFromCart(b)){
			return true;
		}else{
			return false;
		}
	}

}
