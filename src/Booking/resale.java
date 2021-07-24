package Booking;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

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
 * Servlet implementation class viewProfile
 */
@WebServlet(urlPatterns = { "/resale" })

public class resale extends HttpServlet {
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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		HttpSession session = request.getSession(false);
		if (session == null) {
	        response.sendRedirect("homepage.html"); // No logged-in user found, so redirect to login page.
	        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
	        response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
	        response.setDateHeader("Expires", 0);
		}
		else
		{
		try
		{
		session=request.getSession(false);
		String g=request.getParameter("id");
		int ID=Integer.parseInt(g);
		Statement stat=con.createStatement();
		int r=stat.executeUpdate("update transaction set ticket_status=\'SOLD\' where id="+ID);
		int r1=stat.executeUpdate("insert into resale(id,seller_email,eventName,category,seats) select id,email_id,eventName,category,seats from transaction where id="+ID);
		 response.sendRedirect("http://localhost:8080/OnlineTicketBooking/viewTransactions");
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		}
	}
}
