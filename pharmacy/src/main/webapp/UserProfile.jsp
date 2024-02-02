<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.melak.DBconfig"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
         body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 120px 0px;
            
            
        }

        .registration-form {
            max-width: 600px;
            margin: 0 auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            
            
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-group label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
        }

        .form-group input {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }

        .form-group.checkbox {
            grid-column: span 2;
        }

        .form-group input[type="submit"] {
            grid-column: span 2;
            background-color: #4CAF50;
            color: white;
            cursor: pointer;
        }

        .form-group input[type="submit"]:hover {
            background-color: #45a049;
        }
                nav {
            display: flex;
            justify-content: space-between;
            background-color: #333;
            gap: 15px;
        }

        nav a {
            color: white;
            text-decoration: none;
            font-size: 18px;
            padding: 6px;
            border-radius: 3px;
            
        }

        nav a:hover {
            background-color: #555;
        }
    </style>
<body>
	<%
		DBconfig db = new DBconfig();
		Connection conn = db.returnConnection();
		HttpSession s = request.getSession();
		String username = (String) session.getAttribute("username");
		String userQuery = "select * from users where id = " + session.getAttribute("userID");
		Statement statement = conn.createStatement();
		ResultSet result = statement.executeQuery(userQuery);
		result.next();
		String email = result.getString("email");
		String password = result.getString("password");
		String age =  result.getString("age");
		String first_name =  result.getString("first_name");
		String last_name =  result.getString("last_name");
		String country =  result.getString("country");
		
		
	%>
		
		<header style="background:  #333;  position: fixed; width: 100%; top:0px;">
	<section style="display: flex; justify-content: space-between; align-items: center;  margin: 10px 40px">
			
		
		<div style="color: white; display: flex; align-items: center; gap: 10px;">
			<img alt="person" src="https://images.pexels.com/photos/614810/pexels-photo-614810.jpeg?auto=compress&cs=tinysrgb&w=600" width="60px" height="60px" style="border-radius: 50%">
			<section><%= email %></section>
		</div>
			
		<nav >
        	
        	<a href="/pharamcy/Transactions.jsp">Transactions</a>
        	<a href="/pharmacy/logout">Logout</a>
        	
    	</nav>
	</section>
	</header>
		<div class="registration-form">
        <h2>User Profile Form</h2>
        <form action="/pharmacy/UpdateUser" method="post" >
        <div style="display: grid; grid-template-columns: repeat(2, 1fr); grid-gap: 20px;">
        <section>
            <div class="form-group">
                <label for="username" >Username:</label>
                <input type="text" name="username" value="<%= username   %>" required>
            </div>
            <div class="form-group">
                <label for="email" >Email:</label>
                <input type="email" name="email" value="<%= email  %>" required>
            </div>
        	<div class="form-group">
                <label for="password">New Password:</label>
                <input type="password" name="password"  required>
            </div>
            <div class="form-group">
                <label for="age">Age:</label>
                <input type="number" name="age" value="<%=age%>" required>
            </div>
            
        </section>
        <section>
			<div class="form-group">
                <label for="first_name">First Name:</label>
                <input type="text" name="first_name" value="<%= first_name%>" required>
            </div>
            <div class="form-group">
                <label for="last_name" >Last Name:</label>
                <input type="text" name="last_name" value="<%= last_name%>" required>
            </div>
            <div class="form-group">
                <label for="country">Country:</label>
                <input type="text" name="country" value="<%= country%>" required>
            </div>
            
        
        </section>
        </div>
            <div class="form-group">
                <input type="submit" value="Save">
            </div>
        </form>
    </div>
</body>
</html>