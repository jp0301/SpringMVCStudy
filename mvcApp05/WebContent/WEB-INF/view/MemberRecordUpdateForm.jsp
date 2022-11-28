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
<title>MemberRecordUpdateForm.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/main.css">
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/table.css">
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/updateForm.css">

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
	
<script type="text/javascript">

	$(function()
	{
		$("#err").css("display","none");
		
		if($("#scoreId").attr("readonly", true))
		{
			$("#scoreId").css("background-color", "#EDEDED");
		};
		
		if($("#id").attr("readonly", true))
		{
			$("#id").css("background-color", "#EDEDED");
		};
		
		
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
		
		
		$("#updateFormBtn").click(function()
		{
			if ($("#id").val() == "" ||
				$("#kor").val() == "" ||
				$("#eng").val() == "" || 
				$("#mat").val() == ""
			   )
			{
				$("#err").html("입력 항목이 누락되었습니다.");
				$("#err").css("display","inline");
				return;
			};

			if($("#kor").val() < 0 || $("#eng").val() < 0 || $("#mat").val() < 0)
			{
				$("#err").html("국어, 영어, 수학 점수는 0보다 작을 수 없습니다.");
				$("#err").css("display", "inline");
				return;	
			};
			
			if($("#kor").val() > 100 || $("#eng").val() > 100 || $("#mat").val() > 100)
			{
				$("#err").html("국어, 영어, 수학 점수는 100보다 클 수 없습니다.");
				$("#err").css("display", "inline");
				return;	
			};
			
			$("#memberRecordUpdateForm").submit();
		});
		
	});


</script>

</head>
<body>

	<div>
		<c:import url="MemberMenu.jsp"></c:import>
	</div>

	
	<h1 class="titleName">학생 성적 수정 입력</h1>
	

	<div align="center">
		<!-- 콘텐츠 영역 -->
		<div id="content" align="left">

			<form action="memberrecordupdate.action" method="post" id="memberRecordUpdateForm">

				<div class="form">

					<div class="form-line">
						<div class="subtitle">번호</div>
						<input type="text" id="scoreId" name="scoreId" readonly="readonly"
						value="${memberrecord.scoreId }">
					</div>

					<div class="form-line">
						<div class="subtitle">아이디</div>
						<input type="text" id="id" name="id" 
						value="${memberrecord.id }">
					</div>

					<div class="form-line">
						<div class="subtitle">국어</div>
						<input type="text" id="kor" name="kor"
						value="${memberrecord.kor }">
					</div>
					<div class="form-line">
						<div class="subtitle">영어</div>
						<input type="text" id="eng" name="eng"
						value="${memberrecord.eng }">
					</div>
					<div class="form-line">
						<div class="subtitle">수학</div>
						<input type="text" id="mat" name="mat"
						value="${memberrecord.mat }">
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