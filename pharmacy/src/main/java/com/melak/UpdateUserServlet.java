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
@WebServlet("/UpdateUser")
public class UpdateUserServlet extends HttpServlet  {
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		String userName = req.getParameter("username");
		String password = req.getParameter("password");
		String email = req.getParameter("email");
		String first_name = req.getParameter("first_name");
		String last_name = req.getParameter("last_name");
		String country = req.getParameter("country");
		String age = req.getParameter("age");
		HttpSession s = req.getSession();
		Integer userID = (Integer) s.getAttribute("userID");
		DBconfig config = new DBconfig();
		Connection conn;
		try {
			conn = config.returnConnection();
			String getUserSQL = "update users set first_name = ?, last_name = ?, email = ?, username = ?, country = ?, age = ?, password = ? where id = ?"; 
			PreparedStatement preparedStatement = conn.prepareStatement(getUserSQL);
			preparedStatement.setString(1, first_name);
            preparedStatement.setString(2, last_name);
            preparedStatement.setString(3, email);
			preparedStatement.setString(4, userName);
			preparedStatement.setString(5, country);
			preparedStatement.setString(6, age);
			preparedStatement.setString(7, password);
			preparedStatement.setInt(8, userID);
			s.setAttribute("username", userName);
			s.setAttribute("email", email);
			
			preparedStatement.executeUpdate();
			RequestDispatcher dispatcher = req.getRequestDispatcher("/Home.jsp");
			dispatcher.forward(req, res);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}
