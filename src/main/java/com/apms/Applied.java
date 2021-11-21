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
import javax.servlet.http.HttpSession;

import com.apms.dao.ApmsDao;
import com.apms.obj.AppliedObj;

@SuppressWarnings("serial")

@WebServlet(name = "applied", urlPatterns = { "/applied" })

public class Applied extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		int StudId = (int) session.getAttribute("id") ;
		Connection conn = ApmsDao.conn;
		
		try {
			
			ArrayList<AppliedObj> AppliedJob =  new ArrayList<AppliedObj>();
			PreparedStatement query ;
			PreparedStatement query1 ;
			ResultSet rs1;
			
			query = conn.prepareStatement("SELECT * FROM application ;");
			
			ResultSet rs = query.executeQuery();
			int i = 0;
			while ( rs.next()) {
				int Stud_ID  = Integer.parseInt(rs.getString("student_id")) ;
				if(Stud_ID==StudId) {
					String Job_id  = rs.getString("job_id");
					String app_status  = rs.getString("app_status");
					String applied_on  = rs.getString("applied_on");

					query1 = conn.prepareStatement("SELECT * FROM JobProfile where id="+Job_id+";");
					
					rs1 = query1.executeQuery();
					rs1.next();
					String job_title  = rs1.getString("title");
					String company_name  = rs1.getString("organizations");

					AppliedJob.add(
							new AppliedObj(
									Job_id,
									job_title,
									company_name , 
									app_status,
									applied_on
									)
							);
				}
				
				i++;
			}
			
			request.setAttribute("appliedJobs", AppliedJob);
			
			RequestDispatcher rd_stud = request.getRequestDispatcher("stud/applied.jsp");		
			rd_stud.forward(request, response);
			
		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("message?msg_type=2");	
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	

     }
}
