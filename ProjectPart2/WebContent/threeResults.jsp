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
<title>RESULTS OF Q3</title>
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
			"select count(distinct u.ofstate) as numStates, group_concat(distinct u.ofstate) as states, h.hashtagname as hashtag from users u inner join tweet t on t.posting_user = u.screen_name inner join includes i on i.tid = t.tid inner join tagged h on h.hashtagname = i.hashtagname where year(t.posted) = ? and not u.ofstate = 'na' group by h.hashtagname order by count(distinct u.ofstate) desc limit ?";
	stmt = conn.prepareStatement(sqlQuery);
	String year = request.getParameter("year");
	int k = Integer.parseInt(request.getParameter("kvalue"));
	stmt.setString(1, year);
	stmt.setInt(2, k);
	System.out.println(stmt.toString());
	rs = stmt.executeQuery();
	out.println("<table><tr><th>Number of States</th><th>States</th><th>HashTag</th></tr>");
	while(rs.next())
	{
		out.println("<tr>");
		out.println("<td>" + rs.getString("numStates") + "</td>");
		out.println("<td>" + rs.getString("states") + "</td>");
		out.println("<td>" + rs.getString("hashtag") + "</td>");
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