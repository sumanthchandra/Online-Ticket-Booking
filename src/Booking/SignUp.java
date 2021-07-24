package Booking;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SignUp
 */
@WebServlet(urlPatterns = { "/SignUp" })
public class SignUp extends HttpServlet {
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
	 *      response) protected void doGet(HttpServletRequest request,
	 *      HttpServletResponse response) throws ServletException, IOException { //
	 *      TODO Auto-generated method stub
	 *      response.getWriter().append("Served at: ").append(request.getContextPath());
	 *      }
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
			Statement stat = con.createStatement();
			String fname = request.getParameter("firstName");
			String lname = request.getParameter("lastName");
			String email = request.getParameter("EMail");
			String pass = request.getParameter("password");
			ResultSet rset=stat.executeQuery("select email from user where email ='"+email+"';");
			int i = 0;
			while(rset.next()) {
			    i++;
			}
			if(i==0)
			{
			int rs = stat.executeUpdate("insert into user(firstname,lastname,email,user_password) values('" + fname + "','"
					+ lname + "','" + email + "','" + pass + "');");
			if (rs > 0) {
				out.println("<html><body align="+"\"center\""+">");
				out.println("<h1 style=\"color:green\">Successfully Registered!</h1>");
				out.println("<a href=homepage.html><h2>HomePage</h2></a>");
				out.println("</body></html>");
					/*RequestDispatcher rd=request.getRequestDispatcher("homepage.html");    
					rd.forward(request, response);*/
				}
				else
				{
					out.println("<html><body align="+"\"center\""+">");
					out.println("<h1 style=\"color:red\">Oops! Something went wrong!</h1>");
					out.println("<a href=homepage.html><h2>HomePage</h2></a>");
					out.println("</body></html>");
					
				}
		}
			else
			{
				out.println("<html><body align="+"\"center\""+">");
				out.println("<h1 style=\"color:red\">User with the entered Email already exists!</h1>");
				out.println("<a href=homepage.html><h2>HomePage</h2></a>");
				out.println("</body></html>");
			}
		}
		catch (Exception e) {
			System.out.println(e);
		}
		}
}
