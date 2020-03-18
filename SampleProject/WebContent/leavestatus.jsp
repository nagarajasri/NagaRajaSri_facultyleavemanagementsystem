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
		PreparedStatement ps = con.prepareStatement("select * from `svecw`.`leaves` where status = ' "+ "pending"+ "' ");
		ResultSet rs = ps.executeQuery();
			while(rs.next()){
				session.setAttribute("key",rs.getString("userid"));
			%>
				<table class = "table table-striped table-bordered">
				<thead class = "thead-dark">
					<th> userid  </th>
					<th> from    </th>
					<th> to      </th>
					<th> reason  </th>
					<th> status  </th>
				</thead>
				<tbody>
					<tr>
					<td><%= rs.getString("userid")%></td>
					<td><%=rs.getString("from")%></td>
					<td><%=rs.getString("to")%></td>
					<td><%=rs.getString("reason")%></td>
					<td><a href = "accept.jsp">accept</a></td>
					<td><a href = "reject.jsp">reject</a></td>
					</tr>
				</tbody>
				</table>
			<%
			}
			
	
		} catch (Exception e) {
		
			e.printStackTrace();
		}

%>
</body>
</html>