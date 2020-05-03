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
<title>RESULTS OF Q11</title>
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
			"select tweet.text_body as tweet_text, includes.hashtagname as hashtag_text, users.screen_name as screen_name, users.sub_category as subcategory"
			+" from tweet"
			+" join users on users.screen_name = tweet.posting_user" 
			+" join includes on includes.tid = tweet.tid"
			+" where users.ofstate = ? and MONTH(tweet.posted) = ? and YEAR(tweet.posted) = ? and includes.hashtagname = ?"
			+" limit ?";
	stmt = conn.prepareStatement(sqlQuery);
	int k = Integer.parseInt(request.getParameter("kvalue"));
	String state = request.getParameter("state");
	String hashtag = request.getParameter("hashtag");
	String month = request.getParameter("month_selector");
	String year = request.getParameter("year");
	
	stmt.setString(1, state);
	stmt.setString(2, month);
	stmt.setString(3, year);
	stmt.setString(4, hashtag);
	stmt.setInt(5, k);
	
	System.out.println(stmt.toString());
	rs = stmt.executeQuery();
	out.println("<table><tr><th>Tweet Text</th><th>HashTag Text</th><th>Screen Name</th><th>Sub Category</th></tr>");
	while(rs.next())
	{
		out.println("<tr>");
		out.println("<td>" + rs.getString("tweet_text") + "</td>");
		out.println("<td>" + rs.getString("hashtag_text") + "</td>");
		out.println("<td>" + rs.getString("screen_name") + "</td>");
		out.println("<td>" + rs.getString("subcategory") + "</td>");
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