<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Query one</title>
<meta name="author" content="Joe Strobel">
<meta name="author" content="Riley Cullen">
<meta name="author" content="Ty Trinh">
</head>
<body>
	<h2>Query one</h2>
	<p>This query deletes a user from the database.
	<p>
	<form id="form1" method="post" action="deleteResult.jsp">
		screen_name of user you want to delete:<br> <input type="text" name="username"><br>
		<input type="submit" value="GO">
	</form>
	
	<br>
	<form action="Index.jsp">
		<input type="submit" value="BACK" />
	</form>

</body>
</html>