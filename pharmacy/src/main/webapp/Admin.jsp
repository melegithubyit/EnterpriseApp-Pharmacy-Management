<%@page import="java.sql.PreparedStatement"%>
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
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
        }

        .dashboard-container {
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
            width: 800px;
            text-align: center;
        }

        .dashboard-container h2 {
            color: #333;
        }

        .statistics-section {
            margin-top: 20px;
            display: flex;
            justify-content: space-around;
        }

        .statistic-box {
            background-color: #f2f2f2;
            padding: 20px;
            border-radius: 8px;
            flex: 1;
            margin: 0 10px;
            
            transition: box-shadow 0.3s ease;
        }
        
        .statistic-box:hover{
           box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2); 
        }

        .recent-activities-section {
            margin-top: 20px;
        }

        .activity-list {
            list-style: none;
            padding: 0;
            text-align: left;
        }

        .activity-item {
            border-bottom: 1px solid #ddd;
            padding: 10px;
            margin: 0;
        }

        .activity-item:last-child {
            border-bottom: none;
        }

        .user-list-section {
            margin-top: 20px;
        }

        .user-list {
            list-style: none;
            padding: 0;
            text-align: left;
        }

        .user-item {
            border-bottom: 1px solid #ddd;
            padding: 10px;
            margin: 0;
        }

        .user-item:last-child {
            border-bottom: none;
        }
        
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 5px;
            background-color: #f4f4f4;
        }

        table {
            width: 100%;
            border-collapse: collapse;
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
        
        .display_data{
        	color: #4CAF50;
        }
    </style>
<body>
	<% 
		HttpSession s = request.getSession();
		String adminUsername= (String) session.getAttribute("username");	
        DBconfig db = new DBconfig();
        Connection connection = db.returnConnection();
	%>
	
	<% 
			
				Boolean admin = (Boolean) session.getAttribute("admin");
				
				if(!admin){
					response.sendRedirect("Home.jsp");
					return;
				}
			%>
	
	 <% 
        Statement statement1 = connection.createStatement();
        String query1 = "SELECT * FROM users where admin = 0";
        ResultSet res1 = statement1.executeQuery(query1);
        int userCount = 0;
        
        while(res1.next()){
        	userCount ++;
        }

    %>
    	 <% 
        Statement statement3 = connection.createStatement();
        String query3 = "SELECT * FROM medicines";
        ResultSet res3 = statement1.executeQuery(query3);
        int medicineCount = 0;
        
        while(res3.next()){
        	medicineCount ++;
        }

    %>
	<div class="dashboard-container">
     <h3 style="cursor: pointer;">
    Welcome,
	<a href="/pharmacy/UserProfile.jsp">
		<%= adminUsername %>
	</a>
	</h3>

    <div class="statistics-section">
        <div class="statistic-box">
            <h3 class="display_data">Total Users</h3>
            <p><%= userCount %></p>
            <p>
            	<a href="/pharmacy/AdminUsers.jsp?popup=hide">Users</a>
            </p>
        </div>
        <div class="statistic-box">
            <h3 class="display_data">Total Medicines</h3>
            <p><%= medicineCount  %></p>
            <p>
            	<a href="/pharmacy/AdminMedicine.jsp">Medicines</a>
            </p>
        </div>
        <%
        	Statement statement4 = connection.createStatement();
        	String query4 = "SELECT * FROM transactions";
        	ResultSet res4 = statement1.executeQuery(query4);
        	Double reveneue = 0.0;
        
        	while(res4.next()){
        		String medicineID = res4.getString("medicineID");
        		String query5 = "SELECT * FROM medicines where id = ?";
        		PreparedStatement statement5 = connection.prepareStatement(query5);
        		statement5.setInt(1, Integer.parseInt(medicineID));
            	ResultSet res5 = statement5.executeQuery();
            	while(res5.next()){
            		Double price = Double.parseDouble(res5.getString("price"));
            		
        			System.out.println(price);
        			reveneue += price;
            		
            	}
        	}
        %>
        <div class="statistic-box">
            <h3 class="display_data">Revenue Generated</h3>
            <p>$<%= reveneue %></p>
        </div>
    </div>

    <div class="recent-activities-section">
        <h2>Admins</h2>
        <table>
        <thead>
            <tr>
                <th>Name</th>
                <th>Phone Number</th>
                <th>Email</th>
                <th>Age</th>
                <th>Country</th>
                
            </tr>
        </thead>
        <tbody style="background-color: #ebebeb;">
        	 <% 


        Statement statement2 = connection.createStatement();
        String query2 = "SELECT * FROM users Where admin = 1";
        ResultSet res2 = statement2.executeQuery(query2);
    
        while (res2.next()) {
            int id = res2.getInt("id");
            String username = res2.getString("username");
            String first_name = res2.getString("first_name");
            String last_name = res2.getString("last_name");
            String email = res2.getString("email");
            String age = res2.getString("age");
            String country = res2.getString("country");
            
            
            

    %>
            <tr>
                <td><%= first_name %> <%= last_name %></td>
                <td>25</td>
                <td><%= email %></td>
                <td><%= age%></td>
                <td><%= country %></td>
                
            </tr>
            <%
        }
        // Close resources (ideally in a 'finally' block)
        res2.close();
        statement2.close();
        
    %>
            
            <!-- Add more rows as needed -->
        </tbody>
    </table>
    </div>

    
</div>
	<%
	connection.close();
	%>
	
	
</body>
</html>