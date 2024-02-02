<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <style>
		body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }

        .login-container {
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
            width: 400px;
            text-align: center;
        }

        .login-container h2 {
            color: #333;
        }

        .login-input {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        .login-button {
            background-color: #4caf50;
            color: #fff;
            padding: 10px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .login-button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>

<%
HttpSession s = request.getSession();
String username = (String) session.getAttribute("username");
String emailLogged = (String) session.getAttribute("email");
if(username != null){
	response.sendRedirect("Home.jsp");
	return;
}
%>
	<form action="/pharmacy/patientRegistration" class="login-container" method="post">
	<div style="display: flex; align-items: center;">
            <label for="name">First Name:</label>
            <input type="text" class="login-input" id="name" name="firstName" required>
	</div>
	<div style="display: flex; align-items: center;">
            <label for="name">Last Name:</label>
            <input type="text" class="login-input" id="name" name="lastName" required>
	</div>
	<div style="display: flex; align-items: center;">
            <label for="name">Username:</label>
            <input type="text" class="login-input" id="name" name="username" required>
	</div>
	<div style="display: flex; align-items: center;">

            <label for="age">Age:</label>
            <input type="number" class="login-input" id="age" name="age" required>
	</div>
	

<div style="display: flex; align-items: center;">
            <label for="email">Email:</label>
            <input type="text" class="login-input" id="email" name="email" required>
	</div>
	<div style="display: flex; align-items: center;">

            <label for="phone">Country:</label>
            <input type="text" class="login-input" id="phone" name="country" required>
	</div>
<div style="display: flex; align-items: center;">

            <label for="phone">Password:</label>
            <input type="password" class="login-input" id="password" name="password" required>
	</div>


            <button type="submit" class="login-button">Register</button>
        <div>Already have an account?<a href="Login.jsp">Login</a></div>
        </form>
</body>
</html>