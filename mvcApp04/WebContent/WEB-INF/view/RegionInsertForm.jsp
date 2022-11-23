<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	request.setCharacterEncoding("UTF-8");
String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RegionInsertForm.jsp</title>
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

	$("#err").css("display","none");

	$(function() {
	
		//키업
		$("#regionName").keyup(function()
		{
			var regionName = $(this).val();
			
			
			if ()
			{
				
			}
			
			
			
		});
		

		
		//-- 지역 추가 버튼 눌렀을 때
		$("#submitBtn").click(function()
		{
			ajaxRequest();			
		});
		
	});
	
	
	function ajaxRequest()
	{
		var errMsg = "";
		
		$.post("regionajax.action"
		, { regionName : $("#regionName").val() }
		, function(data)
		{
			
			if($.trim(data) == $("#regionName").val())
			{
				errMsg = "이미 사용중인 이름이 존재합니다.";
				$("#regionName").val("");
			}
			else
			{
				errMsg = "사용할 수 있는 이름입니다."
			}
			
			$("#err").html(errMsg).css("display", "inline");
		});
	}
	


</script>


</head>


<body>


	<!-- -------------------------------------------
     #37. RegionInsertForm.jsp
     - 지역 데이터 입력 폼 페이지
     - 관리자가 접근하는 지역 데이터 입력 폼 페이지
     ------------------------------------------------ -->

		<!-- 메뉴 영역 -->
		<div>
			<c:import url="EmployeeMenu.jsp"></c:import>
		</div>


		<label style="text-align: left;">[지역 관리] > [지역 정보 입력]</label>
		<hr>


		<div align="center">
			<!-- 콘텐츠 영역 -->
			<div id="content"align="left">

				<form action="regioninsert.action" method="post" id="employeeForm">

					<div class="form-group">

						<div class="input-group">
							<div class="input-group-addon">지역명</div>
							<input type="text" id="regionName" name="regionName" placeholder="지역명" 
							class="form-control"/>
						</div>

						<!-- 이미 사용중인  이름이 존재합니다. -->
						<!--  사용중인 이름은  등록할 수 없습니다. -->
						<span id="err" style="color: red; font-weight: bold; display: none;">
						</span>

						<div class="input-group">
							<div class="btn-group" role="group" style="width: 100%;"></div>
							<button type="button" class="btn btn-primary btn-lg"
								id="submitBtn">지역 추가</button>
							<button type="button" class="btn btn-primary btn-lg" id="listBtn"
								onclick="location.href='regionlist.action'">
								지역 리스트</button>
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