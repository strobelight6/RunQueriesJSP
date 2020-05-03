<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Query three</title>
<meta name="author" content="Joe Strobel">
<meta name="author" content="Riley Cullen">
<meta name="author" content="Ty Trinh">
</head>
<body>
	<h2>Query three</h2>
	<p>This query finds k hashtags that are used across the most number
		of states, which could indicate a certain agenda (e.g., education,
		healthcare) that is widely discussed.
	<p>
	<form id="form1" method="post" action="threeResults.jsp">
		Value of k:<br> <input type="text" name="kvalue"><br>
		<br> Year (YYYY):<br> <input type="text" name="year">
		<input type="submit" value="GO">
	</form>

	<br>
	<form action="Index.jsp">
		<input type="submit" value="BACK" />
	</form>
</body>
</html>