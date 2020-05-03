<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Query twenty three</title>
<meta name="author" content="Joe Strobel">
<meta name="author" content="Riley Cullen">
<meta name="author" content="Ty Trinh">
</head>
<body>
	<h2>Query twenty three</h2>
	<p>Find k most used hashtags with the count of tweets it appeared
		posted by a given sub-category of users in a list of months
	<p>
	<form id="form1" method="post" action="twentythreeResult.jsp">
		Value of k:<br> <input type="text" name="kvalue"><br>
		Subcategory (e.g., 'GOP'):<br> <input type="text" name="subcategory"><br>
		Months:<br> <input type="text" name="months"> type in the months sperated with a comma ie 1,2,3<br> 
		 <br> Year (YYYY):<br> <input type="text" name="year">
		<input type="submit" value="GO">
	</form>

	<br>
	<form action="Index.jsp">
		<input type="submit" value="BACK" />
	</form>
</body>
</html>