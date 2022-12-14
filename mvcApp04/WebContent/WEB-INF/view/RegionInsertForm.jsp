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

	$(function() {
		
		//에러(span 엘리먼트) 안내 초기화
		$("#err").css("display","none");
		
		
		//키업
		$("#regionName").keyup(function()
		{
			/* ★ 내가 적은 풀이 ★
			var inputRegionName = $(this).val();
			
			if (inputRegionName.replace(" ", "") == "")
			{
				$("#err").css("display", "none");
				return;
			}
			
			ajaxRequest(); 
			*/
			
			
			// ★★★ 함께한 풀이 ★★★
			// keyup 이벤트가 발생할 때마다
			// 실시간으로 입력값을 담아둘 변수 구성
			var search = $(this).val();
			
			// 입력 내용이 존재할 경우에만
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
		
		
		//-- 지역 추가 버튼이 클릭되었을 때 수행해야 할 코드 처리
		$("#submitBtn").click(function()
		{
			
			//1. 데이터 검사
			
			//1-①. 입력항목 누락여부 확인 → 작성된건지...
			if( $("#regionName").val() == "")
			{
				$("#err").html("입력 항목이 누락되었습니다.");
				$("#err").css("display", "inline");
				return;		
			}
			
			//1-②. 입력항목 유형 확인 → 한글 완성형인지...
			if (!/^[가-힣]{1,}$/.test($("#regionName").val()) )
			{
				$("#err").html("입력 항목이 잘못되었습니다.");
				$("#err").css("display", "inline");
				return;		
			}
			
			// 2. 중복확인 유효성 검사 → 중복된 값임을 확인했는데 추가하는지....
			if ( $("#err").html().trim() == "이미 사용중인 이름이 존재합니다."
					|| $("#err").html().trim() == "사용중인 이름은 등록할 수 없습니다.")
			{
				$("#err").html("사용중인 이름은 등록할 수 없습니다.");
				$("#err").css("display", "inline");
				return;		
			}

			
			$("#regionForm").submit();
		});
		
	});
	
	
	
	function ajaxRequest()
	{
		var errMsg = "";
		
		$.post("regionajax.action"
		, { regionName : $("#regionName").val() }
		, function(data)
		{
			
			/*
			if($.trim(data) == $("#regionName").val())
			{
				errMsg = "이미 사용중인 이름이 존재합니다.";
			}
			else
			{
				errMsg = "사용할 수 있는 이름입니다."
			}
			
			$("#err").html(errMsg).css("display", "inline"); 
			*/
			
			$("#err").html(data).css("display", "inline");

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

				<form action="regioninsert.action" method="post" id="regionForm">

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