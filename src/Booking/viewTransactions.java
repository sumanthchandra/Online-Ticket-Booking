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

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.concurrent.TimeUnit ;

/**
 * Servlet implementation class viewTransactions
 */
@WebServlet(
		urlPatterns = { "/viewTransactions" })

public class viewTransactions extends HttpServlet {
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
		PrintWriter out=response.getWriter();
		session=request.getSession(false);
		String email_id=(String)session.getAttribute("email");
		String name=(String)session.getAttribute("name");
		Statement stat=con.createStatement();
		ResultSet r=stat.executeQuery("select id,eventName,category,seats,cardNumber,cardType,date_of_booking,time_of_booking,ticket_status from transaction where email_id='"+email_id+"' order by date_of_booking desc,time_of_booking desc;");
		out.println("<html>");
    	out.println(" <head> \r\n" + 
    			"      <meta charset=\"UTF-8\">\r\n" + 
    			"    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n" + 
    			"   <meta http-equiv=\"X-UA-Compatible\" content=\"ie=edge\">\r\n" + 
    			"   <link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css\">\r\n" + 
    			"  <script src=\"https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js\"></script>\r\n" + 
    			"  <script src=\"https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js\"></script>\r\n" + 
    			"  <script src=\"https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js\"></script>\r\n" + 
    			"    <style>\r\n" + 
    			"            body {font-family: Arial, Helvetica, sans-serif;}\r\n" + 
    			"            * {box-sizing: border-box;}\r\n" + 
    			"            \r\n" + 
    			"            input[type=text], select, textarea {\r\n" + 
    			"                width: 100%;\r\n" + 
    			"                padding: 12px;\r\n" + 
    			"                border: 1px solid #ccc;\r\n" + 
    			"                border-radius: 4px;\r\n" + 
    			"                box-sizing: border-box;\r\n" + 
    			"                margin-top: 6px;\r\n" + 
    			"                margin-bottom: 16px;\r\n" + 
    			"                resize: vertical;\r\n" + 
    			"            }\r\n" + 
    			"            \r\n" + 
    			"            input[type=submit] {\r\n" + 
    			"                background-color: #4CAF50;\r\n" + 
    			"                color: white;\r\n" + 
    			"                padding: 12px 20px;\r\n" + 
    			"                border: none;\r\n" + 
    			"                border-radius: 4px;\r\n" + 
    			"                cursor: pointer;\r\n" + 
    			"            }\r\n" + 
    			"            \r\n" + 
    			"            input[type=submit]:hover {\r\n" + 
    			"                background-color: #45a049;\r\n" + 
    			"            }\r\n" + 
    			"            \r\n" + 
    			"            .container {\r\n" + 
    			"                border-radius: 5px;\r\n" + 
    			"                background-color: #f2f2f2;\r\n" + 
    			"                padding: 20px;\r\n" + 
    			"            }\r\n" + 
    			"            </style>"+
    			 "</head>");
    	out.println("<body align=\"center\">");
    	out.println("<nav class=\"navbar navbar-expand-lg navbar-light bg-light fixed-top\">\r\n" + 
    			"                <a class=\"navbar-brand\" href=\"UserPage.jsp\">\r\n" + 
    			"                    <img src=\"home_icon.png\" width=\"30\" height=\"30\"  alt=\"logo\">\r\n" + 
    			"                </a>\r\n" + 
    			"                <button class=\"navbar-toggler\" type=\"button\" data-toggle=\"collapse\" data-target=\"#navbarSupportedContent\" aria-controls=\"navbarSupportedContent\" aria-expanded=\"false\" aria-label=\"Toggle navigation\">\r\n" + 
    			"                  <span class=\"navbar-toggler-icon\"></span>\r\n" + 
    			"                </button>\r\n" + 
    			"              \r\n" + 
    			"                <div class=\"collapse navbar-collapse\" id=\"navbarSupportedContent\">\r\n" + 
    			"                  <ul class=\"navbar-nav mr-auto\">\r\n" + 
    			"                        <li class=\"nav-item dropdown active\">\r\n" + 
    			"                            <a class=\"nav-link dropdown-toggle\" href=\"#\" id=\"navbarDropdown\" role=\"button\" data-toggle=\"dropdown\" aria-haspopup=\"true\" aria-expanded=\"false\">\r\n" + 
    			"                                City\r\n" + 
    			"                            </a>\r\n" + 
    			"                            <div class=\"dropdown-menu\" aria-labelledby=\"navbarDropdown\">\r\n" + 
    			"                                <a class=\"dropdown-item\" href=\"#\">Hyderabad</a>\r\n" + 
    			"                                <a class=\"dropdown-item\" href=\"#\">Mumbai</a>\r\n" + 
    			"                                <a class=\"dropdown-item\" href=\"#\">Chennai</a>\r\n" + 
    			"                                <a class=\"dropdown-item\" href=\"#\">Delhi</a>\r\n" + 
    			"                            </div>\r\n" + 
    			"                        </li>\r\n" + 
    			"                        <li class=\"nav-item active\">\r\n" + 
    			"                            <a class=\"nav-link active\" href=\"contactususer.jsp\">Contact Us<span class=\"sr-only\">(current)</span></a>\r\n" + 
    			"                        </li>\r\n" + 
    			"                        <li class=\"nav-item active\">\r\n" + 
    			"                            <a class=\"nav-link\" href=\"aboutususer.jsp\">About Us<span class=\"sr-only\">(current)</span></a>\r\n" + 
    			"                        </li>\r\n" + 
    			"                  </ul>\r\n" + 
    			"                                                <div class=\"dropdown\">\r\n" + 
    			"<button type=\"button\" class=\"btn btn-primary dropdown-toggle\" data-toggle=\"dropdown\" style=\"margin-right: 10px;\" title=\"\">\r\n Hi " + 
    			name+"\r\n" + 
    			"<span class=\"caret\"></span>\r\n" + 
    			"</button>\r\n" + 
    			"<ul class=\"dropdown-menu\">\r\n" + 
    			"<li><a href=\"viewTransactions\">Your Transactions</a></li>\r\n" + 
    			"<li><a href=\"viewProfile\" >View Profile</a></li>\r\n" + 
    			"<li><a href=\"LogoutServlet\">Log Out</a></li>\r\n" + 
    			"</ul>\r\n" + 
    			"</div> "+  
    			"                </div>\r\n" + 
    			"              </nav>");
		out.println("<br><br><br><h1 style=\"color:orange;\">Your Transactions (latest first): </h1>");
		out.println("<br><h4 style=\"color:red;\">*Resale of tickets is only allowed half an hour before the scheduled start time of the event.</h4>");
		out.println("<style>");
		out.println("table, th, td {");
		out.println("border: 1px solid black;");
		out.println("border-collapse: collapse;");
		out.println("}");
		out.println("</style>");
		out.println("<table>");
		out.println("<tr>");
		out.println("<th>Serial No</th>");
		out.println("<th>Transaction ID</th>");
		out.println("<th>Event Name</th>");
		out.println("<th>Event Date</th>");
		out.println("<th>Event Time</th>");
		out.println("<th>Venue</th>");
		out.println("<th>Category</th>");
		out.println("<th>Seats</th>");
		out.println("<th>Card Number</th>");
		out.println("<th>Card Type</th>");
		out.println("<th>Booking Date</th>");
		out.println("<th>Booking Time</th>");
		out.println("<th>Status</th>");
		out.println("<th>ReSale</th>");
		out.println("</tr>");
		
		
		int flag=0,i=1;
		while(r.next())
		{   out.println("<tr>");
			flag=1;
			Statement stat1=con.createStatement();
			ResultSet revent=stat1.executeQuery("select eventDate,eventTime,venue from event where eventName='"+r.getString("eventName")+"';");
			revent.next();
			String date1 = revent.getDate("eventDate").toString();
			String time1 = revent.getTime("eventTime").toString();
			long millis = System.currentTimeMillis();
			java.sql.Date date = new java.sql.Date(millis);
			java.sql.Time time = new java.sql.Time(millis);
			String date2 = date.toString();
			String time2 = time.toString();
			String format = "yyyy-MM-dd hh:mm:ss";
			SimpleDateFormat sdf = new SimpleDateFormat(format);

			Date dateObj1 = sdf.parse(date1 + " " + time1);
			Date dateObj2 = sdf.parse(date2 + " " + time2);
			long diff = dateObj1.getTime() - dateObj2.getTime();
			long minutes = TimeUnit.MILLISECONDS.toMinutes(diff);
			//System.out.println("Difference between minutes: " + minutes);
			if(r.getString("ticket_status").equals("BOOKED")&&minutes>=30)
			{
			out.println("<td>"+i+"</td><td>"+r.getInt("id")+"</td><td>"+r.getString("eventName")+"</td><td>"+revent.getDate("eventDate")+"</td><td>"+revent.getTime("eventTime")+"</td><td>"+revent.getString("venue")+"</td><td>"+r.getString("category")+"</td><td>"+r.getInt("seats")+"</td><td>"+r.getString("cardNumber")+"</td><td>"+r.getString("cardType")+"</td><td>"+r.getDate("date_of_booking")+"</td><td>"+r.getTime("time_of_booking")+"</td><td>"+r.getString("ticket_status")+"</td><td>"+"<a style=\"color:green\" href=resale?id="+r.getInt("id")+">RESALE</a></td>");
			}
			else
			{
				out.println("<td>"+i+"</td><td>"+r.getInt("id")+"</td><td>"+r.getString("eventName")+"</td><td>"+revent.getDate("eventDate")+"</td><td>"+revent.getTime("eventTime")+"</td><td>"+revent.getString("venue")+"</td><td>"+r.getString("category")+"</td><td>"+r.getInt("seats")+"</td><td>"+r.getString("cardNumber")+"</td><td>"+r.getString("cardType")+"</td><td>"+r.getDate("date_of_booking")+"</td><td>"+r.getTime("time_of_booking")+"</td><td>"+r.getString("ticket_status")+"</td><td>"+"<a style=\"color:red\">RESALE*</a></td>");
			}
			out.println("</tr>");
		    i++;
		}
		out.println("</table>");
		out.println("</body></html>");
		if(flag==0)
		{
			out.println("<br><h2 style=\"color:blue;\">No transactions yet...</h2>");
		}
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		}
	}

}
