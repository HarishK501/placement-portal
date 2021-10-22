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
		String usr_reg = request.getParameter("reg_no");
		String password = request.getParameter("password");
		String isPco = request.getParameter("isPco");
		
		ApmsDao dao = new ApmsDao();
		Connection conn = dao.getConnection();
		
		HttpSession session = request.getSession();
		
		if (isPco == null) { //student
			try {
				PreparedStatement query = conn.prepareStatement("select * from Student where regNo=? and passwd=?");
				query.setString(1, usr_reg);
				query.setString(2, password);
				
				ResultSet rs = query.executeQuery();
				if (rs.next()) {
					session.setAttribute("user", "1");
					session.setAttribute("id", "18501");
				} 				
			} catch (Exception e) {
				e.printStackTrace();
			}
		} 
		else { //pco
			System.out.println(false);
		}
		
		
		// TODO: Connect to DB and verify credentials
		
//		if (usr_reg.equals("18501") && password.equals("12345")) {
//			session.setAttribute("user", "1");
//			session.setAttribute("id", "18501");
//		} else if (usr_reg.equals("12345") && password.equals("12345")) {
//			session.setAttribute("user", "2");
//			session.setAttribute("id", "12345");
//		}
		
		response.sendRedirect("home");
	}
}
