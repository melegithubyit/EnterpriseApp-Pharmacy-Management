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
            margin: 0;
            padding: 20px;
            background-color: #ebebeb;
        }

        .card-grid {
            display: grid;
            grid-template-columns: repeat(4, 1fr); /* 4 fixed columns */
            grid-auto-rows: auto; /* Auto-sized rows */
            gap: 20px; /* Gap between items */
        }

        .card {
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 10px 0px;
            text-align: center;         
            transition: box-shadow 0.3s ease;
        }
        
        div a{
        	text-decoration: none;
        	color: #a3a2a2;
        	transition: filter 0.3s ease;
        }
        
        
        .card:hover {
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2); /* Box shadow on hover */
            
        }
        
        img {
            
        	filter: grayscale(100%);
        	
            transition: filter 0.3s ease; /* Smooth transition for the filter effect */
        }
        
        
        .card:hover img{
        	filter: none;
        	 
        }
        
        .card_content{
        	transition: filter 0.3s ease;
        	color: #a3a2a2;
        	
        }
        .card:hover .card_content{
        	color: black;
        }
        div a{
        	font-size: 12px;
        	letter-spacing: 1px;
        	font-weight: bold;
        }
        .card:hover div a{
        	color: #4CAF50;
        	text-decoration: underline;
        	
        }

        /* Optional: Add styles for better responsiveness */
        @media (max-width: 768px) {
            .card-grid {
                grid-template-columns: 1fr; /* Switch to a single column on smaller screens */
            }
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
		<div style="display:flex; justify-content: space-between; margin-bottom: 15px;">
        	<form action="/pharmacy/Medicines.jsp?edit=false" method="get" class="search-container">
        	<% 
        		String searchTitle = "";
        		if(request.getParameter("title") != null){
        			searchTitle = request.getParameter("title");
        		}
        		System.out.println(searchTitle);
        		
        	%>
        		<input type="text" name="title" class="search-input" placeholder="Search..." value="<%= searchTitle %>">
        		
        		<button type="submit" class="search-button" >Search</button>
    		</form>
	        <button type="submit" class="your-search-button" >Your medicines</button>
		</div>
		<section style="margin: 20px 0px;">
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
		PreparedStatement statement2 = connection.prepareStatement(query);
		if(request.getParameter("title") != null){
        	statement2.setString(1, request.getParameter("title"));
        }
        ResultSet res2 = statement2.executeQuery();
        int count = 0;
        while(res2.next()){
        	count ++;
        }
		%>
		<%= count  %> Found
		<% 
			if(request.getParameter("title") != null){
			
		%>
		<a style="" href="/pharmacy/Medicines.jsp?edit=false" style="font-size: 12px;"> Clear Search</a>
		<% } %>
		</section>
		
	     <div class="card-grid">
        
        
	 <% 

        
        PreparedStatement statement1 = connection.prepareStatement(query);
	 	if(request.getParameter("title") != null){
     		statement1.setString(1, request.getParameter("title"));
     	}
        
        ResultSet res = statement1.executeQuery();
    	
        
        while (res.next()) {
            int id = res.getInt("id");
            String title = res.getString("title");
            String quantity = res.getString("quantity");
            String category = res.getString("category");
            String expiryDate = res.getString("expiryDate");
            String price = res.getString("price");
            String description = res.getString("description");
            
            

    %>
            
            <div class="card" style="font-size: 10px">
        			<img alt="asdf" width="100%" height="150px" src="https://images.pexels.com/photos/614810/pexels-photo-614810.jpeg?auto=compress&cs=tinysrgb&w=600">
        	
        		<h3><%= title %></h3>
        		<div style="padding: 8px 17px" class="card_content">
	        		<%= description %>
        		</div>
        		<div>
        		<a href="/pharmacy/MedicineDetail.jsp?id=<%=id%>&edit=false" >Detail</a>
        		</div>
        	</div>


            
    <%
        }
        // Close resources (ideally in a 'finally' block)
        res.close();
        res2.close();
        statement1.close();
        statement2.close();
        connection.close();
    %>
    
    
    </div>
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