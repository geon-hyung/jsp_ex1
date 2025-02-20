<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- method 에 get 방식= 주소창에 해당 값을 가져간다 post 사용시 주소창에 x 보안 높음   -->
<form action="login-result.jsp" method="get">       
 	<div>
 		아이디 : <input name="id">
 	</div>
 	<div>
 		패스워드 : <input type= "password" name="pwd">
 	</div>
 	<input type="submit" value="로그인">   <!--submit을 사용하면 해당페이지로 이동하고 value로 인풋값을 변경가능  -->
 </form>
</body>
</html>