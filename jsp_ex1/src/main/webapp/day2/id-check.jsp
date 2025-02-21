<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@include file="../db.jsp" %>
	<form name="check">
	<% 
		String stuNo = request.getParameter("stuNo");
		ResultSet rs = stmt.executeQuery( //학번을 받아서 해당학생이 맞는지 조회 하는 코드 
			"SELECT * FROM STUDENT WHERE STU_NO = '" + stuNo + "'"
		);
		if(rs.next()){
			out.println("사용중인 학번입니다. 다른거 사용 ");
%>
			<input name="flg" value="y" hidden>
			
<% 
		}else{
			out.println("사용가능");
	%>	
			<input name="flg" value="n" hidden>
	<%		
		

		}
		
	%>
	
	<div>
		<input type = "button" onclick="fnBack()" value="되돌아가기">	
	</div>
	</form>
</body>
</html>

<script>
	//나를 오픈한 객체를 나타내는 window.opener
	function fnBack() {
		window.opener.getReturn(document.check.flg.value);
		window.close();
	}
	
	</script>