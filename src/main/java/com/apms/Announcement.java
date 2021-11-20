package com.apms;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.apms.dao.ApmsDao;
import com.apms.obj.AnnouncementObj;

import java.util.*;
import java.text.*;

@SuppressWarnings("serial")
@WebServlet(name = "announcement", urlPatterns = { "/announcement" })

public class Announcement extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		
		if (request.getParameter("t") != null) {
			String t = request.getParameter("t");
			if (t.equals("post"))
				response.sendRedirect("pco/postAnnouncement.jsp");
			else if (t.equals("view_all")) {
				RequestDispatcher rd = request.getRequestDispatcher("all_announcements.jsp");
				Connection conn = ApmsDao.conn;
				PreparedStatement query;
				ResultSet rs;
				
				ArrayList<AnnouncementObj> announcements = new ArrayList<AnnouncementObj>();
				
				try {
					query = conn.prepareStatement("SELECT * FROM announcements ORDER BY date_time DESC");
					rs = query.executeQuery();

					String content;
					while (rs.next()) {
						content = rs.getString("content");
						if (content.length() > 60) {
							content = content.substring(0, 60) + "...";
						}
						announcements.add(
								new AnnouncementObj(
										rs.getString("id"),
										rs.getString("title"), 
										content, 
										rs.getString("date_time")
										)
								);
					}
					
					request.setAttribute("announcements", announcements);
					
				} catch (SQLException e) {
					e.printStackTrace();
				}
				
				request.setAttribute("announcements", announcements);
				rd.forward(request, response);
			}
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
						if (rs_x.next()) {
							request.setAttribute("attachment", rs_x.getString("link"));
						}
						
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
		Connection conn = ApmsDao.conn;
		HttpSession session = request.getSession();
		
		Date today = new Date();
	    SimpleDateFormat ft = new SimpleDateFormat ("yyyy-MM-dd HH:mm:ss"); 
	    String postedOn = ft.format(today);
	    int id =  (int) session.getAttribute("id");
	    String query;
	    
		try {
			Statement stmt = conn.createStatement();
			String docSrc = request.getParameter("docSrc"); 

			if (docSrc.length() == 0) {  // if a document is not provided
				query = "INSERT INTO Announcements(title, content, date_time, postedBy) VALUES"
						+ "('" + request.getParameter("title") + "', '" + request.getParameter("content") + "', '" 
						+ postedOn + "'," + id + ")";    
				
				int m = stmt.executeUpdate(query);
				if (m==1) {
					response.sendRedirect("/ApmsWebApp/home");
				} 
				else {
					response.sendRedirect("message?msg_type=1");
				}
			}
				
			else { // if a document is provided
				query = "INSERT INTO Documents(link) VALUES" + "('" + docSrc + "')";
				
				stmt.executeUpdate(query, Statement.RETURN_GENERATED_KEYS);
				
				int docId = 8001;
				
				ResultSet rs = stmt.getGeneratedKeys();
				if (rs.next()){
				    docId = rs.getInt(1);
				}

				query = "INSERT INTO Announcements(title, content, date_time, postedBy, attachedDoc) VALUES"
						+ "('" + request.getParameter("title") + "', '" + request.getParameter("content") + "', '" 
						+ postedOn + "', " + id + ", " + docId +")";
				
				int m = stmt.executeUpdate(query);
				if (m==1) {
					response.sendRedirect("/ApmsWebApp/home");
				} 
				else {
					response.sendRedirect("message?msg_type=1");
				}
				
			}
			    	
		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("message?msg_type=2");
		}
	}

}
