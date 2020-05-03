<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<html>
<head>
<meta name="author" content="Joe Strobel">
<meta name="author" content="Riley Cullen">
<meta name="author" content="Ty Trinh">
<meta charset="UTF-8">
<title>RESULTS OF Q1</title>
</head>
<body>
	<br>
	<form action="Index.jsp">
		<input type="submit" value="BACK" />
	</form>
	<br>
<%@ page errorPage= "ShowError.jsp" %>
<%@ include file="./DBInfo.jsp"%>
<%
	Connection conn =null;
	PreparedStatement stmt =null;
	ResultSet rs =null;
	String db_url = DB_URL;
	String db_password = DB_PASSWORD;
	String db_username = DB_USERNAME;
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection(DB_URL, DB_USERNAME, DB_PASSWORD);
	String sqlQuery2 = "DELETE FROM tweet where tweet.posting_user = ?";
	String sqlQuery1 = "DELETE FROM mentioned where mentioned.screen_name = ?";
	String sqlQuery = "DELETE FROM users WHERE users.screen_name = ?";
	
	stmt = conn.prepareStatement(sqlQuery1);
	String user = request.getParameter("username");
	stmt.setString(1, user);
	System.out.println(stmt.toString());
	int r = stmt.executeUpdate();
	
	stmt = conn.prepareStatement(sqlQuery2);
	stmt.setString(1, user);
	System.out.println(stmt.toString());
	r = stmt.executeUpdate();
	
	stmt = conn.prepareStatement(sqlQuery);
	stmt.setString(1, user);
	System.out.println(stmt.toString());
	r = stmt.executeUpdate();
	
	out.println(r + " records updated");
	stmt.close();
	conn.close();
%>
	<br>
	<form action="Index.jsp">
		<input type="submit" value="BACK" />
	</form>
</body>
</html>