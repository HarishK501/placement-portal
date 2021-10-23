package com.apms;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.apms.dao.ApmsDao;
import com.apms.obj.AnnouncementObj;

@SuppressWarnings("serial")


@WebServlet(name = "home", urlPatterns = { "/home" })
public class Home extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		if (session.getAttribute("user") == null)
			response.sendRedirect("login");
		else {
			int user =  Integer.parseInt((String) session.getAttribute("user"));

			ApmsDao dao = new ApmsDao();
			Connection conn = dao.getConnection();
			PreparedStatement query;
			ResultSet rs;
			
			// getting recent job profiles
			// TODO: table of job profiles
			
			// getting recent announcements
			ArrayList<AnnouncementObj> announcements = new ArrayList<AnnouncementObj>(3);
			
			try {
				query = conn.prepareStatement("SELECT * FROM announcements ORDER BY date_time DESC");
				rs = query.executeQuery();
				int i = 0;
				while (i < 3 && rs.next()) {
					announcements.add(
							new AnnouncementObj(
									rs.getString("id"),
									rs.getString("title"), 
									rs.getString("content").substring(0, 60)+"...", 
									rs.getString("date_time")
									)
							);
					i++;
				}
				
				request.setAttribute("announcements", announcements);
				
			} catch (SQLException e) {
				e.printStackTrace();
			}

			if (user == 1) {
				// TODO: get recent activities from DB
				RequestDispatcher rd_stud = request.getRequestDispatcher("stud/home.jsp");		
				rd_stud.forward(request, response);
			} else if (user == 2) {
				RequestDispatcher rd_pco = request.getRequestDispatcher("pco/home.jsp");
				rd_pco.forward(request, response);
			} else response.sendRedirect("login");
		}
	}
}
