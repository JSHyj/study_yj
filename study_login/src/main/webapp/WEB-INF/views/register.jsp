<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
<form onsubmit="joinChk()" id="form" action="/register" method="post">
	아이디 : <input type="text" name="uid" id="uid" onkeyup="idchk()"/><br/>
	비밀번호 : <input type="password" name="password" id="password" /><br/>
	비밀번호확인 : <input type="password" name="password2" id="password2" /><br/>
	이름 : <input type="text" name="uname" id="uname" /><br/>
	성별 : <input type="text" name="gender" id="gender" /><br/>
	<button type="submit" id="btn">가입하기</button>
	<p id="msg" style="color:red"></p>
</form>

<script>
	function joinChk() { //서브밋 유효성검사
		
		event.preventDefault();
		
		var info = {
				아이디 : $(this[name='uid']).val(),
				비밀번호 : $(this[name='password']).val(),
				비밀번호확인 : $(this[name='password2']).val(),
				이름 : $(this[name='uname']).val(),
				성별 : $(this[name='gender']).val()
		}
		
		var output = '';
		for(var key in info) if(info[key] == '') output += key + " ";
		
		if(output!='') output += "빈칸을 채워주세요.<br>";
		if(info.비밀번호!=info.비밀번호확인) output += "비밀번호가 일치하지 않습니다.";
		
		$("#msg").html(output);
		
		if(output=='' && info.비밀번호==info.비밀번호확인) idchk(2);
		
	}
	
	//----------------------------------------------------
	
	function idchk(num) { // 아이디 중복체크
		var id = $("#uid").val();
		if(id!='') {
			if(/^[a-zA-Z0-9]{5,12}$/.test(id)) {
				$.ajax({
					url : "/register.do",
					type: "GET",
					data: { uid : id },
					success: function(result) {
						console.log(result);
						if(result) {
							if(num==2) {
								num = 1;
								$("#form").submit();
							}
							else $("#msg").html("<span style='color:green'>사용할 수 있는 아이디입니다</span>");
						}
						else $("#msg").html("아이디 중복입니다.");
					}
				});
			}
			else $("#msg").html("5글자이상 12글자 이하로 만들어주세요.");
		}
	}
</script>
</body>
</html>