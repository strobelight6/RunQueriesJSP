<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*,java.security.MessageDigest,java.security.NoSuchAlgorithmException"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*, java.nio.charset.StandardCharsets"%>
<!DOCTYPE html>
<html>
<head>
<meta name="author" content="Joe Strobel">
<meta name="author" content="Riley Cullen">
<meta name="author" content="Ty Trinh">
<%@ page errorPage="ShowError.jsp"%>
<%@ include file="./DBInfo.jsp"%>
<meta charset="UTF-8">
<title>validating...</title>
</head>
<body>
<%
Connection conn = null;
ResultSet resultSet = null;
String db_url = DB_URL;
String db_password = DB_PASSWORD;
String db_username = DB_USERNAME;
PreparedStatement stmt = null;
Class.forName("com.mysql.jdbc.Driver");
conn = DriverManager.getConnection(db_url, db_username, db_password);
String query = ("SELECT * FROM appusers WHERE login_name = ? and pwd = ?");
try {
	
	String sentPwd = request.getParameter("password");
    MessageDigest md = null;
	try {
		md = MessageDigest.getInstance("SHA-1");
	} catch (NoSuchAlgorithmException e) {
		e.printStackTrace();
	}
    byte[] hashInBytes = md.digest(sentPwd.getBytes(StandardCharsets.UTF_8));

	// bytes to hex
    StringBuilder sb = new StringBuilder();
    for (byte b : hashInBytes) {
        sb.append(String.format("%02x", b));
    }
    System.out.println(sb.toString());
    stmt = conn.prepareStatement(query);
    stmt.setString(1, request.getParameter("username"));
    stmt.setString(2, sb.toString());
    resultSet = stmt.executeQuery();
    if(resultSet.next())
    {
    	System.out.println(resultSet.getString("priviledge"));
    	String priv = resultSet.getString("priviledge");
    	if(priv.equals("all"))
    	{
    		request.getSession().setAttribute("privi", "all");
    		%>
        	<jsp:forward page="Index.jsp"/>
      	 	 <%
    	} else 
    	{
    		request.getSession().setAttribute("privi", "read");
    		%>
        	<jsp:forward page="Index.jsp"/>
      	 	 <%
    	}
    	
    	
    } else {
    	System.out.println(resultSet.toString());
    	%>
    	<jsp:forward page="login.jsp"></jsp:forward>
  	  <%
    }
    
} finally {
    if (resultSet != null) try { resultSet.close(); } catch (SQLException ignore) {}
    if (stmt != null) try { stmt.close(); } catch (SQLException ignore) {}
    if (conn != null) try { conn.close(); } catch (SQLException ignore) {}
}
%>
	

</body>
</html>