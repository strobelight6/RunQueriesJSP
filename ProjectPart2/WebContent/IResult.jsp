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
	int rs;
	String db_url = request.getParameter("db_url");
	String db_password = request.getParameter("db_password");
	String db_username = request.getParameter("db_username");
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection(DB_URL, DB_USERNAME, DB_PASSWORD);
	String sqlQuery = "INSERT INTO users (screen_name, uname, sub_category, category, ofstate, numFollowers, numFollowing) Values (?,?,?,?,?,?,?)";
	stmt = conn.prepareStatement(sqlQuery);
	
	String screen_name = request.getParameter("screen_name");
	String uname = request.getParameter("uname");
	String category = request.getParameter("category");
	String sub_category = request.getParameter("sub_category");
	String ofstate = request.getParameter("ofstate");
	int numFollowers = Integer.parseInt(request.getParameter("numFollowers"));
	int numFollowing = Integer.parseInt(request.getParameter("numFollowing"));
	
	stmt.setString(1, screen_name);
	stmt.setString(2, uname);
	stmt.setString(3, category);
	stmt.setString(4, sub_category);
	stmt.setString(5, ofstate);
	stmt.setInt(6, numFollowers);
	stmt.setInt(7, numFollowing);
	
	System.out.println(stmt.toString());
	rs = stmt.executeUpdate();
	out.println("<tr>");
	out.println("<td>" + rs + "</td>");
	out.println("</tr>");
	stmt.close();
	conn.close();
%>
	<br>
	<form action="Index.jsp">
		<input type="submit" value="BACK" />
	</form>
</body>
</html>