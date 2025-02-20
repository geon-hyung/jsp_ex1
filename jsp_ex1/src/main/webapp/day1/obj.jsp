<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 	<!--임포트 하는법   -->
	<%@ page import="java.util.Date" %>
	
	<%
		Date date = new Date();
		out.println(date);
	%>
	<%= new Date() %>



</body>
</html>