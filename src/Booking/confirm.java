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
 * Servlet implementation class register
 */
@WebServlet(urlPatterns = { "/confirm" })
public class confirm extends HttpServlet {
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
		HttpSession session = request.getSession(false);
		if (session == null) {
	        response.sendRedirect("homepage.html"); // No logged-in user found, so redirect to login page.
	        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
	        response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
	        response.setDateHeader("Expires", 0);
		}
		else
		{
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		try {
			Statement stat = con.createStatement();
			session = request.getSession(false);
			String email = (String) session.getAttribute("email");
			String category = (String) session.getAttribute("category");
			int noofseats = (int) session.getAttribute("seats");
			String cardType = (String) session.getAttribute("cardType");
			String cardNumber = (String) session.getAttribute("cardNumber");
			String eventName = (String) session.getAttribute("eventName");
			long millis = System.currentTimeMillis();
			java.sql.Date date = new java.sql.Date(millis);
			java.sql.Time time = new java.sql.Time(millis);
			String arr[] = cardNumber.split(" ");
			String c = "XXXX-XXXX-XXXX-";
			c = c + arr[3];
			String form_otp = request.getParameter("otp");
			String otp = (String) session.getAttribute("otp");
			if (form_otp.equals(otp)) {
				int rs = stat.executeUpdate(
						"insert into transaction(email_id,eventName,category,seats,cardNumber,cardType,date_of_booking,time_of_booking) values('"
								+ email + "','" + eventName + "','" + category + "'," + noofseats + ",'" + c + "','"
								+ cardType + "','" + date + "','" + time + "');");
				if (rs > 0) {
					ResultSet res = stat.executeQuery("select id from transaction where email_id='" + email
							+ "'order by date_of_booking desc, time_of_booking desc limit 1");
					String transactionId = "Transaction ID: ";
					while (res.next()) {
						transactionId += res.getInt("id");
					}
					String sEventName = "Event Name: " + eventName;
					String sCategory = "Category: " + category;
					String sNoOfSeats = "Number of Seats: " + noofseats;
					String sCardNumber = "Card Number: " + c;
					String sCardType = "Card Type: " + cardType;
					String sDate = "Date: " + date;
					String sTime = "Time: " + time;
					String subject = "Ticket Summary for " + eventName;
					String body = "Ticket booked successfully!" + "\r\n" + transactionId + "\r\n" + sEventName + "\r\n"
							+ sCategory + "\r\n" + sNoOfSeats + "\r\n" + sCardNumber + "\r\n" + sCardType + "\r\n"
							+ sDate + "\r\n" + sTime;
					send s = new send(email, subject, body);
					s.setMailServerProperties();
					s.createEmailMessage();
					s.sendEmail();

					out.println("<html><body align=" + "\"center\"" + ">");
					out.println("<h1 style=\"color:green;\"><b>Transaction Successful!</b></h1>");
					out.println("<h2 style=\"color:orange;\">Transaction Details</h2>");
					out.println("<h3>" + transactionId + "</h3>");
					out.println("<h3>" + sEventName + "</h3>");
					out.println("<h3>" + sCategory + "</h3>");
					out.println("<h3>" + sNoOfSeats + "</h3>");
					out.println("<h3>" + sCardNumber + "</h3>");
					out.println("<h3>" + sCardType + "</h3>");
					out.println("<h3>" + sDate + "</h3>");
					out.println("<h3>" + sTime + "</h3>");
					out.println("<h2 style=\"color:orange;\">You will get a mail consisting of M-Ticket</h2>");
					out.println("<br>");
					out.println("<a href=UserPage.jsp><h2>HomePage</h2></a>");
					out.println("</body></html>");
				} else {
					out.println("<html><body align=" + "\"center\"" + ">");
					out.println("<h1 style=\"color:red;\"><b>Transaction Failed!</b></h1>");
					out.println("<a href=UserPage.jsp><h2>HomePage</h2></a>");
					out.println("</body></html>");
				}
			} else {
				out.println("<html><body align=" + "\"center\"" + ">");
				out.println("<h1 style=\"color:red;\">Invalid OTP!</h1>");
				out.println("<a href=UserPage.jsp><h2>HomePage</h2></a>");
				out.println("</body></html>");
			}
		} catch (Exception e) {
			System.out.println(e);
			out.println("<html><body align=" + "\"center\"" + ">");
			out.println("<h1 style=color:\"red\"><b>Failed!<b></h1>");
			out.println("<a href=UserPage.jsp><h2>HomePage</h2></a>");
			out.println("</body></html>");
		}
		}
	}

}
