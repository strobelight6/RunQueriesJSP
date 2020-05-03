<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!--isErrorPage is important  -->
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta name="author" content="Joe Strobel">
<meta name="author" content="Riley Cullen">
<meta name="author" content="Ty Trinh">
<meta charset="ISO-8859-1">
<title>Error</title>
</head>
<body>
	<br>
	<form action="Index.jsp">
		<input type="submit" value="BACK" />
	</form>
	<p>Here is the exception stack trace:</p>
	<p>
		<%
			exception.printStackTrace(response.getWriter());
		%>
	</p>
</body>
</html>