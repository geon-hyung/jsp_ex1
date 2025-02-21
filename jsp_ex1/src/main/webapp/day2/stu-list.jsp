<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.sql.*" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    table ,td,tr,th{
      border:1px solid #222; 
      border-collapse: collapse;  
    }
 </style>
</head>
<body>
<!--이전 폴더에 있는 db.jsp를 가져온다  -->
	<%@include file="../db.jsp" %>
	
	<%
		ResultSet rs = null;
		try{
			rs = stmt.executeQuery("SELECT * FROM STUDENT");
			//학번 이름 학과 성별 남 여
			
				out.println("<table>");
				out.println("<tr>");
				out.println("<th>학번<th>");
				out.println("<th>이름<th>");
				out.println("<th>학과<th>");
				out.println("<th>성별<th>");
				out.println("</tr>");
			
				
			while(rs.next()){
				String gender
				= rs.getString("STU_GENDER").equals("M") ? "남자" : "여자";
				out.println("<td>" + rs.getString("STU_NO") + "</td>");
				out.println("<td>" + rs.getString("STU_NAME") + "</td>");
				out.println("<td>" + rs.getString("STU_DEPT") + "</td>");
				out.println("<td>" + gender + "</td>");
				out.println("<br>");
				
			}
			out.println("</table>");
		}catch(SQLException e){
			out.println("문제발생");
		}
	
	%>


</body>
</html>