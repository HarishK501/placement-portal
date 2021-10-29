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
import com.apms.obj.InterviewObj;


@SuppressWarnings("serial")
@WebServlet(name = "interviews", urlPatterns = { "/interviews" })
public class Interviews extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			HttpSession session = request.getSession();
		
			Connection conn = ApmsDao.conn;
			
			PreparedStatement query;
			PreparedStatement query1;
			ResultSet rs;
			ResultSet rs1;
			ArrayList<InterviewObj> interviews = new ArrayList<InterviewObj>(10);
			query = conn.prepareStatement("select * from interviews where student_id=?");
			query.setInt(1, (int)(session.getAttribute("id")));			
			rs = query.executeQuery();
			while (rs.next()) {
				query1 = conn.prepareStatement("select * from JobProfile where id=?");
				query1.setInt(1, rs.getInt("job_id"));
				rs1 = query1.executeQuery();
				rs1.next();
				interviews.add(
						new InterviewObj(
								rs1.getString("title"),
								rs1.getString("organizations"),
								rs.getString("ondate"),
								rs.getString("ontime"),
								rs.getString("interview_status")
								)
								
						);
			}
			
			request.setAttribute("interviews", interviews);
			
			RequestDispatcher rd = request.getRequestDispatcher("stud/interviews.jsp");
			rd.forward(request, response);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
