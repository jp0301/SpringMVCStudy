<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LoginForm.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/main.css">
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/loginForm.css">

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
	
<script type="text/javascript">

	$(function()
	{
		$("#submitBtn").click(function()
		{
			
			if ( $("#id").val() == "" || $("#pw").val() == "" )
			{
				$("#err").html("항목을 모두 입력해야 합니다.").css("display", "inline");
				return;
			}
			
			$("#loginForm").submit();
		});
	});



</script>

</head>
<body>


<div>
	
	<div>
		<div class="main-title">SIST...@"</div>
	</div>
	
	
	<!-- 콘텐츠 영역 -->
	<div class="content">
		<form action="login.action" method="post" id="loginForm">
			<div class="inputContain">
				<div class="line">
					<div class="subtitle">아이디</div>
					<input class="inputCon" type="text" id="id" name="id" placeholder="아이디" required="required">
				</div>
				
				<div class="line">
					<div  class="subtitle">비밀번호</div>
					<input class="inputCon" type="password" id="pw" name="pw" placeholder="비밀번호" required="required">
				</div>
				
				<div class="line">
					<!-- 이름을 통해 관리자 지정해놓기. 임시지정 -->
					<input class="inputCheck" type="checkbox" id="admin" name="admin" value="박원석">
					<label for="admin">관리자</label>
				</div>
				
				<div class="line">
					<input type="button" value="로그인" id="submitBtn" class="btn">
				</div>
				
				<div class="line">
					<span id="err" style="color: red; display: none; font-size: 14px;">
					</span>	
				</div>
			</div>
			
				
		</form>
		
	</div>
</div>



</body>
</html>