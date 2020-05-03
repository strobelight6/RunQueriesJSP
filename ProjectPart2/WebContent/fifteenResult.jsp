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
<title>RESULTS OF Q15</title>
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
	String sqlQuery = 
			"select users.screen_name, users.ofstate, group_concat(distinct urlused.url) as p"
			+" from users join tweet on users.screen_name = tweet.posting_user join contained on contained.tid = tweet.tid join urlused on urlused.url = contained.url"
			+" where users.sub_category = ? and MONTH(tweet.posted) = ? and YEAR(tweet.posted) = ?"
			+" group by users.screen_name";
	stmt = conn.prepareStatement(sqlQuery);
	
	
	String subcat = request.getParameter("subcategory");
	String month = request.getParameter("month_selector");
	String year = request.getParameter("year");
	
	stmt.setString(1, subcat);
	stmt.setString(2, month);
	stmt.setString(3, year);	
	System.out.println(stmt.toString());
	rs = stmt.executeQuery();
	out.println("<table><tr><th>Screen Name</th><th>State</th><th>URLS</th></tr>");
	while(rs.next())
	{
		out.println("<tr>");
		out.println("<td>" + rs.getString("screen_name") + "</td>");
		out.println("<td>" + rs.getString("ofstate") + "</td>");
		out.println("<td>" + rs.getString("p") + "</td>");
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