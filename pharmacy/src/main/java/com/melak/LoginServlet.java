package com.melak;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		PrintWriter out = res.getWriter();	
		String userName = req.getParameter("username");
		String password = req.getParameter("password");
		DBconfig config = new DBconfig();
		Connection conn;
		try {
			conn = config.returnConnection();
			String getUserSQL = "select * from users where username=? and password=?"; 
			PreparedStatement preparedStatement = conn.prepareStatement(getUserSQL);
//		(name, password, email) values (?,?,?)";
			preparedStatement.setString(1, userName);
			preparedStatement.setString(2, password);
			
			ResultSet result = preparedStatement.executeQuery();
			int count = 0;
			while(result.next()) {
				count ++;
			}
			System.out.println(count);
			if(count != 0) {
				ResultSet result2 = preparedStatement.executeQuery();
				result2.next();
				String name2 = result2.getString("username");
				String email = result2.getString("email");
				Boolean admin = result2.getBoolean("admin");
				Integer userID = result2.getInt("id");
				
				HttpSession session = req.getSession();
				session.setAttribute("username", name2);
				session.setAttribute("admin", admin);
				session.setAttribute("email", email);
				session.setAttribute("userID", userID);
				
				System.out.println(admin);
				System.out.println(name2);
				if(!admin) {
					req.getRequestDispatcher("Home.jsp").forward(req, res);
					return;
				}else {
//					res.sendRedirect("index.jsp");
					req.getRequestDispatcher("Admin.jsp").forward(req, res);
					return;
				}
			}else {
//				res.sendRedirect("LoginFailed.jsp");
				res.sendRedirect("LoginFailed.jsp");
				
				return;
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}
}
