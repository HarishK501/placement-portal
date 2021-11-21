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


import com.apms.dao.ApmsDao;
import com.apms.obj.*;

@SuppressWarnings("serial")
@WebServlet(name = "placements", urlPatterns = { "/placements" })
public class Placements extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher("pco/placement_info.jsp");
		
		Connection conn = ApmsDao.conn;
//		HttpSession session = request.getSession();
		PreparedStatement query;
		ResultSet rs, rs1, rs2;
		int m=0, n=0;
		
		
		ArrayList<PlacementObj> placementObj1 = new ArrayList<PlacementObj>();
		try {
			query = conn.prepareStatement("SELECT * FROM JobProfile ORDER BY end_date DESC");
			rs = query.executeQuery();
			while (rs.next()) {
				// select from applications
				query = conn.prepareStatement("SELECT count(*) FROM Application where job_id=?");
				query.setInt(1, rs.getInt("id"));
				
				rs1 = query.executeQuery();
				if (rs1.next()) {
					m = rs1.getInt(1);
					query = conn.prepareStatement("SELECT count(*) FROM Application where job_id=? and app_status=?");
					query.setInt(1, rs.getInt("id"));
					query.setString(2, "offered");
					
					rs2 = query.executeQuery();
					if (rs2.next()) {
						n = rs2.getInt(1);
					}
				}
				
				placementObj1.add(
						new PlacementObj(
								rs.getInt("id"),
								rs.getString("title"), 
								rs.getString("organizations"),
								m, 
								n
								)
						);
			}
			
			request.setAttribute("jobProfilesInfo", placementObj1);
			
			query = conn.prepareStatement("SELECT count(*) FROM Student");
			rs = query.executeQuery();
			rs.next();
			m = rs.getInt(1);
			
			query = conn.prepareStatement("SELECT count(*) FROM Student where isPlaced=TRUE");
			rs = query.executeQuery();
			rs.next();
			n = rs.getInt(1);
			
			m = 100 * (m-n) / m;
			
			request.setAttribute("notPlacedPercent", ""+m);
			
			query = conn.prepareStatement("SELECT count(*) FROM Student where dept='CSE'");
			rs = query.executeQuery();
			rs.next();
			m = rs.getInt(1);
			request.setAttribute("cseStrength", ""+m);
			
			query = conn.prepareStatement("SELECT count(*) FROM Student where isPlaced=TRUE and dept='CSE'");
			rs = query.executeQuery();
			rs.next();
			n = rs.getInt(1);
			request.setAttribute("csePlaced", ""+n);
			
			query = conn.prepareStatement("SELECT count(*) FROM Student where dept='ECE'");
			rs = query.executeQuery();
			rs.next();
			m = rs.getInt(1);
			request.setAttribute("eceStrength", ""+m);
			
			query = conn.prepareStatement("SELECT count(*) FROM Student where isPlaced=TRUE and dept='ECE'");
			rs = query.executeQuery();
			rs.next();
			n = rs.getInt(1);
			request.setAttribute("ecePlaced", ""+n);
			
			query = conn.prepareStatement("SELECT count(*) FROM Student where dept='EEE'");
			rs = query.executeQuery();
			rs.next();
			m = rs.getInt(1);
			request.setAttribute("eeeStrength", ""+m);
			
			query = conn.prepareStatement("SELECT count(*) FROM Student where isPlaced=TRUE and dept='EEE'");
			rs = query.executeQuery();
			rs.next();
			n = rs.getInt(1);
			request.setAttribute("eeePlaced", ""+n);
			
			query = conn.prepareStatement("SELECT count(*) FROM Student where dept='MEC'");
			rs = query.executeQuery();
			rs.next();
			m = rs.getInt(1);
			request.setAttribute("mecStrength", ""+m);
			
			query = conn.prepareStatement("SELECT count(*) FROM Student where isPlaced=TRUE and dept='MEC'");
			rs = query.executeQuery();
			rs.next();
			n = rs.getInt(1);
			request.setAttribute("mecPlaced", ""+n);
			
			rd.forward(request, response);
			
		} catch (SQLException e) {
			e.printStackTrace();
			response.sendRedirect("message?msg_type=2");
		}
		
	}

}
