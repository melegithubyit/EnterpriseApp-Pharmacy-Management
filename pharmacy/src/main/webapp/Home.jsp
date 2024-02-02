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
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
            color: #333;
        }

        .intro {
            background-color: #4CAF50;
            
            text-align: center;
            color: white;
            
            margin-top: 70px;
            
        }

        .main_content {
            max-width: 800px;     
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h1 {
            color: #4CAF50;
        }

        p {
            line-height: 1.6;
        }

        footer {
            text-align: center;
            padding: 1em;
            background-color: #4CAF50;
            color: white;

        }
        .main{
        	padding: 100px 10px;
        	display: flex;
        	justify-content: center;
        	align-items: center;
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
	<header style="background:  #333;  position: fixed; width: 100%; top:0px;">
	<section style="display: flex; justify-content: space-between; align-items: center;  margin: 10px 40px">
			<% 
				HttpSession s = request.getSession();
				String username = (String) session.getAttribute("username");
				String email = (String) session.getAttribute("email");
				
				if(email == null){
					response.sendRedirect("Login.jsp");
					return;
				}
			%>
		
		<div style="color: white; display: flex; align-items: center; gap: 10px;">
			<section><%= email %></section>
		</div>
			
		<nav >
        	<a href="/pharmacy/Transactions.jsp">Transactions</a>
        	<a href="/pharmacy/UserProfile.jsp">Profile</a>
        	<a href="/pharmacy/logout">Logout</a>
    	</nav>
	</section>
	</header>
			
	<div class="int" style="background-color: #4CAF50; margin-top: 73px; height: 250px; display: flex; flex-direction: column; align-items: center; justify-content: center">
        <section style="color: white; display: flex; align-items: center; justify-content: center; font-size: 50px; font-weight: bold">Welcome, <%= username %></section>
        <p style="color: white">Your trusted source for pharmaceuticals!</p>
    </div>
	<main  class="main">
	    <section class="main_content">
	    	
			
    	    <h2>Pharmacy Online</h2>
    	    
        	<p>
            	Welcome to our online pharmacy management platform! We are dedicated to making your medication purchasing experience as convenient and accessible as possible. Our user-friendly website offers a wide selection of prescription and over-the-counter medications, ensuring that you can easily find the products you need. With our secure and trusted partnerships with licensed pharmacies, you can have peace of mind knowing that the medications you purchase are of the highest quality and authenticity.
        	</p>
        	<section style="background-color: #4CAF50;cursor: pointer; width: 50px; text-align: center; padding: 10px 15px; border-radius: 10px" > <a href="/pharmacy/Medicines.jsp" style="text-decoration: none; color: white; letter-spacing: 1px">Visit</a> </section>
    	</section>
	</main>

    <footer>
        &copy; 2022 Pharmacy Online. All rights reserved.
    </footer>
</body>
</html>