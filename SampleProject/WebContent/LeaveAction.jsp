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
String to = request.getParameter("to");
String from = request.getParameter("from");
String rs = request.getParameter("reason");
try {

	String s =session.getAttribute("key").toString();

	String status = "pending";
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/svecw","root","");
	PreparedStatement ps = con.prepareStatement("INSERT INTO `svecw`.`leaves` (`userid`, `to`, `from`, `reason`, `status`) VALUES (' "+s+"',' "+to+" ',' "+from+" ',' " +rs+ " ', ' "+status+" ')");
	int i = ps.executeUpdate();
	if(i>0)
		response.sendRedirect("success.html");
	else
		response.sendRedirect("register.html");

} catch (Exception e) {
	e.printStackTrace();
}
%>

</body>
</html>