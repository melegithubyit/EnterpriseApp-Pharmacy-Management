package com.melak;


import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@WebServlet("/purchase")
public class PurchaseServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		String userID = request.getParameter("userID");
		String medicineID = request.getParameter("medicineID");
		System.out.println(medicineID);
		DBconfig db = new DBconfig();
		try {
			Connection conn = db.returnConnection();
			String query = "select * from medicines where id = ?";
			PreparedStatement statement1 = conn.prepareStatement(query);
			statement1.setString(1, medicineID);
			
			ResultSet res = statement1.executeQuery();
			res.next();
			int amount = res.getInt("amount");
			String title = res.getString("title");
			String manufacturer = res.getString("manufacturer");
			
			String query4 = "select * from users where id = ?";
			PreparedStatement statement4 = conn.prepareStatement(query4);
			statement4.setString(1, userID);
			
			ResultSet res2 = statement4.executeQuery();
			res2.next();
			String firstName = res2.getString("first_name");
			String lastName = res2.getString("last_name");
			String username = res2.getString("username");
			String email = res2.getString("email");
			
			System.out.println(amount);
			System.out.println("-----------------");
			String query2 = "update medicines set amount = ? where id = ?";
			PreparedStatement statement2 = conn.prepareStatement(query2);
			int newAmount = amount - 1;
			statement2.setInt(1, newAmount);
			statement2.setString(2, medicineID);
			
			int affected = statement2.executeUpdate();
			System.out.println(affected);
			System.out.println("-----------------");
			
			String query3 = "insert into transactions (userID, medicineID, date, medicine_title, first_name, last_name, username, email, manufacturer) values (?,?,?,?,?,?,?,?,?)";
			
			PreparedStatement statement3 = conn.prepareStatement(query3);
			statement3.setString(1, userID);
			statement3.setString(2, medicineID);
			statement3.setString(3, userID);
			statement3.setString(4, title);
			statement3.setString(5, firstName);
			statement3.setString(6, lastName);
			statement3.setString(7, username);
			statement3.setString(8, email);
			statement3.setString(9, manufacturer);
			
			statement3.executeUpdate();
			
			response.sendRedirect("/pharmacy/Home.jsp");
			
			
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
