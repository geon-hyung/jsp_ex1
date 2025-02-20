<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	
	<form action="join-resurt.jsp" method= "get">
	<div>
	   아이디 : <input name="id">
	</div>
	<div>
	   비밀번호 : <input name="pwd" type ="password">
	</div>
	<div>
	   비밀번호 : <input name="pwd2" type = "password">
	</div>
	<div>
		이름 : <input name="userName">
	</div>
	<div>
		핸드폰 :
		<select name="phone1">
			<option value="010">010</option>
			<option value="016">016</option>
			<option value="017">017</option>
			<option value="018">018</option>
			<option value="019">019</option>
		</select>
	</div>
	<div>
		성별 :
		<input type="radio" name= gender value="m">남
		<input type="radio" name= gender value="f">여
	</div>
	
	<div>
		취미: 
		<input type="checkbox" name="hobby" value="운동">운동
		<input type="checkbox" name="hobby" value="풋살">풋살
		<input type="checkbox" name="hobby" value="수영">수영
		<input type="checkbox" name="hobby" value= "밥먹기">밥먹기
		
	</div>
	<div>
		<input type ="submit" name="fnJoin">
	</div>
	</form>
</body>
</html>

<<script>
	fnJoin : function () {
		let join = document.join;
		if(join.id.value.length < 6 && join.id.value == ""){
			out.println("아이디를 확인해주세요")
		}
		if(join.pwd.value.length < 6 && join.id.value == ""){
			out.println("비밀번호를 확인해주세요")
		}
		
	}
</script>