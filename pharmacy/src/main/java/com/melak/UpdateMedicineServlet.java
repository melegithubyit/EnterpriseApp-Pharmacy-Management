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

@WebServlet("/updateMedicine")
public class UpdateMedicineServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
		String id = request.getParameter("id");
		
		
		
		DBconfig db = new DBconfig();
		try {
			Connection conn = db.returnConnection();
			String updateMedicineSQL = "update medicines set title = ?, quantity = ?, description = ?, price = ?, category = ?, dosage = ?, manufacturer = ?, batchNumber = ?, expiryDate = ?, amount = ?, concentration = ? where id = ?"; 
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
			preparedStatement.setString(12, id);
			
			int aff = preparedStatement.executeUpdate();
			System.out.println("Update done....." + aff);
			String path = "MedicineDetail.jsp?edit=false&id=" + id;
			String path2 = "ConfirmUpdate.jsp?edit=false&id=" + id;
			request.getRequestDispatcher(path2).forward(request, response);		
//			request.getRequestDispatcher(path).forward(request, response);
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	

}
