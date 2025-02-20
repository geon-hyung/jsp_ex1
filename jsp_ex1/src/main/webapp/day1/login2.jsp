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
<form name="login" action="login-result.jsp" method="get">       
 	<div>
 		아이디 : <input name="id">
 	</div>
 	<div>
 		패스워드 : <input type= "password" name="pwd">
 	</div>
 	<input type="button" value="로그인" onclick="fnLogin()">   <!-- type 을 submit을 사용하면 해당페이지로 이동하고 value로 인풋값을 변경가능  -->
 </form>
</body>
</html>
	<script>
	function fnLogin(){
		let login = document.login;
		if(login.id.value == ""){
			alert("아이디를 입력");
			login.id.focus(); //아이디 입력란에 포커스를 맞춰준다는 말 
			return;
		}

		if(login.pwd.value == ""){
			alert("비밀입력");
			login.pwd.focus(); //아이디 입력란에 포커스를 맞춰준다는 말 
			return;
		}
		
		login.submit(); 

		
	}
	
	</script>