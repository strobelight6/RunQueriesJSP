<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Query fifteen</title>
<meta name="author" content="Joe Strobel">
<meta name="author" content="Riley Cullen">
<meta name="author" content="Ty Trinh">
</head>
<body>
	<h2>Query fifteen</h2>
	<p>This query finds URLs shared by a party.
	<p>
	<form id="form1" method="post" action="fifteenResult.jsp">
		Sub-category:<br> <input type="text" name="subcategory"><br>
		Month:<br>
		<select
			name="month_selector">
			<option value="1">January</option>
			<option value="2">February</option>
			<option value="3">March</option>
			<option value="4">April</option>
			<option value="5">May</option>
			<option value="6">June</option>
			<option value="7">July</option>
			<option value="8">August</option>
			<option value="9">September</option>
			<option value="10">October</option>
			<option value="11">November</option>
			<option value="12">December</option>
		</select>
		<br>
		Year (YYYY):<br> <input type="text" name="year">
		<input type="submit" value="GO">
	</form>
	
	<br>
	<form action="Index.jsp">
		<input type="submit" value="BACK" />
	</form>
</body>
</html>