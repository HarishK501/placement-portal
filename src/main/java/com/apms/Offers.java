package com.apms;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.apms.dao.ApmsDao;
import com.apms.obj.OfferObj;

@SuppressWarnings("serial")
@WebServlet(name = "offers", urlPatterns = { "/offers" })


public class Offers extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		if (session.getAttribute("user") == null)
			response.sendRedirect("message?msg_type=1");
		else {
		
			Connection conn = ApmsDao.conn;
			PreparedStatement query;
			PreparedStatement query1;
			ResultSet rs;
			ResultSet rs1;
			
			ArrayList<OfferObj> offer = new ArrayList<OfferObj>();
			
			try {
				query = conn.prepareStatement("select * from application where student_id=? and app_status='offered' ");
				query.setInt(1, (int)(session.getAttribute("id")));
				
				rs = query.executeQuery();
				while (rs.next()) {
					query1 = conn.prepareStatement("select * from Jobprofile where id=?");
					query1.setInt(1, rs.getInt("job_id"));
					rs1 = query1.executeQuery();
					rs1.next();
					offer.add(
							new OfferObj(
									rs.getInt("job_id"),
									rs1.getString("title"), 
									rs1.getString("organizations")
									)
							);
				}
				
				request.setAttribute("offers", offer);
//				RequestDispatcher rd = request.getRequestDispatcher("stud/offer.jsp");
//				rd.forward(request, response);
			} catch (Exception e) {
				e.printStackTrace();
//				System.out.println("Here");
//				response.sendRedirect("message?msg_type=2");
			}

			RequestDispatcher rd = request.getRequestDispatcher("stud/offer.jsp");
			rd.forward(request, response);
			
			
		}
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// change password or account details
		doGet(request, response); 
	}
	
}