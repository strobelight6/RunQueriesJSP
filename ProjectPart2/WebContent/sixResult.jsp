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
<title>RESULTS OF Q6</title>
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
	
	String hashtags = request.getParameter("hashtags");
	String[] hashtagarr = hashtags.split(",");
	StringBuilder b = new StringBuilder();
	for(int i = 0; i < hashtagarr.length; i++)
	{
		b.append("?,");
	}
	String sqlQuery = 
			"select users.screen_name, users.ofstate"
			+" from users"
			+" join tweet on tweet.posting_user = users.screen_name"
			+" join includes on includes.tid = tweet.tid"
			+" where includes.hashtagname in ("
			+ b.deleteCharAt(b.length()-1).toString()+")"
			+" group by users.screen_name"
			+" order by users.numFollowers desc"
			+" limit ?";
	stmt = conn.prepareStatement(sqlQuery);
	int index = 1;
	for(String s : hashtagarr)
	{
		stmt.setString(index++,s);
	}
	int k = Integer.parseInt(request.getParameter("kvalue"));
	stmt.setInt(index, k);
	System.out.println(stmt.toString());
	rs = stmt.executeQuery();
	out.println("<table><tr><th>Screen Name</th><th>State</th></tr>");
	while(rs.next())
	{
		out.println("<tr>");
		out.println("<td>" + rs.getString("screen_name") + "</td>");
		out.println("<td>" + rs.getString("ofState") + "</td>");
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