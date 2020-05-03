<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Query nine</title>
<meta name="author" content="Joe Strobel">
<meta name="author" content="Riley Cullen">
<meta name="author" content="Ty Trinh">
</head>
<body>
	<h2>Query nine</h2>
	<p>This query finds the most influential users measured by the number of followers
 
	<p>
	<form id="form1" method="post" action="nineResult.jsp">
		Category (e.g., 'GOP', 'Democrat'):<br> <input type="text" name="category"><br>
		K Value: <input type="text" name="kvalue"><br>
		
		<input type="submit" value="GO">
	</form>
	
	<br>
	<form action="Index.jsp">
		<input type="submit" value="BACK" />
	</form>
</body>
</html>