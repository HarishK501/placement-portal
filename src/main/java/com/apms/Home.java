package com.apms;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "home", urlPatterns = { "/home" })
public class Home extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		int user =  Integer.parseInt((String) session.getAttribute("user"));
		
		if (user == 1) {
			RequestDispatcher rd_stud = request.getRequestDispatcher("stud/home.jsp");
			rd_stud.forward(request, response);
		} else if (user == 2) {
			RequestDispatcher rd_pco = request.getRequestDispatcher("pco/home.jsp");
			rd_pco.forward(request, response);
		} else response.sendRedirect("login");
	}
}
