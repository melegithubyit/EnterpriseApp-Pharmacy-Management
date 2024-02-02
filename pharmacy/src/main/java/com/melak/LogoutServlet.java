package com.melak;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet("/logout")
public class LogoutServlet extends HttpServlet   {
public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
	HttpSession s = req.getSession();
	s.removeAttribute("name");
	s.removeAttribute("email");
	res.sendRedirect("Login.jsp");
		
	}
}
