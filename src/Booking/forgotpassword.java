package Booking;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/forgotpassword")
public class forgotpassword extends HttpServlet {
	private static final long serialVersionUID = 1L;

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
			HttpSession session = request.getSession(false);
			String code = (String) session.getAttribute("code");
			String form_code = request.getParameter("code");
			if (form_code.equals(code)) {
				request.getRequestDispatcher("change.html").forward(request,response);
			} else {
				out.println("<html><body align=" + "\"center\"" + ">");
				out.println("<h1 style=\"color:red\"><b>Wrong Code!<b></h1>");
				out.println("<a href=verify.html><h2>Get Verification Code Again</h2></a>");
				out.println("<a href=homepage.html><h2>HomePage</h2></a>");
				out.println("</body></html>");
			}
		} 
		catch (Exception e) {
			System.out.println(e);
			out.println("<html><body align=" + "\"center\"" + ">");
			out.println("<h1 style=color:\"red\"><b>Something went wrong!<b></h1>");
			out.println("<a href=homepage.html><h2>HomePage</h2></a>");
			out.println("</body></html>");
		}
	}

}
