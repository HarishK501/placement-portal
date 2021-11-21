package com.apms;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.apms.dao.ApmsDao;
import com.apms.obj.JobProfileObj;

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
				title = " " + rs.getString("title");
				
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
//		String id = request.getParameter("id");
		Connection conn = ApmsDao.conn;
		int StudId=Integer.parseInt(request.getParameter("StudId")); 
		System.out.println(request.getParameter("docSrc"));
		DateFormat df = new SimpleDateFormat("dd/MM/yy HH:mm:ss");
		Date dateobj = new Date();
		String _date = df.format(dateobj) ;
		System.out.println(df.format(dateobj));
		try {
			Statement stmt = conn.createStatement();

			String query1 = "insert into application(student_id,job_id,app_status,applied_on,applicant_review) values ( "+StudId+","+request.getParameter("JobId")+",'Inprogress','"+_date+"','"+request.getParameter("aboutCompany")+"');";
			String query2 = "insert into activities(studentId, activity, date_time) VALUES ("+StudId+", 'Applied for"+request.getParameter("JobTitle")+"', '"+_date+"');";
			String query3 = "insert into studentProfile"; // studentProfile tabel not implemented yet
			
			stmt.addBatch(query1);
			stmt.addBatch(query2);     
			int[] m = stmt.executeBatch();
			if (m[0]==1 && m[1]==1) {
				response.sendRedirect("/ApmsWebApp/applied");				
			} 
			else {
				 response.sendRedirect("message?msg_type=1");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
			response.sendRedirect("message?msg_type=3");	
		}
		
		
		//application , activity , student profile
		
		
	}

}
