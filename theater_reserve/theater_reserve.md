2018/11/01 양정인력개발센터 극장좌석예매 스터디  전승희
==============================================


ticket.jsp
------------
영화표 설정. submit -> reserve.jsp

<br><br><br><br><br>


reserve.jsp
------------



JSTL 반복문 버튼 50개 생성. 10의 배수 줄바꿈.
버튼은 모두 ButtonSeat 클래스를 가진다.

```
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
```
<br><br><br><br><br>


스크립트 .ButtonSeat 클릭 시 해당버튼 선택자 선언. 미리 만들어둔 영화표 수를 담고 있는 클래스 가져옴. int 파싱해야함.
티켓수가 0보다 클 때 티켓 선택가능. 선택한 좌석은 디시블과 bgcolor 바꿔줌.
해당 버튼 밸류값을 미리만들어 둔 form에 hidden으로 추가.
```
<script>
	$(".ButtonSeat").on("click", function() {     //동적변화 변경이 안 됨.
		var btn = $(this);
		var ticket = parseInt($(".ticketCnt").text());     
    //${ticket}값을 가진 class. model로 넘어온 값이 변경되지 않아서 별도로 바꿔줄 수 있게했음. 
    
		var str = "";
		console.log(ticket);
		
		if(ticket > 0) {   
			console.log(btn.val());
			btn.attr("class", "btnRed"); 
			btn.attr("disabled", "disabled"); //선택한 버튼 한번 더 클릭못하게 함 disable'd'
			console.log(ticket);
			$(".ticketCnt").html(ticket-1); //영화표 표시해둔 곳 값을 -1
			str = "<input type='hidden' name='seat["+btn.val()+"]' value="+btn.val()+">"; //해당 버튼 밸류 스트링으로 만들어서 폼에 추가
			$("#seatForm").append(str);
		}
		else {
			alert("이미 모두 선택했습니다.");
		}
	});
</script>
```

<br><br><br><br><br>

success.jsp
-----------------
JSTL로 seat[i]로 넘어온 값 구현 못함. <% %>사용해서 request로 값 가져옴.






