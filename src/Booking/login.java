package Booking;


import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
//import java.util.HashMap;
import java.sql.Connection;
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
@WebServlet(urlPatterns = { "/login" })
public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection con=null;
	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		super.init(config);
		try
		{
			ServletContext sc = this.getServletContext();
			Class.forName(sc.getInitParameter("DB_DRIVER"));
			con = DriverManager.getConnection(sc.getInitParameter("DB_URL"), sc.getInitParameter("DB_USER"),
					sc.getInitParameter("DB_PASSWORD"));
			if(con!=null)
				System.out.println("connection established");
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	/*protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}*/

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		PrintWriter out=response.getWriter();
		response.setContentType("text/html");
		try
		{
			Statement stat=con.createStatement();
			String email=request.getParameter("loginEmail");
			String password=request.getParameter("loginPassword");
			ResultSet r=stat.executeQuery("select email from user where email='"+email+"';");
			r.beforeFirst();
			if(r.next()==false)
			{
				out.println("<h1 style=\"color:red\">No such user exists<h1>");
				out.println("<a href="+"\"homepage.html\""+">HomePage</a>"); 
			}
			else
			{
			ResultSet rs=stat.executeQuery("select firstname,email from user where email='"+email+"' and user_password='"+password+"';");
			int flag=0;
			while(rs.next()!=false) {
				flag=1;
				HttpSession session=request.getSession();  
		        session.setAttribute("name",rs.getString("firstname"));
		        session.setAttribute("email",rs.getString("email") );
			}
			if(flag==1)
			request.getRequestDispatcher("UserPage.jsp").include (request, response);
			else
			{
				out.println("<h1 style=\"color:red\">Wrong Password! Try Again.<h1>");
				out.println("<a href="+"\"homepage.html\""+">HomePage</a>");
			}
			}
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
	}

}
