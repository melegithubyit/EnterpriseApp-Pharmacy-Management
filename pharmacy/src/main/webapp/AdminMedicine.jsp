<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
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
            padding: 0;
            background-color: #f4f4f4;
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
        table {
       	 	
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
        .search-container {
            display: flex;
            align-items: center;
            justify-content: start;            
        }

        .search-input {
            
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px 0 0 5px;
            font-size: 16px;
            box-sizing: border-box;
            outline: none;
        }

        .search-button {
            padding: 10px 15px;
            background-color: #4CAF50;
            color: white;
            border: 1px solid #4CAF50;
            border-radius: 0 5px 5px 0;
            cursor: pointer;
        }

        .search-button:hover {
            background-color: #45a049;
        }
        .your-search-button{
       		 padding: 10px 15px;
            background-color: #4CAF50;
            color: white;
            border: 1px solid #4CAF50;
            border-radius: 0 5px 5px 0;
            cursor: pointer;
            
        }
        .your-search-button:hover{
        	background-color: #45a049;
        	
        }
        
</style>
<body>
<% 
		HttpSession s = request.getSession();
		Integer userID = (Integer) session.getAttribute("userID");	
		String transactionEmail = (String) session.getAttribute("email");
	%>
	
	<% 
			
				Boolean admin = (Boolean) session.getAttribute("admin");
				
				if(!admin){
					response.sendRedirect("Home.jsp");
					return;
				}
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
		<%
		String searchTitle = "";
		if(request.getParameter("title") != null){
			searchTitle = request.getParameter("title");
		}
		%>
		
	<div style="display:flex; justify-content: space-between;  margin-top: 100px; padding: 0 10px;">
        	<form action="/pharmacy/AdminMedicine.jsp" method="get" class="search-container">
        	
        		<input type="text" name="title" class="search-input" placeholder="Search..." value="<%= searchTitle %>">
        		
        		<button type="submit" class="search-button" >Search</button>
    		</form>
	        <a type="submit" class="your-search-button" style="text-decoration: none;" href="/pharmacy/MedicineForm.jsp?success=true" >Post Medicines</a>
		</div>
		<section style="margin: 10px 0px; padding: 0 10px;">
		<%
        DBconfig db = new DBconfig();
        Connection connection = db.returnConnection();
String query;
        
        if(request.getParameter("title") == null){
        	query = "SELECT * FROM medicines";
        }else{
        	query = "SELECT * FROM medicines where title = ?";
        }
		%>
		<%
		PreparedStatement statement1 = connection.prepareStatement(query);
		if(request.getParameter("title") != null){
        	statement1.setString(1, request.getParameter("title"));
        }
        ResultSet res2 = statement1.executeQuery();
        int count = 0;
        while(res2.next()){
        	count ++;
        }
		%>
		<%= count  %> Found
		<% 
			if(request.getParameter("title") != null){
			
		%>
		<a style="" href="/pharmacy/AdminMedicine.jsp" style="font-size: 12px;"> Clear Search</a>
		<% } %>
		</section>
		
	     <table>
        <thead>
            <tr>
                <th>Medicine Title</th>
                <th>Quantity</th>
                <th>Category</th>
                <th>Expire date</th>
                <th>Price</th>
                <th>Detail</th>
            </tr>
        </thead>
        <tbody style="background-color: #ebebeb;">
        	<% 

        
        PreparedStatement statement = connection.prepareStatement(query);
	 	if(request.getParameter("title") != null){
     		statement.setString(1, request.getParameter("title"));
     	}
        
        ResultSet res = statement.executeQuery();
    	
        
        while (res.next()) {
            int id = res.getInt("id");
            String title = res.getString("title");
            String quantity = res.getString("quantity");
            String category = res.getString("category");
            String expiryDate = res.getString("expiryDate");
            String price = res.getString("price");
            String description = res.getString("description");
            
            

    %>

            <tr>
                <td><%= title %></td>
                <td><%= quantity %></td>
                <td><%= category %></td>
                <td><%= expiryDate %></td>
                <td>$ <%= price %> </td>
                <td> <a href="/pharmacy/MedicineDetail.jsp?edit=false&id=<%=id %>">Here</a></td>
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
    <section style="text-align: center; margin: 50px;"> No medicine found
    <% if(searchTitle != ""){
    %>
    with title, <span style="color: red; font-weight: bold;"><%= searchTitle %></span>
    <% }%>
    
    </section>
    <% } %>
</body>
</html>