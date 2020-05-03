<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Query six</title>
<meta name="author" content="Joe Strobel">
<meta name="author" content="Riley Cullen">
<meta name="author" content="Ty Trinh">
</head>
<body>
	<h2>Query six</h2>
	<p>This is to find k users with similar interests.
	<p>
	<form id="form1" method="post" action="sixResult.jsp">
		Value of k:<br> <input type="text" name="kvalue"><br>
		HashTag:<br> <input type="text" name = "hashtags"><br>
		<br> Type in the hashtag names with seperated commas ie: Gop,HappyNewYear,NewYear<br>
		<input type="submit" value="GO">
	</form>
	
	<br>
	<form action="Index.jsp">
		<input type="submit" value="BACK" />
	</form>
</body>
</html>