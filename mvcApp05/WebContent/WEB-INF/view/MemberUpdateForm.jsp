<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MemberUpdateFrom.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/main.css">
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/table2.css">
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/updateForm.css">

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
	
<script type="text/javascript">

	$(function()
	{
		$("#err").css("display","none");
		

		if($("#id").attr("readonly", true))
		{
			$("#id").css("background-color", "#EDEDED");
		};
		
		$("#address").change(function()
		{
			memberAjaxRequest2();
			
		});
				
				
		$("#email").keyup(function()
		{
			var email = $("#email").val();
			var address = $(this).val();
			
			var emailcom = email + "@" + address;
			
			memberAjaxRequest2();
		});
				
		
		
		
		
		$("#updateFormBtn").click(function()
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
			
			$("#memberForm").submit();
		});
		
	});
	
	function memberAjaxRequest2()
	{
		$.post("memberajax2.action"
			  , {id : $("#id").val(), email : $("#email").val(), address : $("#address").val() }
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

	
	<h1 class="titleName">학생 정보 수정</h1>
	

	<div align="center">
		<!-- 콘텐츠 영역 -->
		<div id="content" align="left">

			<form action="memberupdate.action" method="post" id="memberForm">

				<div class="form">
					<div class="form-line">
						<div class="subtitle">아이디</div>
						<input type="text" id="id" name="id" value="${member.id}" readonly="readonly">
					</div>

					<div class="form-line">
						<div class="subtitle">비밀번호</div>
						<input type="text" id="pw" name="pw">
					</div>
					
					<div class="form-line">
						<div class="subtitle">이름</div>
						<input type="text" id="name" name="name"  value="${member.name}">
					</div>
					
					
					<div class="form-line">
						<div class="subtitle">전화번호</div>
						
						<input type="text" id="tel1" name="tel1"  value="${fn:substring(member.tel, 0,3)}">
						-
						<input type="text" id="tel2" name="tel2" value="${fn:substring(member.tel, 4, 8)}">
						-
						<input type="text" id="tel3" name="tel3" value="${fn:substring(member.tel, 9, 13)}">
					</div>
					
					
					<div class="form-line">
						<div class="subtitle">이메일</div>
						<input type="text" id="email" name="email" value="${fn:substringBefore(member.email, '@')}">
						@
						<select id="address" name="address">
							<option value="test.com" ${fn:substringAfter(member.email, '@') == "test.com" ? "selected=\"selected\"" : ""}>test.com</option>
							<option value="naver.com" ${fn:substringAfter(member.email, '@') == "naver.com" ? "selected=\"selected\"" : ""}>naver.com</option>
							<option value="gmail.com" ${fn:substringAfter(member.email, '@') == "gmail.com" ? "selected=\"selected\"" : ""}>gmail.com</option>
						</select>
					</div>

					
					<span id="err" style="margin-left: 10px; color: red; font-size: 14px; display: none;">
						
					</span>
					
					<div class="form-line">
						<input type="button" id="updateFormBtn" class="updateFormBtn" value="수정완료">
					</div>
					
				</div>
				
				
			</form>
			
		</div>
	</div>




</body>
</html>