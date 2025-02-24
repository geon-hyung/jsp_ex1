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
.page {
	margin : 10px 5px;
}
.page a{
	padding : 5px;
	border : 1px solid #ccc;
	text-align : center;
	text-decoration : none;
	color : black;
}
.page .active{
	background-color : #ddd;
	font-weight : bold;
}

</style>
</head>
<body>
	<%@include file="../db.jsp"%>
	<select id = "number" onchange = "fnNumber(this.value)">
		<option value= "3">3개씩</option>
		<option value= "5">5개씩</option>
		<option value= "10">10개씩</option>
		<option value= "15">15개씩</option>
		<option value= "20">20개씩</option> 
	</select>
	
	
	<table>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>조회수</th>
			<th>작성일</th>
		</tr>

		<%
		
		int pageSize = 5; // 한 페이지에 몇개씩 보여줄지
		int currentPage = 1;
		
		if(request.getParameter("page") != null){
			currentPage = Integer.parseInt(request.getParameter("page"));  //인티저 파스인트를 통해 숫자열로 바꿔준다 
		}
		if(request.getParameter("size") != null){
			pageSize = Integer.parseInt(request.getParameter("size"));  //사이즈를 파라미터로 보내서 5~10 15 선택시 출력되는 개수가 바뀐다 
		}
		
		int offset = (currentPage - 1) * pageSize;
		ResultSet rs = null;

		// SELECT COUNT(*) AS TOTAL FROM BOARD
		

		ResultSet rsCnt = stmt.executeQuery("SELECT COUNT(*) AS TOTAL FROM BOARD");
		rsCnt.next();
		int total = rsCnt.getInt("TOTAL");
		// total : 21, pageSize : 5
		int pageList = (int) Math.ceil((double) total / pageSize); // 4.xxx
		// ceil(올림), round(반올림), floor(내림)

		String query = "SELECT * FROM BOARD " + "OFFSET "+ offset +" ROWS FETCH NEXT " + pageSize + " ROWS ONLY ";

		rs = stmt.executeQuery(query);
		while (rs.next()) {
			%>
		<tr>
			<td><%=rs.getString("BOARDNO")%></td>
			<td><%=rs.getString("TITLE")%><a href="#" id="count"></a></td>
			<td><%=rs.getString("USERID")%></td>
			<td><%=rs.getString("CNT")%></td>
			<td><%=rs.getString("CDATETIME")%></td>
		</tr>
		<%
		}
		%>
	</table>
	<div class="page">
		
	<%	
		if(currentPage != 1){       //페이지가 1이되었을때 이전 조건문을 만들어 페이지로 넘어가는 화살표가 사라지게한다 + 이전 
		out.println("<a href= '?page=" + (currentPage-1)+ "&size="+ pageSize +"'>☜</a>");
		}
	
		for (int i = 1; i <= pageList; i++) {
			if(currentPage == i){
				out.println("<a href='?page=" + i + "&size="+ pageSize +"' class='active'>" + i + "</a>");     //해당페이지를 눌렀을대 파라미터가 넘어간다 . 
			} else {
				out.println("<a href='?page="+ i + "&size=" + pageSize +"'>" + i + "</a>");
			}
		}
		if(currentPage != pageList){     // 페이지가 마지막 페이지가 됫을때 다음 페이지로 넘어가는 화살표를 사라지게한다 . + 다음
			out.println("<a href= '?page=" + (currentPage+1) +"&size="+ pageSize +"'>☞</a>");
		}
		
	%>
	
	</div>
	<input hidden id="pageSize" value="<%= pageSize %>">
</body>
</html>

<script>
		
		let pageSize = document.querySelector("#pageSize").value;
		let number = document.querySelector("#number");
		for(let i = 0 ; i < number. length; i++){
			if(number[i].value == pageSize){
				number[i].selected = true;
			}
		}
		
		
		function fnNumber(num) {
		location.href="?size="+num;

}
</script>
