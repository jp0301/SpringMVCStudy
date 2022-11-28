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
<title>PositionInsertForm.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/main.css">
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/jquery-ui.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	

<style type="text/css">
#content {
	border: 1px solid #ccc;
	border-radius: 5px;
	width: 500px;
	padding: 15px;
	margin: 30px;
}

.input-group {
	margin: 10px;
}
</style>

<script type="text/javascript"
	src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="<%=cp%>/js/jquery-ui.js"></script>

	
<script type="text/javascript">

	$(function() {
		
		//에러(span 엘리먼트) 안내 초기화
		$("#err").css("display","none");
		
		
		//키업
		$("#positionName").keyup(function()
		{
			var search = $(this).val();
			
			if(search.replace(" ", "") == "")
			{
				$("#err").css("display", "none");
				return;
			}
			
			var regEx = /^[가-힣]{1,}$/;
			
			if (!regEx.test(search))
				return;				
			
			
			ajaxRequest();
		});
		
		
		$("#submitBtn").click(function()
		{
			if( $("#positionName").val() == "" || $("#minBasicPay").val() == "")
			{
				$("#err").html("입력 항목이 누락되었습니다.");
				$("#err").css("display", "inline");
				return;		
			}
			
			if (!/^[가-힣]{1,}$/.test($("#positionName").val()) )
			{
				$("#err").html("입력 항목이 잘못되었습니다.");
				$("#err").css("display", "inline");
				return;		
			}
			
			if ( $("#err").html().trim() == "이미 사용중인 이름이 존재합니다."
					|| $("#err").html().trim() == "사용중인 이름은 등록할 수 없습니다.")
			{
				$("#err").html("사용중인 이름은 등록할 수 없습니다.");
				$("#err").css("display", "inline");
				return;		
			}

			$("#positionForm").submit();
		});
		
	});
	
	function ajaxRequest()
	{
		var errMsg = "";
		
		$.post("positionajax.action"
		, { positionName : $("#positionName").val() }
		, function(data)
		{
			$("#err").html(data).css("display", "inline");

		});
	}
</script>

</head>

<body>

	<!-- -------------------------------------------
     #59. PositionInsertForm.jsp
     - 직위 데이터 입력 폼 페이지
     - 관리자가 접근하는 직위 데이터 입력 폼 페이지
     ------------------------------------------------ -->

		<!-- 메뉴 영역 -->
		<div>
			<c:import url="EmployeeMenu.jsp"></c:import>
		</div>


		<label style="text-align: left;">[직위 관리] > [직위 정보 입력]</label>
		<hr>


		<div align="center">
			<!-- 콘텐츠 영역 -->
			<div id="content"align="left">

				<form action="positioninsert.action" method="post" id="positionForm">

					<div class="form-group">

						<div class="input-group">
							<div class="input-group-addon">직위명</div>
							<input type="text" id="positionName" name="positionName" placeholder="직위명" 
							class="form-control"/>
						</div>
						
						<div class="input-group">
							<div class="input-group-addon">최소기본급</div>
							<input type="text" id="minBasicPay" name="minBasicPay" placeholder="최소기본급" 
							class="form-control"/>
						</div>

						<!-- 이미 사용중인  이름이 존재합니다. -->
						<!--  사용중인 이름은  등록할 수 없습니다. -->
						<span id="err" style="color: red; font-weight: bold; display: none;">
						</span>

						<div class="input-group">
							<div class="btn-group" role="group" style="width: 100%;"></div>
							<button type="button" class="btn btn-primary btn-lg"
								id="submitBtn">직위 추가</button>
							<button type="button" class="btn btn-primary btn-lg" id="listBtn"
								onclick="location.href='positionlist.action'">
								직위 리스트</button>
						</div>
					
					</div>
				
					<br><br>
	
			</form>
		</div>

		<!-- 회사 소개 및 어플리케이션 소개 영역-->
		<div id="footer">
		</div>


	</div>

</body>
</html>