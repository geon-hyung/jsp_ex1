<%@page import="jakarta.security.auth.message.callback.PrivateKeyCallback.Request"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>아이디: <%= request.getParameter("userId")%> </div>
	<div>나이: <%= request.getParameter("userAge")%> </div>
	
	
</body>
</html>