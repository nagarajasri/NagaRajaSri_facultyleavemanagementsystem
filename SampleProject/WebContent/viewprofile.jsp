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
	String s = session.getAttribute("key").toString();
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/svecw","root","");
	PreparedStatement ps = con.prepareStatement("select * from faculte where userid=' "+s+" ' ");
	ResultSet rs = ps.executeQuery();
	if(rs.next()){
		%>
		
		Userid:<%=s%><br>
		Name:<%=  rs.getString("name")%><br>
		Mobile:<%= rs.getString("phoneno")%><br>
		Email:<%= rs.getString("email") %><br>
	<%
	}else{
		
	}
%>

</body>
</html>