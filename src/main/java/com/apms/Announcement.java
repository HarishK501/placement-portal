package com.apms;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet(name = "announcement", urlPatterns = { "/announcement" })

public class Announcement extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		
		if (request.getParameter("t") != null) {
			String t = request.getParameter("t");
			if (t.equals("post"))
				response.sendRedirect("pco/postAnnouncement.jsp");
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// add record in DB
		response.sendRedirect("/ApmsWebApp/home");
	}

}
