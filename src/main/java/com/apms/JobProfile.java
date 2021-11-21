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
import javax.servlet.http.HttpSession;

import com.apms.dao.ApmsDao;
import com.apms.obj.ApplicationObj;
import com.apms.obj.JobProfileObj;

import java.sql.Statement;
import java.util.ArrayList;
@SuppressWarnings("serial")

@WebServlet(name = "jobProfile", urlPatterns = { "/jobProfile" })

public class JobProfile extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if (request.getParameter("t") != null) {
			Connection conn = ApmsDao.conn;
			PreparedStatement query;
			ResultSet rs;
			PreparedStatement query1;
			ResultSet rs1;
			PreparedStatement query2;
			ResultSet rs2;
			String t = request.getParameter("t");
			if (t.equals("add")) {
				response.sendRedirect("pco/addJobProfile.jsp");
			} 
			else if (t.equals("view_all")) {
				RequestDispatcher rd = request.getRequestDispatcher("all_jobProfiles.jsp");
				
				ArrayList<JobProfileObj> jobProfiles = new ArrayList<JobProfileObj>();
				try {
					query = conn.prepareStatement("SELECT * FROM JobProfile ORDER BY end_date DESC");
					rs = query.executeQuery();
					while (rs.next()) {
						jobProfiles.add(
								new JobProfileObj(
										rs.getInt("id"),
										rs.getString("title"), 
										rs.getString("organizations"),
										rs.getString("location"), 
										rs.getString("end_date")
										)
								);
					}
					
					request.setAttribute("jobProfiles", jobProfiles);
					
				} catch (SQLException e) {
					e.printStackTrace();
				}
				rd.forward(request, response);
			}
			else if (t.charAt(0)=='e'){ //edit Job Profile
				String id= t.substring(5);
				try {
					query = conn.prepareStatement("SELECT * FROM jobprofile WHERE id="+id+";");
					rs = query.executeQuery();
					JobProfileObj profile = null ; 
					
					while ( rs.next() ) {
						
						profile = new JobProfileObj(										
								        rs.getInt("id"),
										rs.getString("title"), 
										rs.getString("descriptions"), 
										rs.getString("type_int_fte"),
										rs.getDouble("CTC"),
										rs.getString("organizations"),
										rs.getString("location"),
										rs.getString("end_date"),
										rs.getString("posted_on"),
										rs.getString("depts"),
										rs.getInt("YOG"),
										rs.getDouble("minimum_cgpa"),
										rs.getString("gender"),
										rs.getInt("postedby"),
										rs.getInt("attached_doc")
										);
								
					}
					
					request.setAttribute("jobprofile", profile );
					
				} catch (SQLException e) {
					e.printStackTrace();
				}
				
				RequestDispatcher rd_stud = request.getRequestDispatcher("pco/editJobProfile.jsp");		
				rd_stud.forward(request, response);
				
			}
			else if (t.charAt(0)=='v'){
				RequestDispatcher rd = request.getRequestDispatcher("viewapplications.jsp");
				String id= t.substring(5);
				System.out.println(id);
				ArrayList<ApplicationObj> applicationdata = new ArrayList<ApplicationObj>();
				try {
					query = conn.prepareStatement("SELECT * FROM application where job_id="+Integer.parseInt(id)+";");
					System.out.println(query);
					rs = query.executeQuery();
					while (rs.next()) {
						query1 = conn.prepareStatement("SELECT * FROM Student where id=?;");
						query1.setInt(1, rs.getInt("student_id"));
						System.out.println(query1);
						rs1 = query1.executeQuery();
						rs1.next();
						query2 = conn.prepareStatement("SELECT app_status FROM application where student_id="+rs.getInt("student_id")+";");
						rs2 = query2.executeQuery();
						System.out.println(query2);
						rs2.next();
						applicationdata.add(
								new ApplicationObj(
										rs1.getString("regNo"),
										rs1.getString("email"), 
										rs1.getString("fullname"),
										rs1.getString("phone"), 
										rs1.getString("dept"),
										rs1.getString("gender"),
										rs1.getString("section"),
										rs2.getString("app_status")
										
										)
								);
					}
					query = conn.prepareStatement("SELECT * FROM JobProfile where id="+Integer.parseInt(id)+";");
					rs = query.executeQuery();
					rs.next();
					
					request.setAttribute("title", rs.getString("title"));
					request.setAttribute("applications", applicationdata);
				} catch (SQLException e) {
					e.printStackTrace();
				}
				rd.forward(request, response);
			}
			else if(t.charAt(0)=='d'){
				String id= t.substring(7);
				String sql = "DELETE FROM jobprofile WHERE id = "+id ;
				System.out.println(sql);
				try {
					query =conn.prepareStatement(sql);
					query.execute();
					response.sendRedirect("/ApmsWebApp/home");
				} catch (SQLException e) {
					System.out.println("error while deleting JobProfile");
					e.printStackTrace();
				}
				
			}
			else if (t.charAt(0)=='p'){ //post interview
				String id= t.substring(5);
				try {
					query = conn.prepareStatement("SELECT * FROM jobprofile WHERE id="+id+";");
					rs = query.executeQuery();
					JobProfileObj profile = null ; 
					
					while ( rs.next() ) {
						
						profile = new JobProfileObj(										
								        rs.getInt("id"),
										rs.getString("title"), 
										rs.getString("descriptions"), 
										rs.getString("type_int_fte"),
										rs.getDouble("CTC"),
										rs.getString("organizations"),
										rs.getString("location"),
										rs.getString("end_date"),
										rs.getString("posted_on"),
										rs.getString("depts"),
										rs.getInt("YOG"),
										rs.getDouble("minimum_cgpa"),
										rs.getString("gender"),
										rs.getInt("postedby"),
										rs.getInt("attached_doc")
										);
								
					}
					
					request.setAttribute("jobprofile", profile );
					
				} catch (SQLException e) {
					e.printStackTrace();
				}
				RequestDispatcher rd_stud = request.getRequestDispatcher("pco/postInterview.jsp");		
				rd_stud.forward(request, response);}
				
