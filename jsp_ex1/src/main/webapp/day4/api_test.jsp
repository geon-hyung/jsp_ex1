<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<button onclick="fnApiCall()"> api 호출</button>
</body>
</html>

<script>
	function fnApiCall() {

		var xhr = new XMLHttpRequest();
		var url = 'http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getUltraSrtNcst'; /*URL*/
		var queryParams = '?' + encodeURIComponent('serviceKey') + '=' + 'x5DAuAXg%2Fi2PVNxDKwSc8XfIz2vlSTYqY89pRwAq4acZO2GbKjO0Ummb%2BbfQtrdoCoUaCIh0pN3AIpPlqeJwJQ%3D%3D'; /*Service Key*/
		queryParams += '&' + encodeURIComponent('pageNo') + '='
				+ encodeURIComponent('1'); /**/
		queryParams += '&' + encodeURIComponent('numOfRows') + '='
				+ encodeURIComponent('1000'); /**/
		queryParams += '&' + encodeURIComponent('dataType') + '='
				+ encodeURIComponent('JSON'); /**/
		queryParams += '&' + encodeURIComponent('base_date') + '='
				+ encodeURIComponent('20250225'); /**/
		queryParams += '&' + encodeURIComponent('base_time') + '='
				+ encodeURIComponent('1000'); /**/
		queryParams += '&' + encodeURIComponent('nx') + '='
				+ encodeURIComponent('55'); /**/
		queryParams += '&' + encodeURIComponent('ny') + '='
				+ encodeURIComponent('125'); /**/
		xhr.open('GET', url + queryParams);
		xhr.onreadystatechange = function() {
			if (this.readyState == 4) {
				console.log('Status: ' + this.status + 'nHeaders: '
						+ JSON.stringify(this.getAllResponseHeaders())
						+ 'nBody: ' + this.responseText);
			}
		};
	
	xhr.send('');
	}
</script>