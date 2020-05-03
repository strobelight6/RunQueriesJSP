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
	String db_url = request.getParameter("db_url");
	String db_password = request.getParameter("db_password");
	String db_username = request.getParameter("db_username");
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection(DB_URL, DB_USERNAME, DB_PASSWORD);
	String sqlQuery = "select t.retweet_count, t.text_body, u.screen_name, u.category, u.sub_category from tweet t inner join users u on t.posting_user = u.screen_name where month(t.posted) = ? and year(t.posted) = ? order by t.retweet_count desc limit ?";
	stmt = conn.prepareStatement(sqlQuery);
	
	String month = request.getParameter("month_selector");
	String year = request.getParameter("year");
	int k = Integer.parseInt(request.getParameter("kvalue"));
	System.out.println("Q1 executing with" + month + " " + year + " " + k);
	stmt.setString(1, month);
	stmt.setString(2, year);
	stmt.setInt(3, k);
	System.out.println(stmt.toString());
	rs = stmt.executeQuery();
	out.println("<table><tr><th>Number of Retweets</th><th>Tweet Text</th><th>Screen Name</th><th>Category</th><th>Sub Category</th></tr>");
	while(rs.next())
	{
		out.println("<tr>");
		out.println("<td>" + rs.getString("retweet_count") + "</td>");
		out.println("<td>" + rs.getString("text_body") + "</td>");
		out.println("<td>" + rs.getString("screen_name") + "</td>");
		out.println("<td>" + rs.getString("category") + "</td>");
		out.println("<td>" + rs.getString("sub_category") + "</td>");
		out.println("</tr>");
	}
	out.println("</table>");
	rs.close();
	stmt.close();
	conn.close();
%>
	<br>
	<form action="Index.jsp">
		<input type="submit" value="BACK" />
	</form>
</body>
</html>