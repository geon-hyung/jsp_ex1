<%@page import="java.lang.annotation.Documented"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.sql.*" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head> 
<body>
	<%@include file="../db.jsp" %>
	<%
	
	
		String stuNo = request.getParameter("stuNo");
	try{
		int result = stmt.executeUpdate(
				"DELETE FROM STUDENT WHERE STU_NO = '" + stuNo + "'" );
	
	if(result > 0){
		out.println("삭제되었음");
	}else{
		out.println("없는 데이터입니다");
	}
	}
	catch(SQLException e){
			out.println("DB 오류");

	}
	//1. db연결 inculde
		//2. try catch()
		//3. statement ㄱㄱ체에서 executeUpdate() 함수를 통해 쿼리호출
		//4. 리턴 값이 1 이상이면 삭제된거.
	
		String stuNo = request.getParameter("stuNo");	
		%>

</body>
</html>