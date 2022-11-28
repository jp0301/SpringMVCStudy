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
<title>MemberRecordInsertForm.jsp</title>
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
		

		
		$("#insertBtn").click(function()
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
			

			if ($("#err").html().trim() == "이미 성적이 있는 학생입니다."
				|| $("#err").html().trim() == "성적이 등록되어 있는 학생은 등록할 수 없습니다.")
			{
				$("#err").html("성적이 등록되어 있는 학생은 등록할 수 없습니다.");
				$("#err").css("display", "inline");
				return;		
			};	
			

			if ($("#err").html().trim() == "존재하지 않는 학생입니다." 
				|| $("#err").html().trim() == "학생 정보에 등록되지 않으면 성적입력이 불가합니다." )
			{
				$("#err").html("학생 정보에 등록되지 않으면 성적입력이 불가합니다.");
				$("#err").css("display", "inline");
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
			
			$("#memberRecordInsertForm").submit();
		});
		
	});
	
	
	function memberAjaxRequest()
	{
		$.post("memberrecordajax.action"
			  , { id : $("#id").val() }
			  , function(data)
			  {
				  $("#err").html(data).css("display", "inline");
		});
		
	};

</script>

</head>
<body>

	<div>
		<c:import url="MemberMenu.jsp"></c:import>
	</div>

	
	<h1 class="titleName">학생 성적 수정</h1>
	

	<div align="center">
		<!-- 콘텐츠 영역 -->
		<div id="content" align="left">

			<form action="memberrecordinsert.action" method="post" id="memberRecordInsertForm">

				<div class="form">

					<div class="form-line">
						<div class="subtitle">아이디</div>
						<input type="text" id="id" name="id" >
					</div>

					<div class="form-line">
						<div class="subtitle">국어</div>
						<input type="text" id="kor" name="kor">
					</div>
					<div class="form-line">
						<div class="subtitle">영어</div>
						<input type="text" id="eng" name="eng">
					</div>
					<div class="form-line">
						<div class="subtitle">수학</div>
						<input type="text" id="mat" name="mat">
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