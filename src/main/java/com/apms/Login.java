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


@WebServlet("/login")
public class Login extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String usr_reg = request.getParameter("reg_no");
		String password = request.getParameter("password");
		
		HttpSession session = request.getSession();
		// TODO: Connect to DB and verify credentials
		
		if (usr_reg.equals("18501") && password.equals("12345")) {
			session.setAttribute("user", "1");
			session.setAttribute("id", "18501");
		} else if (usr_reg.equals("12345") && password.equals("12345")) {
			session.setAttribute("user", "2");
			session.setAttribute("id", "12345");
		}
		
		response.sendRedirect("home");
	}
}
