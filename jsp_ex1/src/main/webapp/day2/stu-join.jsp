<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<!--stu-join-result.jsp 에서 실행 -->
	<!--학번 이름 학과 성별을 전달  -->
	<form name = "stu" action="stu-join-result.jsp">
		<div>
		학번: <input name= "stuNo"> 
		<input @click="fncheck" type= "button" value="중복체크">
		</div>
		<div>
		이름: <input name= "stuName">
		</div>
		<div>
		학과: <input name= "stuDept">
		</div>
		<div>
		성별:
		 <input type="radio" name= "gender" value="M" checked>남자
		 <input type="radio" name= "gender" value="F">여자
		</div>
		<div>
		<input type="button" value = "저장" onclick= "fnStuInsert"></input>
		</div>
	</form>

</body>
</html>
	<script>     //checkflg 함수를 false 로 선언해서 조건문을 통해 중복체크를 만든다 
		let checkFlg = false;
	
		function fnStuInsert() {
			let stu = document.stu;
			
			if(!checkFlg){
				alert("중복체크")
				return;
			}
			
			if(stu.stuNo.value.length != 8){
				alert("학번은 8글자 ");
				return;
			}
		
			if(stu.stuName.value == "" || stu.stuDept.value == ""){
				alert("모든 값을 채워주세요.");
				return;
			}
		
			stu.stuNo.disabled = false;	
			stu.submit();	
}
		function fncheck() {
			let stu = document.stu;
			if(stu.stuNo.value.length != 8){
				alert("학번은 8글자 ");
				return;	
				
			}		
			
			window.open( //팝업창 생성
					"id-check.jsp?stuNo=" + stu.stuNo.value,
					"check", // 이름 : 중복 안되게 
					"width=300, height=300" // 위치 까지 가능 
			);
			
		}
		
		function getReturn(flg) {
			if(flg == "N"){
				let obj = document.stu.stuNo;
				obj.disabled = true;
			}
			
		}

		
	</script>