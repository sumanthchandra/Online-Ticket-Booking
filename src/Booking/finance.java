package Booking;

import java.io.IOException;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class finance
 */
@WebServlet("/finance")
public class finance extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
		try
		{
		 session=request.getSession(false); 
		System.out.println("payment details session "+session);
		String cardType=request.getParameter("card");
		String cardNumber=request.getParameter("cardNumber");
		session.setAttribute("cardType", cardType);
		session.setAttribute("cardNumber", cardNumber);
		String mes="OTP from Booking App";
		String email=(String)session.getAttribute("email");
		String num="";
		Random rnd = new Random();
		int n = 100000 + rnd.nextInt(900000);
		num=num+n;
		send s=new send(email,mes,num);
		s.setMailServerProperties();
		s.createEmailMessage();
		s.sendEmail();
		session.setAttribute("otp", num);
		request.getRequestDispatcher("otp.html").forward(request,response);
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		}
	}

}
