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

        .error-container {
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
            width: 300px;
            text-align: center;
        }

        .error-container h2 {
            color: #ff0000;
        }

        .error-message {
            color: #ff0000;
            margin-bottom: 20px;
        }

        .back-to-login {
            background-color: #4caf50;
            color: #fff;
            padding: 10px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .back-to-login:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
	<% 
		HttpSession s = request.getSession();
		String name = (String) session.getAttribute("username");

        
        if(name != null){
        	response.sendRedirect("Login.jsp");
        }
	
	%>
	
	<div class="error-container">
    <h2>Login Failed</h2>
    <p class="error-message">Incorrect username or password.</p>
    
	<a href="Login.jsp">Try again</a>
</div>
</body>
</html>