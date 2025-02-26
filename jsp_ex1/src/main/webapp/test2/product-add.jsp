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

	<form name="item" action="product-insert.jsp">
		제품명: <input name="itemName"><br>
		가격: <input name="price"><br>
		<input type="button" value="추가" onclick="fnInsert()">
	</form>	
</body>
</html>
<script>
	function fnInsert(){
		let stu = document.stu;

		if(item.price.value < 0 ){
			alert("숫자를 다시입력");
			return;
		}
		if(item.itemNo.value == "" || item.itemName.value == "" || item.price.value == "" {
			alert("빈값 x");
			return;
		}
		stu.submit();
	}

</script>