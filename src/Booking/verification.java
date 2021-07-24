package Booking;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Random;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class verification
 */
@WebServlet(urlPatterns = { "/verification" })
public class verification extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection con = null;

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		super.init(config);
		try {
			ServletContext sc = this.getServletContext();
			Class.forName(sc.getInitParameter("DB_DRIVER"));
			con = DriverManager.getConnection(sc.getInitParameter("DB_URL"), sc.getInitParameter("DB_USER"),
					sc.getInitParameter("DB_PASSWORD"));
			if (con != null)
				System.out.println("connection established");
		} catch (Exception e) {
			System.out.println(e);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out=response.getWriter();
		try
		{
		HttpSession session=request.getSession();
		String email=request.getParameter("email");
		Statement stat=con.createStatement();
		ResultSet res = stat.executeQuery("select email from user where email='"+ email+"';");
		int i=0;
		while(res.next())
		{
			i++;
		}
		if(i>0)
		{
		String mes="Verification Code from Booking App";
		String num="";
		Random rnd = new Random();
		int n = 100000 + rnd.nextInt(900000);
		num=num+n;
		send s=new send(email,mes,num);
		s.setMailServerProperties();
		s.createEmailMessage();
		s.sendEmail();
		session.setAttribute("code", num);
		session.setAttribute("passmail",email);
		
		request.getRequestDispatcher("emailcheck.html").forward(request,response);
		}
		else
		{
			out.println("<html><body align=" + "\"center\"" + ">");
			out.println("<h1 style=\"color:red\"><b>Oops! Looks like this email isn't registered with us<b></h1>");
			out.println("<a href=verify.html><h2>Get Verification Code Again</h2></a>");
			out.println("<a href=homepage.html><h2>HomePage</h2></a>");
			out.println("</body></html>");
		}
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
	}

}
