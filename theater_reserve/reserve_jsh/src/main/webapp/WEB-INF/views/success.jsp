<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
<%

for(int i = 1; i < 51; i++) {
if(request.getParameter("seat["+i+"]") != null) {%>
	<span><%=request.getParameter("seat["+i+"]")%> </span>
	
<%}
} %> 
<span>좌석을 선택했습니다.</span>
</body>
</html>