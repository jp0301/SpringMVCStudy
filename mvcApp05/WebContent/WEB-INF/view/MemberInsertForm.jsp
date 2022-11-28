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
<title>MemberInsertFrom.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/main.css">
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/table.css">
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/inputForm.css">

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
	
<script type="text/javascript">

	$(function()
	{
		$("#err").css("display","none");
		
		
		//키업
		$("#id").keyup(function()
		{
			var search = $(this).val();
			
			// 입력 내용이 존재할 경우에만
			if(search.replace(" ", "") == "")
			{
				$("#err").css("display", "none");
				return;
			}
			
			var regEx = /^[a-zA-Z0-9]+$/;
			
			if (!regEx.test(search))
				return;				
			
			
			memberAjaxRequest();
		});	
		
		
		$("#address").change(function()
		{
			var email = $("#email").val();
			var address = $(this).val();
			
			var emailcom = email + "@" + address;
			
			memberAjaxRequest2();
			
		});
		
		
		$("#email").keyup(function()
		{
			var email = $("#email").val();
			var address = $(this).val();
			
			var emailcom = email + "@" + address;
			
			memberAjaxRequest2();
		});
		
		
		$("#insertBtn").click(function()
		{
			if ($("#id").val() == "" ||
				$("#pw").val() == "" ||
				$("#name").val() == "" || 
				$("#tel1").val() == "" || $("#tel2").val() == "" || $("#tel3").val() == "" ||
				$("#email").val() == "" 
			   )
			{
				$("#err").html("입력 항목이 누락되었습니다.");
				$("#err").css("display","inline");
				return;
			}
			
			if (!/^[a-zA-Z0-9]+$/.test($("#id").val()) )
			{
				$("#err").html("입력 항목이 잘못되었습니다.");
				$("#err").css("display", "inline");
				return;		
			}

			
			if ( $("#err").html().trim() == "이미 사용중인 아이디입니다."
				|| $("#err").html().trim() == "사용중인 아이디는 등록할 수 없습니다."
				|| $("#err").html().trim() == "입력 항목이 누락되었습니다."
				|| $("#err").html().trim() == "입력 항목이 잘못되었습니다.")
			{
				$("#err").html("사용중인 아이디는 등록할 수 없습니다.");
				$("#err").css("display", "inline");
				return;		
			}
					
			if ( $("#err").html().trim() == "이미 사용중인 이메일입니다."
				|| $("#err").html().trim() == "사용중인 이메일은 등록할 수 없습니다."
				|| $("#err").html().trim() == "입력 항목이 누락되었습니다."
				|| $("#err").html().trim() == "입력 항목이 잘못되었습니다.")
			{
				$("#err").html("사용중인 이메일은 등록할 수 없습니다.");
				$("#err").css("display", "inline");
				return;		
			}
			
			$("#memberForm").submit();
		});
		
	});
	
	
	function memberAjaxRequest()
	{
		$.post("memberajax.action"
			  , { id : $("#id").val() }
			  , function(data)
			  {
				  $("#err").html(data).css("display", "inline");
		});
		
	};
	
	function memberAjaxRequest2()
	{
		$.post("memberajax2.action"
			  , { email : $("#email").val(), address : $("#address").val() }
			  , function(data)
			  {
				  $("#err").html(data).css("display", "inline");
		});
	};

</script>

</head>
<body>


<!-- -----------------------------------------------------------------------------
 #13. MemberInsertForm.jsp
 - 학생 추가 폼 페이지
 - [관리자]가 접근하는 학생 입력 폼 출력 페이지
--------------------------------------------------------------------------------- -->


	<div>
		<c:import url="MemberMenu.jsp"></c:import>
	</div>

	
	<h1 class="titleName">학생 추가 입력</h1>
	

	<div align="center">
		<!-- 콘텐츠 영역 -->
		<div id="content" align="left">

			<form action="memberinsert.action" method="post" id="memberForm">

				<div class="form">
					<div class="form-line">
						<div class="subtitle">아이디</div>
						<input type="text" id="id" name="id">
					</div>

					<div class="form-line">
						<div class="subtitle">비밀번호</div>
						<input type="text" id="pw" name="pw">
					</div>
					
					<div class="form-line">
						<div class="subtitle">이름</div>
						<input type="text" id="name" name="name" >
					</div>
					
					
					<div class="form-line">
						<div class="subtitle">전화번호</div>
						<input type="text" id="tel1" name="tel1">
						-
						<input type="text" id="tel2" name="tel2">
						-
						<input type="text" id="tel3" name="tel3">
					</div>
					
					
					<div class="form-line">
						<div class="subtitle">이메일</div>
						<input type="text" id="email" name="email">
						@
						<select id="address" name="address">
							<option value="">=주소선택=</option>
							<option value="test.com">test.com</option>
							<option value="naver.com">naver.com</option>
							<option value="gmail.com">gmail.com</option>
						</select>
					</div>
					
					<span id="err" style="margin-left: 10px; color: red; font-size: 14px; display: none;">
						
					</span>
					
					<div class="form-line">
						<input type="button" id="insertBtn" class="insertFormBtn" value="입력완료">
					</div>
					
				</div>
				
				
			</form>
			
		</div>
	</div>




</body>
</html>