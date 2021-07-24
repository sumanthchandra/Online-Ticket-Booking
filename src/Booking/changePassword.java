package Booking;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
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
 * Servlet implementation class register
 */
@WebServlet(urlPatterns = { "/changePassword" })
public class changePassword extends HttpServlet {
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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	/*
	 * protected void doGet(HttpServletRequest request, HttpServletResponse
	 * response) throws ServletException, IOException { // TODO Auto-generated
	 * method stub
	 * response.getWriter().append("Served at: ").append(request.getContextPath());
	 * }
	 */

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		try {
			Statement stat=con.createStatement();
			HttpSession session=request.getSession(false);
			String passmail=(String)session.getAttribute("passmail");
			String password=request.getParameter("pass");
			String confirmPassword=request.getParameter("cpass");
			if(password.equals(confirmPassword))
			{
			int rs=stat.executeUpdate("update user set user_password='"+password+"' where email ='"+passmail+"';");
			session.invalidate();
			if(rs>0)
			{
				out.println("<html><body align=" + "\"center\"" + ">");
				out.println("<h1 style=\"color:green\"><b>Password Changed!<b></h1>");
				out.println("<a href=homepage.html><h2>HomePage</h2></a>");
				out.println("</body></html>");
			}
			}
			else
			{
				out.println("<html><body align=" + "\"center\"" + ">");
				out.println("<h1 style=\"color:red\"><b>Passwords didn't match<b></h1>");
				out.println("<a href=verify.html><h2>Get Verification Code Again</h2></a>");
				out.println("<a href=homepage.html><h2>HomePage</h2></a>");
				out.println("</body></html>");

			}
		} catch (Exception e) {
			System.out.println(e);
			out.println("<html><body align=" + "\"center\"" + ">");
			out.println("<h1 style=\"color:red\"><b>Something went wrong!Try Again<b></h1>");
			out.println("<a href=verify.html><h2>Get Verification Code Again</h2></a>");
			out.println("<a href=homepage.html><h2>HomePage</h2></a>");
			out.println("</body></html>");
		}
	}

}
