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
import javax.servlet.http.HttpSession;

import com.apms.dao.ApmsDao;

@SuppressWarnings("serial")

@WebServlet(name = "account", urlPatterns = { "/account" })
public class Account extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		
		if (action != null) {
			if (action.equals("change_password")) {
				RequestDispatcher rd = request.getRequestDispatcher("changePassword.jsp");
				rd.forward(request, response);
			}
		} 
		else {
			RequestDispatcher rd = request.getRequestDispatcher("account.jsp");
			rd.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// change password or account details
		String action = request.getParameter("action");
		if (action != null) {
			ApmsDao dao = new ApmsDao();
			Connection conn = dao.getConnection();
			
			if (action.equals("change_password")) {
				String oldPass = request.getParameter("oldpasswd");
				String newPass = request.getParameter("newpasswd");
				
				HttpSession session = request.getSession();
				int id = (int) session.getAttribute("id");
				String user = (String) session.getAttribute("user");
				
				if (user.equals("1")) // change Password for student
				{
					try {
						PreparedStatement query = conn.prepareStatement("select * from Student where id=? and passwd=?");
						query.setInt(1, id);
						query.setString(2, oldPass);
						
						ResultSet rs = query.executeQuery();
						if (rs.next()) {
							query = conn.prepareStatement("update student set passwd=? where id=?");
							query.setString(1, newPass);
							query.setInt(2, id);
							query.executeUpdate();
							response.sendRedirect("message?msg_type=4");	
							
						} else response.sendRedirect("message?msg_type=1");		

					} catch (Exception e) {
						e.printStackTrace();
						response.sendRedirect("message?msg_type=2");
					}
				}
			}
		}
		else {
			response.sendRedirect("message?msg_type=3");
		}
	}

}
