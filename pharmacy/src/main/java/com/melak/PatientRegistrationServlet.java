package com.melak;

import java.io.IOException;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/patientRegistration")


public class PatientRegistrationServlet extends HttpServlet  {
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException{
			
			System.out.println("the servlet is called");
			DBconfig db = new  DBconfig();
			try {
				Connection conn = db.returnConnection();
				String username = req.getParameter("username");
				String firstName =  req.getParameter("firstName");
				String lastName = req.getParameter("lastName");
				Integer age = Integer.parseInt(req.getParameter("age"));
				
				String gender = req.getParameter("gender");
				String email =  req.getParameter("email");
				String country = req.getParameter("country");
				String password = req.getParameter("password");
				
				String createPatientSQL = "insert into users (username, password, first_name, email , last_name, country, age, admin) values (?,?,?,?,?,?,?,?)";
				
				PreparedStatement preparedStatement = conn.prepareStatement(createPatientSQL);
				
				preparedStatement.setString(1, username);
	            preparedStatement.setString(2, password);
	            preparedStatement.setString(3, firstName);
	            preparedStatement.setString(4, email);
	            preparedStatement.setString(5, lastName);
	            preparedStatement.setString(6, country);
	            preparedStatement.setInt(7, age);
	            preparedStatement.setBoolean(8, false);
	            
	            preparedStatement.executeUpdate();
				res.sendRedirect("registrationComplete.jsp");
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}
	
}
