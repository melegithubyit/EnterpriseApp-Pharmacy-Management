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
            width: 300px;
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
<body>
<% 
		HttpSession s = request.getSession();
		
        
	%>
	
	<% 
			
				String email = (String) s.getAttribute("email");
				
				if(email != null){
					response.sendRedirect("Home.jsp");
					return;
				}
			%>
	
	<div class="login-container">
    <h2>Login</h2>
    <form action="/pharmacy/login" method="post">
        <input type="text" class="login-input" name="username" placeholder="Username" required>
        <br>
        <input type="password" class="login-input" name="password" placeholder="Password" required>
        <br>
        <button type="submit" class="login-button">Login</button>
    </form>
	    <div style="font-size: 12px; margin-right: 10px">Don't have an account?<a href="patientRegistration.jsp">Register</a></div>
</div>
</body>
</html>