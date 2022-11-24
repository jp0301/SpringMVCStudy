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
<title>PositionUpdateForm.jsp</title>
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
		
	
		$("#submitBtn").click(function()
		{
			$("#err").css("display", "none");

			if ( $("#positionName").val() == "" || $("#minBasicPay").val() == "")
			{
				$("#err").html("필수 입력 항목이 누락되었습니다.");
				$("#err").css("display", "inline");
				return;
			}
			$("#positionForm").submit();
		});
		
	});
</script>

</head>


<body>


	<!-- -------------------------------------------
     #64. PositionUpdateForm.jsp
     - 직위 데이터 수정 폼 페이지
     - 관리자가 접근하는 직위 데이터 수정 폼 페이지
     ------------------------------------------------ -->

		<!-- 메뉴 영역 -->
		<div>
			<c:import url="EmployeeMenu.jsp"></c:import>
		</div>


		<label style="text-align: left;">[직위 관리] > [직위 정보 수정]</label>
		<hr>


		<div align="center">
			<!-- 콘텐츠 영역 -->
			<div id="content" align="left">

				<form action="positionupdate.action" method="post" id="positionForm">

					<div class="form-group">

						<div class="input-group">
							<div class="input-group-addon">직위번호</div>
							<input type="text" id="positionId" name="positionId" placeholder="직위번호" 
							class="form-control" value="${position.positionId}" readonly="readonly"/>
						</div>

						<div class="input-group">
							<div class="input-group-addon">직위명</div>
							<input type="text" id="positionName" name="positionName" placeholder="직위명" 
							class="form-control" value="${position.positionName }"/>
						</div>
						
						<div class="input-group">
							<div class="input-group-addon">최소기본급</div>
							<input type="text" id="minBasicPay" name="minBasicPay" placeholder="최소기본급" 
							class="form-control" value="${position.minBasicPay }"/>
						</div>

						<!-- 이미 사용중인  이름이 존재합니다. -->
						<!--  사용중인 이름은  등록할 수 없습니다. -->
						<span id="err" style="color: red; font-weight: bold; display: none;">
						</span>

						<div class="input-group">
							<div class="btn-group" role="group" style="width: 100%;"></div>
							<button type="button" class="btn btn-primary btn-lg"
								id="submitBtn"
								>직위 수정</button>
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