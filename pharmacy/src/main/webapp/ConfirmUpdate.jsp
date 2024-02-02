<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
        <h1 class="mt-5">You Successfully update the medicine</h1>
        <a class="btn btn-primary mt-3" href="/pharmacy/MedicineDetail.jsp?edit=false&id=<%= request.getParameter("id")%>">Go Back</a>
    </div>
</body>
</html>
