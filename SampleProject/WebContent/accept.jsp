<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
try {
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/svecw","root","");
	String s = session.getAttribute("key").toString();
	System.out.println(s);
	PreparedStatement ps = con.prepareStatement("update leaves set status=?where userid=?");  
	ps.setString(1,"accept");
	ps.setString(2,s);
	int i = ps.executeUpdate();
	System.out.println(i);
	if(i>0){
		response.sendRedirect("leavestatus.jsp");
	}else{
		%>
		
		<h1 style=" text-align:center;color:red">INVALID CREDENTIAL</h1>

		<%
	}
} catch (Exception e) {
	
	e.printStackTrace();
}

%>
</body>
</html>