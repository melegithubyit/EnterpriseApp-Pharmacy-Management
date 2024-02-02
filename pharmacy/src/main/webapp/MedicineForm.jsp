<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
        body {

            
            color: #4CAF50;
            font-family: Arial, sans-serif;
            margin: 20px;
        }
        
        h1 {
        	color: #4CAF50;
        }
         

        form {
            max-width: 600px;
            margin: auto;
        }

        label {
            display: block;
            margin-bottom: 8px;
        }

        input, select {
            width: 100%;
            padding: 10px;
            margin-bottom: 16px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        button {
            background-color: #45a049;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        button:hover {
            background-color: #4CAF50;
        }
    </style>
</head>

<body>
<% 
		HttpSession s = request.getSession();
		String adminUsername= (String) session.getAttribute("username");	

	%>
	
	<% 
			
				Boolean admin = (Boolean) session.getAttribute("admin");
				
				if(!admin){
					response.sendRedirect("Home.jsp");
					return;
				}
			%>
 <h2 style="color: #4CAF50;">Medicine Posting Page</h2>
    <form action="/pharmacy/insertMedicine" method="post">
        <label for="title">Title:</label>
        <input type="text" id="title" name="title" required>

        <label for="expiryDate">Expiry Date:</label>
        <input type="date" id="expiryDate" name="expiryDate" required>

        <label for="quantity">Quantity:</label>
        <input type="text" id="quantity" name="quantity" required>

        <label for="price">Price:</label>
        <input type="number" id="price" name="price" required>

        <label for="concentration">Concentration:</label>
        <input type="text" id="concentration" name="concentration" required>

        <label for="amount">Amount:</label>
        <input type="number" id="amount" name="amount" required>

        
        <label for="category">Category:</label>
        <input type="text" id="category" name="category" required>
	
        <label for="batchNumber">Batch Number:</label>
        <input type="text" id="batchNumber" name="batchNumber" required>

        <label for="dosage">Dosage:</label>
        <input type="text" id="dosage" name="dosage" required>

        <label for="manufacturer">Manufacturer:</label>
        <input type="text" id="manufacturer" name="manufacturer" required>

        <label for="description">Description:</label>
        <textarea id="description" name="description" rows="4" required></textarea>
		<br>
		<br>
        <button type="submit">Submit</button>
    </form>
</body>
</html>