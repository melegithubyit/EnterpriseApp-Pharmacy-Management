package com.melak;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Statement;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@WebServlet("/search")
public class SearchServlet extends HttpServlet {
	protected void doGet(HttpServletRequest req,
			HttpServletResponse res) throws IOException{
			try {
				
				DBconfig config = new DBconfig();
				Connection connection = config.returnConnection();
				
				System.out.println(req.getParameter("title"));
//				res.sendRedirect("");
			}catch (Exception e) {
				e.printStackTrace();// TODO: handle exception
			}
	}
}
