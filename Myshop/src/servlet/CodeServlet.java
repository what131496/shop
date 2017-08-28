package servlet;

import java.awt.Color;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/CodeServlet")
public class CodeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public CodeServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	BufferedImage bi=new BufferedImage(68,22,BufferedImage.TYPE_INT_BGR);
	Graphics g=bi.getGraphics();
	Color c=new Color(84,255,150);
	g.setColor(c);
	g.fillRect(0, 0, 68, 22);
	char[] ch="ABCDEFGHIJKLMNOPQRSTIVWXYZ123456789".toCharArray();
	Random r=new Random();
	int len=ch.length,index;
	StringBuffer sb = new StringBuffer();
	for(int i=0; i<4; i++){
		index = r.nextInt(len);
		g.setColor(new Color(r.nextInt(256),r.nextInt(108),r.nextInt(115)));
		g.drawString(ch[index]+"", (i*15)+3, 18);
		sb.append(ch[index]);
	}
	request.getSession().setAttribute("piccode", sb.toString());
	ImageIO.write(bi, "JPG", response.getOutputStream());
}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
