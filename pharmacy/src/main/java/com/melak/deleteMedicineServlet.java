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
@WebServlet("/deleteMedicine")
public class deleteMedicineServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String id = request.getParameter("id");
		
		String query2 = "delete from medicines where id = ?";
		DBconfig db = new DBconfig();
        try {
			Connection connection = db.returnConnection();
			PreparedStatement s2 =  connection.prepareStatement(query2);
			
			s2.setInt(1,Integer.parseInt(id));
			
			
			s2.executeUpdate();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			request.getRequestDispatcher("AdminMedicine.jsp").forward(request, response);
			
		}
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}


	

}
