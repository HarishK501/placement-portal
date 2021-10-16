package com.apms;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")

@WebServlet(name = "application", urlPatterns = { "/application" })
public class Application extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("t");
		System.out.println(id);
		
		// TODO
		// 1. get record from database with the given id
		// 2. set attributes in request object

		RequestDispatcher rd = request.getRequestDispatcher("stud/application.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("t");
		System.out.println(id);
		
		// 3. Add application to database
		
		doGet(request, response);  //should remove this line
	}

}
