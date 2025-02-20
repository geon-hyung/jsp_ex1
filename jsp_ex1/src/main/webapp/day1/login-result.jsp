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
		
		// 아이디가 : test , 비밀번호가 : 1234 =>> 로그인 성공 
		// 그외에는 로그인  실패  문자열은 equals 로 비교 하기 
	if(id.equals("test")&& pwd.equals("1234")){
	//	out.println("성ㅇ공");
		response.sendRedirect("main-include.jsp");   //성공했을ㄸ ㅐ페이지를 이동시켜준다 
	} else{
		out.println("실패");
	}
	
		
	%>

	
	
</body>
</html>