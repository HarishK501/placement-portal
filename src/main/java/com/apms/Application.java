package com.apms;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.apms.dao.ApmsDao;

@SuppressWarnings("serial")

@WebServlet(name = "application", urlPatterns = { "/application" })
public class Application extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		
		// TODO
		// 1. get record from database with the given id
		// 2. set attributes in request object
		
		Connection conn = ApmsDao.conn;
		PreparedStatement query;
		ResultSet rs;
		
		String title = "";
		
		try {
			query = conn.prepareStatement("SELECT * FROM jobprofile WHERE id="+id+";");
			rs = query.executeQuery();
			
			if (rs.next()) {
				title = "Application for" + rs.getString("title");
				
				request.setAttribute("title", title);
				request.setAttribute("jobId", id);
				
				RequestDispatcher rd = request.getRequestDispatcher("stud/application.jsp");
				rd.forward(request, response);
				
			} else response.sendRedirect("message?msg_type=3");		
			
		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("message?msg_type=2");	
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		
		// 3. Add application to database
		
		doGet(request, response);  //should remove this line
	}

}
