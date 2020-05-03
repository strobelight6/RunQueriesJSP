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
<title>RESULTS OF Q18</title>
</head>
<body>
<%@ page errorPage= "ShowError.jsp" %>
<%@ include file="./DBInfo.jsp"%>
	<br>
	<form action="Index.jsp">
		<input type="submit" value="BACK" />
	</form>
	<br>
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
			"select utwo.screen_name as a, utwo.ofstate as b, group_concat(distinct u.screen_name) as c"
			+" from users u inner join tweet t on t.posting_user = u.screen_name"
			+" inner join mentioned m on m.tid = t.tid"
			+" inner join users utwo on utwo.screen_name = m.screen_name"
			+" where u.sub_category = ? and month(t.posted) = ? and year(t.posted) = ?"
			+" group by utwo.screen_name"
			+" order by count(t.tid) desc"
			+" limit ?";
	stmt = conn.prepareStatement(sqlQuery);
	
	int k = Integer.parseInt(request.getParameter("kvalue"));
	String subcat = request.getParameter("subcategory");
	String month = request.getParameter("month_selector");
	String year = request.getParameter("year");
	
	stmt.setString(1, subcat);
	stmt.setString(2, month);
	stmt.setString(3, year);	
	stmt.setInt(4, k);
	System.out.println(stmt.toString());
	rs = stmt.executeQuery();
	out.println("<table><tr><th>Mentioned User</th><th>Mentioned User State</th><th>Posting Users</th></tr>");
	while(rs.next())
	{
		out.println("<tr>");
		out.println("<td>" + rs.getString("a") + "</td>");
		out.println("<td>" + rs.getString("b") + "</td>");
		out.println("<td>" + rs.getString("c") + "</td>");
		out.println("</tr>");
	}
	out.println("</table>");
	rs.close();
	stmt.close();
	conn.close();
%>
</body>
</html>