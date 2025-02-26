<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	table, th, tr, td {
		border: 1px solid black;
		border-collapse: collapse;
		padding: 10px;
		text-align: center;
	}
</style>
</head>
<body>
<div>
			 검색창 : <input  value="검색" onclick="fnStuInsert()">
		
		</div>
	<%@include file="../db.jsp"%>
	<table>
		<tr>
			<th>아이템번호</th>
			<th>아이템이름</th>
			<th>가격</th>
			<th>평점</th>
		</tr>
		
	
	<%
		String query = 
				"SELECT P.ITEM_NO, P.ITEM_NAME, PRICE,ROUND(AVG(SCORE),2) AS SCORE "
				+ "FROM TBL_PRODUCT P "
				+ "LEFT JOIN TBL_REVIEW R ON P.ITEM_NO = R.ITEM_NO "
				+ "GROUP BY P.ITEM_NAME,P.ITEM_NO,PRICE";
			
	
		ResultSet rs = stmt.executeQuery(query);
		while(rs.next()){
	%>
			<tr>
				<td><%= rs.getString("ITEM_NO") %></td>
				<td><a href="product-view.jsp?itemNo=<%= rs.getString("ITEM_NO") %>"><%= rs.getString("ITEM_NAME") %></a></td>
				<td><%= rs.getString("PRICE") %></td>
				<td><%= rs.getString("SCORE") %></td>
			</tr>
	<%
		}
	
	%>
	</table>
	<div>
		<button onclick="fnAdd()">제품추가</button>
	</div>

</body>
</html>
<script>

function fnAdd() {
		location.href="product-add.jsp?itemNo"
}

</script>