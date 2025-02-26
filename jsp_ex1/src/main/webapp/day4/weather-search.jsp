<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
</head>
<body>
    <%@ include file="../db.jsp" %>
    
    <!-- 시 선택 -->
    시 : <select onchange="fnSelectSi(this.value)">        
        <option>:: 선택 ::</option>
    <%
        String paramSi = request.getParameter("si");
        String query = "SELECT DISTINCT SI FROM AREA";
        ResultSet rs = stmt.executeQuery(query);
        while (rs.next()) {
            String si = rs.getString("SI");
            String selected = si.equals(paramSi) ? "selected" : "";
    %>  
        <option value="<%= si %>" <%= selected %>> <%= si %></option>
    <%
        }  
    %>
    </select>
    
    <!-- 구 선택 -->
    구 : <select onchange="fnSelectGu(this.value, '<%= paramSi %>')">
        <option>:: 선택 ::</option>
    <%
        String paramGu = request.getParameter("paramGu");
        query = "SELECT DISTINCT GU FROM AREA WHERE SI = '" + paramSi + "' AND GU IS NOT NULL";
        rs = stmt.executeQuery(query);
        while (rs.next()) {
            String gu = rs.getString("GU");
            String selected = gu.equals(paramGu) ? "selected" : "";
    %>  
        <option value="<%= gu %>" <%= selected %>> <%= gu %></option>
    <%
        }  
    %>
    </select>
    
    <!-- 동 선택 -->
    동 : <select onchange="fnSelectDong(this.value, '<%= paramSi %>', '<%= paramGu %>')">
        <option>:: 선택 ::</option>
    <%
        String paramDong = request.getParameter("paramDong");
        query  = "SELECT DONG, NX, NY FROM AREA WHERE SI='" + paramSi + "' AND GU = '" + paramGu + "' AND DONG IS NOT NULL";
        rs = stmt.executeQuery(query);
        while (rs.next()) {
            String dong = rs.getString("DONG");
            String nx = rs.getString("NX");
            String ny = rs.getString("NY");
    %>  
        <option value="<%= dong %>" data-nx="<%= nx %>" data-ny="<%= ny %>" <%= dong.equals(paramDong) ? "selected" : "" %>> <%= dong %></option>
    <%
        }  
    %>
    </select>
</body>
</html>

<script>
    // 시 선택 시
    function fnSelectSi(value) {
        location.href = "?si=" + value;  // 시 선택 후 페이지 리로드
    }

    // 구 선택 시
    function fnSelectGu(value, paramSi) {
        location.href = "?paramGu=" + value + "&paramSi=" + paramSi;  // 구 선택 후 페이지 리로드
    }
    
    // 동 선택 시 날씨 API 호출
    function fnSelectDong(value, paramSi, paramGu) {
        var selectedOption = document.querySelector('option[value="' + value + '"]');
        var nx = selectedOption.getAttribute("data-nx");  // 선택된 동의 nx 값
        var ny = selectedOption.getAttribute("data-ny");  // 선택된 동의 ny 값
        fnApiCall(nx, ny, paramSi, paramGu);  // API 호출
    }

    // 날씨 API 호출
    function fnApiCall(nx, ny, si, gu) {
        var xhr = new XMLHttpRequest();
        var url = 'http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getUltraSrtNcst'; 
        var queryParams = '?' + encodeURIComponent('serviceKey') + '=' + 'x5DAuAXg%2Fi2PVNxDKwSc8XfIz2vlSTYqY89pRwAq4acZO2GbKjO0Ummb%2BbfQtrdoCoUaCIh0pN3AIpPlqeJwJQ%3D%3D';
        queryParams += '&' + encodeURIComponent('pageNo') + '=' + encodeURIComponent('1');
        queryParams += '&' + encodeURIComponent('numOfRows') + '=' + encodeURIComponent('1000');
        queryParams += '&' + encodeURIComponent('dataType') + '=' + encodeURIComponent('JSON');
        queryParams += '&' + encodeURIComponent('base_date') + '=' + encodeURIComponent('20250225');
        queryParams += '&' + encodeURIComponent('base_time') + '=' + encodeURIComponent('1000');
        queryParams += '&' + encodeURIComponent('nx') + '=' + encodeURIComponent(nx);  // 선택된 nx 값
        queryParams += '&' + encodeURIComponent('ny') + '=' + encodeURIComponent(ny);  // 선택된 ny 값

        xhr.open('GET', url + queryParams);
        xhr.onreadystatechange = function() {
            if (this.readyState == 4 && this.status == 200) {
                console.log('Weather Data: ' + this.responseText);  // 응답이 성공적으로 돌아오면 콘솔에 출력
            }
        };
        xhr.send('');
    }
</script>
