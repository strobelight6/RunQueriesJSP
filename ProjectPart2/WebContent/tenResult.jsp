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
<title>RESULTS OF Q10</title>
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
	
	String states = request.getParameter("states");
	String[] statesarr = states.split(",");
	StringBuilder b = new StringBuilder();
	for(int i = 0; i < statesarr.length; i++)
	{
		b.append("?,");
	}
	String sqlQuery = 
			"select distinct h.hashtagname as hash, u.ofstate as state"
			+" from tagged h inner join includes i on h.hashtagname = i.hashtagname"
			+" inner join tweet t on i.tid = t.tid"
			+" inner join users u on t.posting_user = u.screen_name"
			+" where u.ofstate in ("
			+ b.deleteCharAt(b.length()-1).toString() + ")"
			+	" and month(t.posted) = ? and year(t.posted) = ?"
			+" order by h.hashtagname asc";
	stmt = conn.prepareStatement(sqlQuery);
	String month = request.getParameter("month_selector");
	String year = request.getParameter("year");
	int i = 1;
	while(i <= statesarr.length)
	{
		stmt.setString(i, statesarr[i-1]);
		i++;
	}
	stmt.setString(i, month);
	stmt.setString(i+1, year);
	
	System.out.println(stmt.toString());
	rs = stmt.executeQuery();
	out.println("<table><tr><th>HashTag Name</th><th>State</th></tr>");
	while(rs.next())
	{
		out.println("<tr>");
		out.println("<td>" + rs.getString("hash") + "</td>");
		out.println("<td>" + rs.getString("state") + "</td>");
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