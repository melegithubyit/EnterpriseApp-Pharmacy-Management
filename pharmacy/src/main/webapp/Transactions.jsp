<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
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
            margin: 0;
            
            background-color: #f4f4f4;
        }

        table {
       	 	margin: 5px;
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        h2{
			margin: 5px;
            margin-top: 100px;
            margin-bottom: 20px;
        }
        th, td {
            padding: 6px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #4CAF50;
            color: white;
        }

        tr:hover {
            background-color: #f5f5f5;
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
		HttpSession s = request.getSession();
		Integer userID = (Integer) session.getAttribute("userID");	
		String transactionEmail = (String) session.getAttribute("email");
	%>
	<header style="background:  #333;  position: fixed; width: 100%; top:0px;">
	<section style="display: flex; justify-content: space-between; align-items: center;  margin: 10px 40px">
			
		
		<div style="color: white; display: flex; align-items: center; gap: 10px;">
			<img alt="person" src="https://images.pexels.com/photos/614810/pexels-photo-614810.jpeg?auto=compress&cs=tinysrgb&w=600" width="60px" height="60px" style="border-radius: 50%">
			<section><%= transactionEmail %></section>
		</div>
			
		<nav >
        	
        	<a href="/pharmacy/UserProfile.jsp">Profile</a>
        	<a href="/pharmacy/logout">Logout</a>
    	</nav>
	</section>
	</header>
	<h2>
	
		Transactions
	
	</h2>
	<table>
        <thead>
            <tr>
                <th>Medicine Title</th>
                <th>Manufacturer</th>
                <th>User Name</th>
                <th>Email</th>
                <th>Full Name</th>
                <th>Detail</th>
            </tr>
        </thead>
        <tbody style="background-color: #ebebeb;">
        	 <% 
        	 int count = 0;
        DBconfig db = new DBconfig();
        Connection connection = db.returnConnection();
        Statement statement = connection.createStatement();
        String query = "SELECT * FROM transactions where userID = " + userID;
        ResultSet res = statement.executeQuery(query);
    
        while (res.next()) {
        	count ++;
            int id = res.getInt("id");
            String username = res.getString("username");
            String first_name = res.getString("first_name");
            String last_name = res.getString("last_name");
            String email = res.getString("email");
            String medicine_title = res.getString("medicine_title");
            String date = res.getString("date");
            String medicineID = res.getString("medicineID");
            String manufacturer = res.getString("manufacturer");
            

    %>
            <tr>
                <td><%= medicine_title %></td>
                <td><%= manufacturer %></td>
                <td><%= username %></td>
                <td><%= email %></td>
                <td><%= first_name %> <%= last_name %></td>
                <td> <a href="/pharmacy/MedicineDetail.jsp?id=<%=medicineID %>">Here</a></td>
            </tr>
            <%
        }
        // Close resources (ideally in a 'finally' block)
        res.close();
        statement.close();
        connection.close();
    %>
            
            <!-- Add more rows as needed -->
        </tbody>
    </table>
    
    <% 
    	if(count == 0){
    		
    	
    %>
    
    <div style="text-align: center;">No transactions found.</div>
    <%
    	}
    %>
</body>
</html>