			else {//job-id
				request.removeAttribute("jobprofile");
				
				try {
					query = conn.prepareStatement("SELECT * FROM jobprofile WHERE id="+t+";");
					rs = query.executeQuery();
					JobProfileObj profile = null ; 
					
					while ( rs.next() ) {
						
						profile = new JobProfileObj(										
								        rs.getInt("id"),
										rs.getString("title"), 
										rs.getString("descriptions"), 
										rs.getString("type_int_fte"),
										rs.getDouble("CTC"),
										rs.getString("organizations"),
										rs.getString("location"),
										rs.getString("end_date"),
										rs.getString("posted_on"),
										rs.getString("depts"),
										rs.getInt("YOG"),
										rs.getDouble("minimum_cgpa"),
										rs.getString("gender"),
										rs.getInt("postedby"),
										rs.getInt("attached_doc")
										);
								
					}
					
					int flag=0;
					HttpSession session = request.getSession();
					int Id =  (int) session.getAttribute("id") ;
					 
					if( Id < 2000 ) {
						
						query = conn.prepareStatement("SELECT * FROM application WHERE student_id="+Id+";");
						rs = query.executeQuery();
						while ( rs.next() ) {
							 
							 if( t.equals(rs.getString("job_id" ))  ) {
								 
								 flag=1;
							 }						   			
						}
					}
					
					request.setAttribute("applied?", flag );
					request.setAttribute("jobprofile", profile );
					
				} catch (SQLException e) {
					e.printStackTrace();
				}
				
//				response.sendRedirect("/ApmsWebApp/home");
				RequestDispatcher rd_stud = request.getRequestDispatcher("jobProfile.jsp");		
				rd_stud.forward(request, response);
				
			}
			
				
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// add record in DB
		if (request.getParameter("t") != null) {
			String t = request.getParameter("t");
			Connection conn = ApmsDao.conn;
			
			if (t.equals("add")) {
				// add record in DB

				try {
					Statement stmt = conn.createStatement();
					String query = "insert into JobProfile(title,descriptions,type_int_fte,CTC,organizations,location,end_date,posted_on,depts,YOG,minimum_cgpa,gender,postedby,attached_doc) values"
							+ "('"+request.getParameter("Title")+"', '"+request.getParameter("descriptions")+"','"+request.getParameter("type_int_fte")+"'"
							+ ","+request.getParameter("CTC")+",'"+request.getParameter("organizations")+"','"+request.getParameter("location")+"',"
							+ "'"+request.getParameter("end_date")+"','"+request.getParameter("posted_on")+"',"
							+ "'"+request.getParameter("depts")+"', "+request.getParameter("YOG")+", "+request.getParameter("cgpa")+", '"+request.getParameter("gender")+"'"
							+ ", "+request.getParameter("postedby")+", 8001);";
					

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
				
				try {
					Statement stmt = conn.createStatement();
					
					String query= "UPDATE JobProfile set title='"+request.getParameter("Title")+"' ,"
					+ "descriptions='"+request.getParameter("descriptions")+"' , "
					+ "type_int_fte='"+request.getParameter("type_int_fte")+"' ,CTC="+request.getParameter("CTC")+" ,"
					+ "organizations='"+request.getParameter("organizations")+"' "
					+ ",location='"+request.getParameter("location")+"' ,end_date='"+request.getParameter("end_date")+"' "
					+ ",posted_on='"+request.getParameter("posted_on")+"' ,depts='"+request.getParameter("depts")+""
					+ "' ,YOG="+request.getParameter("YOG")+" ,minimum_cgpa="+request.getParameter("cgpa")+" ,"
					+ "gender='"+request.getParameter("gender")+"' "
					+"Where id="+request.getParameter("id")+";";
					
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
				
				//response.sendRedirect("/ApmsWebApp/home");
				
			}
			else if(t.equals("post"))
			{
				try {
					Statement stmt = conn.createStatement();
					String query = "insert into interviews(student_id,job_id,ondate,ontime,interview_status) values"
							+ "('"+request.getParameter("rollno")+"', '"+request.getParameter("jobid")+"','"+request.getParameter("date")+"','"+
							request.getParameter("time")+" ', '"+" Pending');";
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
			
			
				
		}

	}

}
