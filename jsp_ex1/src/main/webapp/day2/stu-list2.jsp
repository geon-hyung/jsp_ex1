<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.sql.*" %>
<html>
<head>
 <style>
    table ,td,tr,th{
      border:1px solid #222; 
      border-collapse: collapse;  
    }
 </style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!--이전 폴더에 있는 db.jsp를 가져온다  -->
	<%@include file="../db.jsp" %>
	
	<%
		
	%>
	<table>
		 <tr>
		 	<th>선택</th>
		   <th>학번</th>
		   <th>이름</th>
		   <th>학과</th>
		   <th>성별</th>
		</tr>
		   
			
		
	<% 
		ResultSet rs = null;
		try{
			rs = stmt.executeQuery("SELECT * FROM STUDENT");
			//학번 이름 학과 성별 남 여
		
			String stuNo =	rs.getString("STU_NO");
			while(rs.next()){
	%>			
			<tr>
			<td> <input type="radio" name="student" value="<%= stuNo %>"></td>
				<td><%= stuNo %> </td>
				<td>
				 <a href="stu-view.jsp?stuNo=<%=stuNo%>"><%=getParameter("stuNo") %>">View Student</a>
				 </td>
				<td> <%= rs.getString("STU_NAME") %></td>
				<td> <%= rs.getString("STU_DEPT") %></td>
				<td> <%= rs.getString("STU_GENDER").equals("M") ? "남자" : "여자" %></td>
			</tr>	
	<% 		
			}
		}catch(SQLException e){
			out.println("문제발생");
		}
	%>
</table>

<div>
	<button onclick="fnStuRemove()">삭제 </button>
</div>



</body>
</html>
<script>

	function fnStuRemove() {
		if(!confirm("정말삭제")){
			return;
		}
		let select = document.querySelector("input[name='student']:checked");
		//stu-delete.jsp 페이지로 이동
		//학번을 같이 넘기기 
		location.href="stu-delete.jsp?stuNo="+select.value;
		
		
	}

</script>