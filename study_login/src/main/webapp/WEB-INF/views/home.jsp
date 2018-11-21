<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<title>Home</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
<form onsubmit="ChkLogin()">
	아이디 : <input type="text" id="uid" name="uid" /><br />
	비밀번호 : <input type="password" id="password" name="password" />
	<button type="submit">로그인</button>
	<p id="msg" style="color: red"></p>
</form>


<script>
	function ChkLogin() {
		
		event.preventDefault();
				
		var info = {
				uid : $(this[name='uid']).val(),
				pw : $(this[name='password']).val()
		};
		
		var msg = $(this[id='msg']);
		
		if(info.pw == '' || info.uid == '') {
			msg.html("입력란을 확인해주세요");
		}
		else{
			$.ajax({
				type: "POST",
				url: "/home.do",
				data: JSON.stringify(info),
				contentType:"application/json;charset=UTF-8",
				dataType: "json",
				async: false,
				success: function(result) {
					console.log(result);
					if(result == 1) { alert("로그인성공"); location.reload(); }
					else if(result == 2)  msg.html("비밀번호가 틀렸습니다."); 
					else if(result == 0)  msg.html("아이디가 존재하지 않습니다."); 
					else msg.html("로그인 오류");
				}
			});
		}
	}
</script>
</body>
</html>
