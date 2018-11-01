<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<style>
	body {
		width: 500px;
		margin:0 auto;
	}
	.btnRed {background-color: red;}
	.ButtonSeat{background-color: none;}
</style>
</head>
<body>

<c:forEach var="seat" begin="1" end="50" step="1">
	<c:choose>
	<c:when test="${seat%10==0 }">
    	<input type="button" class="ButtonSeat" value="${seat}" style="width:30px">
		<br>
	</c:when>
	<c:otherwise>
    	<input type="button" class="ButtonSeat" value="${seat}" style="width:30px">
	</c:otherwise>
	</c:choose>
</c:forEach>


<script>
	$(".ButtonSeat").on("click", function() {
		var btn = $(this);
		var ticket = parseInt($(".ticketCnt").text());
		var str = "";
		console.log(ticket);
		
		if(ticket > 0) {
			console.log(btn.val());
			btn.attr("class", "btnRed"); 
			btn.attr("disabled", "disabled");
			console.log(ticket);
			$(".ticketCnt").html(ticket-1);
			str = "<input type='hidden' name='seat["+btn.val()+"]' value="+btn.val()+">";
			$("#seatForm").append(str);
		}
		else {
			alert("이미 모두 선택했습니다.");
		}
	});
</script>

<form action="/success" method="post" id="seatForm"></form>


<h1 class="ticketCnt">${ticket}</h1>
<input type="button" onClick="window.location.reload()" value="다시선택">
<h1><input type="button" id="reserveNext" value="선택완료"></h1>

<script>
	$("#reserveNext").click(function() {
		
		var cnt = parseInt($(".ticketCnt").text());
		console.log(cnt);
		
		if(cnt>0){
			alert("좌석을 모두 선택해야합니다.");
		}else {
			$("#seatForm").submit();
		}
	});
</script>


</body>
</html>