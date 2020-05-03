<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<html>
<head>

<title>Final Project</title>
<meta name="author" content="Joe Strobel">
<meta name="author" content="Riley Cullen">
<meta name="author" content="Ty Trinh">
</head>
<body>
<%@ page errorPage="ShowError.jsp"%>
<%@ include file="./DBInfo.jsp"%>
<%

%>
<%
System.out.println(session.getAttribute("privi"));
if(session.getAttribute("privi").equals("all"))
{
%>
	 <h2>You can view and add/delete users</h2>
<%
} else {
%>
	<h2>You are only able to view<h2>
<%
}
%>
<%

	Connection conn =null;
	String db_url = DB_URL;
	String db_password = DB_PASSWORD;
	String db_username = DB_USERNAME;
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection(db_url, db_username, db_password);
%>
	<h3>Select the query:</h3>
	<!-- the form method can be get or post
				but post does not let anyone see the parameter values that are passed between pages
				Use post for sensitive information
			-->
	<script type="text/javascript">
		function test(ctrl){
		    var val = ctrl.value;
		    var frm = document.getElementById('form1');
		    frm.action = val;
		}
	</script>

	<form id="form1" method="post" action="one.jsp">
		<select name="query_selector" onchange="test(this)">
			<option value="one.jsp">1</option>
			<option value="three.jsp">3</option>
			<option value="six.jsp">6</option>
			<option value="nine.jsp">9</option>
			<option value="ten.jsp">10</option>
			<option value="eleven.jsp">11</option>
			<option value="fifteen.jsp">15</option>
			<option value="eighteen.jsp">18</option>
			<option value="twentythree.jsp">23</option>
			<%
			System.out.println(session.getAttribute("privi"));
			if(session.getAttribute("privi").equals("all"))
			{
			%>
			<option value= "I.jsp">I</option>
			<option value= "delete.jsp">D</option>
			<%
			} else {
			%>
			<%
			}
			%>
		</select>
		<p></p>
		<input type="submit" value="GO">
	</form>

</body>
</html>