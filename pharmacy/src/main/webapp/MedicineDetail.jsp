<%@page import="java.sql.ResultSet"%>
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
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
            color: #333;
        }

        header {
            background-color: #4CAF50;
            padding: 1em;
            text-align: center;
            color: white;
        }
		
		header h1{
			color: white;
		}
        section {
            max-width: 800px;
            margin: 2em auto;
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
            width: 300px;
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
	HttpSession session2 = request.getSession();
	Boolean admin = (Boolean) session2.getAttribute("admin");
	
%>
<%
String edit = (String) request.getParameter("edit");

%>

	<%
	DBconfig db = new DBconfig();
    Connection connection = db.returnConnection();
    String query = "SELECT * FROM medicines Where id = ?";
    PreparedStatement preparedStatement = connection.prepareStatement(query);
    preparedStatement.setString(1, request.getParameter("id"));

    ResultSet res = preparedStatement.executeQuery();

    while (res.next()) {
        int id = res.getInt("id");
        String title = res.getString("title");
        String quantity = res.getString("quantity");
        String category = res.getString("category");
        String expiryDate = res.getString("expiryDate");
        String price = res.getString("price");
        String description = res.getString("description");
        String dosage = res.getString("dosage");
        String concentration = res.getString("concentration");
        String batchNumber = res.getString("batchNumber");
        String manufacturer = res.getString("manufacturer");
        Integer amount = res.getInt("amount");
    

	%>
	<header>
        <h1><%= title %></h1>
    </header>

    <section>
    <%
    	if(edit.equals("false")){
    %>
        <h2>Detail</h2>
        <p><strong>Quantity:</strong> <%= quantity %></p>
        <p><strong>Category:</strong> <%= category %></p>
        <p><strong>Manufacturer:</strong> <%= manufacturer %></p>
        <p><strong>Expiry Date:</strong> <%= expiryDate %></p>
        <p><strong>Price:</strong> <%= price %></p>
        <p><strong>Dosage:</strong> <%= dosage %></p>
        <p><strong>Batch Number:</strong> <%= batchNumber %></p>
        <p><strong>Concentration:</strong> <%= concentration %></p>
        <p><strong>Description:</strong> <%= description %></p>
        <p><strong>Amount Left:</strong> <%= amount %></p>
    <% } %>
    <%
    	if(edit.equals("true")){
    %>
    <h2>Updating...</h2>
    	<form action="/pharmacy/updateMedicine?id=<%= request.getParameter("id") %>" method="get">
    	<div >
    	<label for="title">Title: </label>
        <input type="text" class="login-input" name="title" id="title" placeholder="Title" required value="<%= title%>">
    	</div>
        
        <div>
    	<label for="expiryDate">Expiry Date: </label>
        <input type="text" class="login-input" name="expiryDate" id="expiryDate" placeholder="Expiry Date" required value="<%= expiryDate%>">
    	</div>
    	
    	<div >
    	<label for="Quantity">Quantity: </label>
        <input type="text" class="login-input" name="quantity" id="Quantity" placeholder="Quantity" required value="<%= quantity%>">
    	</div>
    	
    	<div >
    	<label for="Category">Category: </label>
        <input type="text" class="login-input" name="category" id="Category" placeholder="Category" required value="<%= category%>">
    	</div>
        
        <div>
    	<label for="Price">Price: </label>
        <input type="text" class="login-input" name="price" id="Price" placeholder="Price" required value="<%= price%>">
    	</div>
    	
    	<div>
    	<label for="Dosage">Dosage: </label>
        <input type="text" class="login-input" name="dosage" id="Dosage" placeholder="Dosage" required value="<%= dosage%>">
    	</div>
    	<div>
    	<label for="batchNumber">Batch Number: </label>
        <input type="text" class="login-input" name="batchNumber" id="batchNumber" placeholder="Batch Number" required value="<%= batchNumber%>">
    	</div>
    	<div>
    	<label for="Manufacturer">Manufacturer: </label>
        <input type="text" class="login-input" name="manufacturer" id="Manufacturer" placeholder="Manufacturer" required value="<%= manufacturer%>">
    	</div>
    	
    	<div>
    	<label for="Concentration">Concentration: </label>
        <input type="text" class="login-input" name="concentration" id="Concentration" placeholder="Concentration" required value="<%= concentration%>">
    	</div>
    	
    	<div>
    	<label for="Description">Description: </label>
        <input type="text" class="login-input" name="description" id="Description" placeholder="Description" required value="<%= description%>">
    	</div>
    	
    	<div>
    	<label for="Amount">Amount Left: </label>
        <input type="text" class="login-input" name="amount" id="Amount" placeholder="Amount" required value="<%= amount%>">
    	</div>
    	
    	<div style="display: none;">
    	
        <input type="text" class="login-input" name="id" placeholder="Amount" required value="<%= id%>">
    	</div>
        
        
        
        <div style="display: flex; justify-content: space-between; margin: 20px 0px;">

        			<button type="submit" class="login-button">Save</button>
        	<div style="display: flex; justify-content: end; align-items: center;">
        
        		<a href="/pharmacy/MedicineDetail.jsp?edit=false&id=<%=id%>" style="background-color: red; padding: 10px 15px; border-radius: 10px; text-decoration: none; color: white">
        				Cancel
        		</a>
        	</div>
        </div>
        
    </form>
    
    <% } %>
        <% 
        	if(amount != 0 && !admin){
        %>
        <div style="display: flex; justify-content: end; align-items: center">
        		<a href="/pharmacy/purchase?userID=<%= (Integer) session2.getAttribute("userID")%>&medicineID=<%=id%>" style="background-color: #4CAF50; padding: 10px 15px; border-radius: 10px; text-decoration: none; color: white">
        				Purchase
		        
        		</a>
        </div>
        <% } %>
        <% 
        	if(admin && !edit.equals("true")){
        %>
        <div style="display: flex; justify-content: end; gap: 10px;">
                <form style="display: flex; justify-content: end; align-items: center">
        
        			<a href="/pharmacy/MedicineDetail.jsp?edit=true&id=<%=id%>" style="background-color: #4CAF50; padding: 10px 15px; border-radius: 10px; text-decoration: none; color: white">
        				Edit
        			</a>
        		</form>
        	<div style="display: flex; justify-content: end; align-items: center;">
        
        		<a href="/pharmacy/deleteMedicine?id=<%= id %>" style="background-color: red; padding: 10px 15px; border-radius: 10px; text-decoration: none; color: white">
        				Delete
        		</a>
        	</div>
        </div>
        <% } %>
        
    </section>
	<% 
		}
    	res.close();
    	preparedStatement.close();
        connection.close();
    %>
</body>
</html>