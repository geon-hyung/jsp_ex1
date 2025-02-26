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
		String itemName = request.getParameter("itemName");
		String price = request.getParameter("price");
		
		String query = 
			"INSERT INTO TBL_PRODUCT "
			+ "VALUES("
			+ "ITEM_NO_SQ.NEXTVAL "
			+ "'" + itemName + "',"
			+ "'" + price + "',)";
		

		out.println("저장되었습니다.");
		
	%>
</body>
</html>