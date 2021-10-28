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
import com.apms.obj.JobProfileObj;

import java.sql.Statement;
@SuppressWarnings("serial")

@WebServlet(name = "jobProfile", urlPatterns = { "/jobProfile" })

public class JobProfile extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if (request.getParameter("t") != null) {
			Connection conn = ApmsDao.conn;
			PreparedStatement query;
			ResultSet rs;
			String t = request.getParameter("t");
			
			if (t.equals("add")) {
				response.sendRedirect("pco/addJobProfile.jsp");
			}
			else if (t.charAt(0)=='e'){
				String id= t.substring(5);
				
				response.sendRedirect("pco/editJobProfile.jsp");
			}
			else {//job-id
				request.removeAttribute("jobprofile");
				System.out.println(t);
				
				try {
					query = conn.prepareStatement("SELECT * FROM jobprofile WHERE id="+t+";");
					rs = query.executeQuery();
					JobProfileObj profile = null ; 
					while ( rs.next() ) {
						profile = new JobProfileObj(
								        rs.getInt("id"),
										rs.getString("title"), 
										rs.getString("discriptions"), 
										rs.getString("type_int_fte"),
										rs.getDouble("CTC"),
										rs.getString("organizations"),
										rs.getString("location"),
										rs.getString("end_date"),
										rs.getString("posted_on"),
										rs.getString("depts"),
										rs.getInt("YOG"),
										rs.getDouble("minimun_cgpa"),
										rs.getString("gender"),
										rs.getInt("postedby"),
										rs.getInt("attached_doc")
										);
								
					}
					
					request.setAttribute("jobprofile", profile );
					
				} catch (SQLException e) {
					e.printStackTrace();
				}
				
				RequestDispatcher rd_stud = request.getRequestDispatcher("jobProfile.jsp");		
				rd_stud.forward(request, response);
				
			}
			
				
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// add record in DB
		if (request.getParameter("t") != null) {
			String t = request.getParameter("t");
			if (t.equals("add")) {
				// add record in DB
				
				Connection conn = ApmsDao.conn;
				

				try {
					Statement stmt = conn.createStatement();
					String query = "insert into JobProfile(title,descriptions,type_int_fte,CTC,organizations,location,end_date,posted_on,depts,YOG,minimum_cgpa,gender,postedby,attached_doc) values"
							+ "('"+request.getParameter("Title")+"', '"+request.getParameter("descriptions")+"','"+request.getParameter("type_int_fte")+"'"
							+ ","+request.getParameter("CTC")+",'"+request.getParameter("organizations")+"','"+request.getParameter("location")+"',"
							+ "'"+request.getParameter("end_date")+"','"+request.getParameter("posted_on")+"',"
							+ "'"+request.getParameter("depts")+"', "+request.getParameter("YOG")+", "+request.getParameter("ctc")+", '"+request.getParameter("gender")+"'"
							+ ", "+request.getParameter("postedby")+", 8001);";
					
					System.out.println(query);
					int m = stmt.executeUpdate(query);
					if (m==1) {
						response.sendRedirect("/ApmsWebApp/home");
					} 
					else {
						 response.sendRedirect("message?msg_type=1");
					}
					    	
				} catch (Exception e) {
					e.printStackTrace();
					response.sendRedirect("message?msg_type=2");
				}
				
			}
			else if (t.equals("edit")){
				// edit record in DB
				response.sendRedirect("pco/editJobProfile.jsp");
			}
			
				
		}

	}

}
