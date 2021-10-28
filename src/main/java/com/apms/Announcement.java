package com.apms;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.apms.dao.ApmsDao;

@SuppressWarnings("serial")
@WebServlet(name = "announcement", urlPatterns = { "/announcement" })

public class Announcement extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		
		if (request.getParameter("t") != null) {
			String t = request.getParameter("t");
			if (t.equals("post"))
				response.sendRedirect("pco/postAnnouncement.jsp");
			else if (t.equals("view")) {
				int id = Integer.parseInt(request.getParameter("id"));

				try {
					Connection conn = ApmsDao.conn;
					
					PreparedStatement query = conn.prepareStatement("select * from Announcements where id=?");
					query.setInt(1, id);
					
					ResultSet rs = query.executeQuery();
					if (rs.next()) {
						request.setAttribute("title", rs.getString("title"));
						request.setAttribute("content", rs.getString("content"));
						request.setAttribute("datetime", rs.getString("date_time")); 
						
						int x = rs.getInt("postedBy");
						query = conn.prepareStatement("select * from coordinator where id=?");
						query.setInt(1, x);
						ResultSet rs_x = query.executeQuery();
						rs_x.next();
						request.setAttribute("postedBy", rs_x.getString("email"));
						
						x = rs.getInt("attachedDoc");
						query = conn.prepareStatement("select * from Documents where id=?");
						query.setInt(1, x);
						rs_x = query.executeQuery();
						rs_x.next();
						
						request.setAttribute("attachment", rs_x.getString("link"));
						RequestDispatcher rd = request.getRequestDispatcher("announcement.jsp");
						rd.forward(request, response);
						
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
				
			}
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// add record in DB
		response.sendRedirect("/ApmsWebApp/home");
	}

}
