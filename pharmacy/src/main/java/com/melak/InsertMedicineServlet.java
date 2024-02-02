package com.melak;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet("/insertMedicine")
public class InsertMedicineServlet extends HttpServlet {


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		System.out.println("medicine is inserted");
		
		
		HttpSession s = request.getSession();
		Integer userID = (Integer) s.getAttribute("userID");
		System.out.println(userID);
		String title = request.getParameter("title");
		String expiryDate = request.getParameter("expiryDate");
		String quantity = request.getParameter("quantity");
		String price = request.getParameter("price");
		
		String concentration = request.getParameter("concentration");
		String description = request.getParameter("description");
		
		String amount = request.getParameter("amount");
		String category = request.getParameter("category");
		String batchNumber = request.getParameter("batchNumber");
		String dosage = request.getParameter("dosage");
		String manufacturer = request.getParameter("manufacturer");
		
		
		
		
		DBconfig db = new DBconfig();
		try {
			Connection conn = db.returnConnection();
			String updateMedicineSQL = "insert into medicines (title, quantity, description, price, category, dosage, manufacturer, batchNumber, expiryDate, amount, concentration, userID) values (? , ? , ? , ? , ? , ? , ? , ? , ? , ? , ?, ?)"; 
			PreparedStatement preparedStatement = conn.prepareStatement(updateMedicineSQL);
			preparedStatement.setString(1, title);
            preparedStatement.setString(2, quantity);
            preparedStatement.setString(3, description);
			preparedStatement.setString(4, price);
			preparedStatement.setString(5, category);
			preparedStatement.setString(6, dosage);
			preparedStatement.setString(7, manufacturer);
			preparedStatement.setString(8, batchNumber);
			preparedStatement.setString(9, expiryDate);
			preparedStatement.setString(10, amount);
			preparedStatement.setString(11, concentration);
			preparedStatement.setInt(12, userID);
			
			int aff = preparedStatement.executeUpdate();
			
			request.getRequestDispatcher("AdminMedicine.jsp").forward(request, response);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
