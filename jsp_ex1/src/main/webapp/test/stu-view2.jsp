<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@include file="../db.jsp"%>
	<%
		String stuId = request.getParameter("stuId");
		String query = 
			"SELECT * FROM TBL_STULIST S "
			+ "INNER JOIN TBL_GRADE G ON S.STU_ID = G.STU_ID "
			+ "WHERE S.STU_ID = '" + stuId + "'";
		ResultSet rs = stmt.executeQuery(query);
		rs.next();
	%>
	<form action="stu-update-action.jsp" method="post">
		<h3>학생 정보 수정</h3>
		<input type="hidden" name="stuId" value="<%= stuId %>">
		
		<label for="stuName">이름:</label>
		<span><%= rs.getString("STU_NAME") %></span>
		<br>
		
		<label for="stuDept">학과:</label>
		<input type="text" id="stuDept" name="stuDept" value="<%= rs.getString("STU_DEPT") %>">
		<br>
		
		<label for="subject">과목:</label>
		<input type="text" id="subject" name="subject" value="<%= rs.getString("SUBJECT") %>">
		<br>
		
		<label for="grade">점수:</label>
		<input type="text" id="grade" name="grade" value="<%= rs.getString("GRADE") %>">
		<br>
		
		<input type="submit" value="수정 완료">
	</form>

	<div>
		<button onclick="fnRemove()">삭제</button>
	</div>
</body>
</html>

<script>
	function fnRemove(){
		let stuId = <%= stuId %>;
		location.href="stu-delete.jsp?stuId=" + stuId;	
	}
</script>