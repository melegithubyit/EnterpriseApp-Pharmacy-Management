package com.melak;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 * Servlet implementation class deleteUserServlet
 */
@WebServlet("/deleteUser")
public class deleteUserServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userID = request.getParameter("id");
		System.out.println(userID);
		String query1 = "delete from users where id = ?";
		String query2 = "delete from medicines where userID = ?";
		String query3 = "delete from transactions where userID = ?";
		DBconfig db = new DBconfig();
        try {
			Connection connection = db.returnConnection();
			PreparedStatement s1 =  connection.prepareStatement(query1);
			PreparedStatement s2 =  connection.prepareStatement(query2);
			PreparedStatement s3 =  connection.prepareStatement(query3);
			
			s1.setInt(1,Integer.parseInt(userID));
			s2.setString(1,userID);
			s3.setString(1,userID);
			
//			s3.executeUpdate();
//			s2.executeUpdate();
			
			s1.executeUpdate();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			request.getRequestDispatcher("AdminUsers.jsp?popup=hidden").forward(request, response);
			
		}
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
