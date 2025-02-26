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
	String itemNo= request.getParameter("itemNo");
	ResultSet rs = stmt.executeQuery(
				  " SELECT ITEM_NAME,PRICE, CONTENTS,SCORE"
				+ " FROM TBL_PRODUCT P "
				+ " INNER JOIN TBL_REVIEW R ON P.ITEM_NO = R.ITEM_NO " 
				+ " WHERE P.ITEM_NO = '" + itemNo + "'" );
	if(rs.next()){
		%>
			<div>제품명 : <%= rs.getString("ITEM_NAME") %></div>
			<div>가격 : <%= rs.getString("PRICE") %></div>
			<div>리뷰 : <%= rs.getString("CONTENTS") %></div>
			<div>평점 : <%= rs.getString("SCORE") %></div>
		<%
	
			} else {
				out.println("조회 실패!");
			}
		
		%>
	<div>
		<button onclick="fnRemove()">삭제</button>
		<button onclick="fnUpdate()">수정</button>
	</div>
</body>
</html>
<script>
	function fnRemove() {
		let itemNo= <%= itemNo %>;
		location.href="product-delete.jsp?itemNo=" + itemNo;	
	}
	
	function fnUpdate() {
		alert("현재 수정은 불가능 합니다")
		location.href="product-list.jsp"
	}


</script>