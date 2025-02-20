<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <!--   변수를 선언하면 어디서든 쓸 수 있고, 선언만 가능하다  -->
	<%! 
		//선언문 
		int number = 10;            
		int sum(int x, int y){		//함수선언
			return x+y;
		}
			%> 
	<!-- 스크립틀릿 실행하면 브라우저에 해당 결과가 나온다.-->
	<% 
		out.println("<h1>" + number + "<h1>");
		String name = "홍길동"; //여기서 변수를 선언하면 여기서 밖에 쓸 수 없다 
		for(int i = 1 ; i < 10 ; i++){
			out.println(i);
		}
	%>
	<br>
	<!-- 표현식 out.println() 이 생략된 곳  -->
	<!-- 표현식 111  이건 페이지원본에서 보임 -->
	<%-- 이 주석에 담으면 페이지원본에서 보이지 않는다  --%>  
	<div style="color:red;"><%= sum(3,5) %></div>
	
</body>
</html>