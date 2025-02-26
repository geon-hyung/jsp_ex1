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
		String itemNo = request.getParameter("itemNo");
	
		stmt.executeUpdate("DELETE FROM TBL_PRODUCT WHERE ITEM_NO = '" + itemNo + "'");
		stmt.executeUpdate("DELETE FROM TBL_REVIEW WHERE ITEM_NO = '" + itemNo + "'");
		out.println("삭제되었습니다.");	
	%>

</body>
</html>