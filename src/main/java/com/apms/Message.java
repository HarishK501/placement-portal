package com.apms;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@SuppressWarnings("serial")
@WebServlet(name = "message", urlPatterns = { "/message" })

public class Message extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		RequestDispatcher rd = request.getRequestDispatcher("Message.jsp");
		int msgType = Integer.parseInt(request.getParameter("msg_type"));
		String msg = "";
		switch (msgType) {
		case 1:
			msg = "<div class=\"alert alert-danger\" role=\"alert\">"
					+ "  Invalid credentials. Please try again"
					+ "</div><br>Click <a href=\"login\">here</a> to login";
			session.invalidate();
			
			break;
		case 2:
			msg = "<div class=\"alert alert-danger\" role=\"alert\">"
					+ "Error connecting with the database. Sorry for the inconvinience. Please try after some time."
					+ "</div>";
			break;
		case 3:
			msg = "<div class=\"alert alert-warning\" role=\"alert\">"
					+ "Invalid Request"
					+ "</div>";
			break;
		case 4:
			msg = "<div class=\"alert alert-success\" role=\"alert\">"
					+ "Password changed successfully. "
					+ "</div><br>Click <a href=\"login\">here</a> to login";
			session.invalidate();
			break;
		default:
			msg = "Error 404. Page Not Found.";
		}
		request.setAttribute("message", msg);
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
