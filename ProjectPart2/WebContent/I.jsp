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
	<h2>Insert Twitter User</h2>
	<p>This query inserts a new twitter user into the users table
	<p>
	<form id="form1" method="post" action="IResult.jsp">
		Screen Name:<br> <input type="text" name="screen_name"><br>
		Username:<br> <input type="text" name="uname"><br>
		Category:<br> <input type="text" name="category"><br>
		Sub Category:<br> <input type="text" name="sub_category"><br>
		State:<br> <input type="text" name="ofstate"><br>
		Number of Followers:<br> <input type="text" name="numFollowers"><br>
		Number of Accounts Following:<br> <input type="text" name="numFollowing"><br>
		<input type="submit" value="GO">
	</form>
	
	<br>
	<form action="Index.jsp">
		<input type="submit" value="BACK" />
	</form>

</body>
</html>