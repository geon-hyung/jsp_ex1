<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String name = request.getParameter("userName");
		String phone1 = request.getParameter("phone1");
		String gender = request.getParameter("gender");
		String hobby[] = request.getParameterValues("hobby");
		
	
	
		
	%>
	
	
	<div>아이디 : <%= id %> </div>
	<div>비밀번호 : <%= pwd %> </div>
	<div>이름 : <%= name %> </div>
	<div>전화번호 : <%= phone1 %></div>
	<div>성별 : <%= gender.equals("m") ? "남자" : "여자" %> </div>
	<div>취미 : 
		<%	
			for(int i = 0;i<hobby.length; i++){
			out.println(hobby[i]);
			}
		%>
</div>



</body>
</html>