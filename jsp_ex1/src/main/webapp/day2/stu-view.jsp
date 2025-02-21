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
	<form action="stu-update.jsp">

	<%
	//학번 이름 학과 학년 점수 가져와 
	String stuNo = request.getParameter("stuNo");
	ResultSet rs = stmt.executeQuery(
			"SELECT * "
			+ "FROM STUDENT S "
			+ "INNER JOIN ENROL E ON S.STU_NO = E.STU_NO "
			+ "WHERE S.STU_NO = "
			+ "'" + stuNo + "'"
		);
		if(rs.next()){
	%>
		<div>학번 : <%= rs.getString("STU_NO") %></div>
		<div>이름 : <%= rs.getString("STU_NAME") %></div>
		<div>학과 : <%= rs.getString("STU_DEPT") %></div>
		<div>학년 : <%= rs.getString("STU_GRADE") %></div>
		<div>시험점수 : <%= rs.getString("ENR_GRADE") %></div>
			
		
	<%
			/* out.println(rs.getString("STU_NAME")); */
		}else{
			out.println("조회 실패 ");
		}
	%>
		 <!--hidden 을 사용하면 파라미터로 넘긴 값을 인풋 박스로 넣어둔다면 사용자에 눈엔 안보이지만 
		 가져다가 사용할 수 있다   -->
		<input name= "stuNo" value="<% stuNo %>" hidden>
		<input type="submit" value="수정">
		<!-- stu-update.jsp -->
	
	</form>
	

</body>
</html>