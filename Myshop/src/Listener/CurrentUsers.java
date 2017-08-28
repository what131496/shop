package Listener;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;
@WebListener("统计在线人数")
public class CurrentUsers implements HttpSessionListener {
	private int userNumber = 0;

	@Override
	public void sessionCreated(HttpSessionEvent arg0) {
		// TODO Auto-generated method stub
		userNumber++;
		arg0.getSession().getServletContext().setAttribute("userNumber", userNumber);
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent arg0) {
		// TODO Auto-generated method stub
		userNumber--;
		arg0.getSession().getServletContext().setAttribute("userNumber", userNumber);


	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
