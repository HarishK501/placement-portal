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


@WebServlet("/login")
public class Login extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String p = request.getParameter("p");
		
		ApmsDao dao = new ApmsDao();
		Connection conn = dao.getConnection();
		
		HttpSession session = request.getSession();
		
		if (p.equals("1")) { //student
			try {
				String usr_reg = request.getParameter("reg_no");
				String password = request.getParameter("password");
				
				PreparedStatement query = conn.prepareStatement("select * from Student where regNo=? and passwd=?");
				query.setString(1, usr_reg);
				query.setString(2, password);
				
				ResultSet rs = query.executeQuery();
				if (rs.next()) {
					session.setAttribute("user", "1");
					session.setAttribute("id", rs.getInt(1));
					response.sendRedirect("home");
				} else response.sendRedirect("message?msg_type=1");		
			} catch (Exception e) {
				e.printStackTrace();
				response.sendRedirect("message?msg_type=2");
			}
		} 
		else { //pco
			try {
				String email = request.getParameter("email");
				String password = request.getParameter("password");
				
				PreparedStatement query = conn.prepareStatement("select * from coordinator where email=? and passwd=?");
				query.setString(1, email);
				query.setString(2, password);
				
				ResultSet rs = query.executeQuery();
				if (rs.next()) {
					session.setAttribute("user", "2");
					session.setAttribute("id", rs.getInt(1));
					response.sendRedirect("home");
				} else response.sendRedirect("message?msg_type=1");
			} catch (Exception e) {
				e.printStackTrace();
				response.sendRedirect("message?msg_type=2");
			}
		}
	}
}
