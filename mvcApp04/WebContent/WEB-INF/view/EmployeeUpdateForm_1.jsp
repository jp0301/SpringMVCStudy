<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EmployeeUpdateForm.jsp</title>

<link rel="stylesheet" type="text/css" href="<%=cp%>/css/main.css">
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/jquery-ui.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="<%=cp %>/js/jquery-ui.js"></script>
<script type="text/javascript">
	$(function()
	{
		// AJAX 요청 및 응답 처리
		ajaxRequest();
		
		
		// 직위의 선택된 옵션이 변경되었을 경우 수행할 코드 처리
		$("#positionId").change(function()
		{
			// 테스트
			// alert("test");
			ajaxRequest();
		});
		
		
		//jquery-ui 캘린더(datepiker)를 불러오는 함수 처리
		$("#birthday").datepicker(
		{
			dateFormat : "yy-mm-dd"				// yyyy-mm-dd	
			, changeYear : true
			, changeMonth : true
		});
		
		
		
		// 직원 추가 버튼이 클릭되었을 경우 수행할 코드 처리
		$("#submitBtn").click(function()
		{
			// 에러 안내 초기화
			$("#err").css("display", "none");
			
			
			// 1. 데이터 검사
			//-- 공란(입력항목 누락) 없이 모두 작성되었는지에 대한 여부
			if ($("#name").val() == "" || $("#ssn1").val() == "" || $("#ssn2").val() == ""
					|| $("#birthday").val() == "" || $("#telephone").val() == "" 
					|| $("#basicpay").val() == "" )
			{
				$("#err").html("필수 입력 항목이 누락되었습니다.");
				$("#err").css("display", "inline");
				
				return;
			}
			
			
			// 2. 최소 기본급 유효성 검사
			//-- 입력한 기본급이 최소 기본급보다 작은지에 대한 여부 확인
			// 최소 기본급 → $("#minBasicPay").text()
			// 입력 기본급 →$("#basicPay").val()
			
			if (parseInt($("#minBasicPay").text()) > parseInt($("#basicPay").val()))
			{
				$("#err").html("입력하신 기본급이 최소 기본급보다 작습니다.");
				$("#err").css("display", "inline");
				
				return;
			}
			
			// submit 액션 처리 수행
			$("#employeeForm").submit();
			
		});
		
		// 직원 리스트 버튼이 클릭되었을 경우 수행할 코드 처리
		//onclick="location.href='employeeinsertform.action'"
		$("#listBtn").click(function()
		{
			location.href = "employeelist.action";
		});
		
		
	});
	
	
	function ajaxRequest()
	{
		// jquery.post() / jquery.get()
		// $.post() / $.get()
		//-- jQuery 에서 AJAX를 사용해야 할 경우 지원해 주는 함수.
		//   (서버측에서 요청한 데이터를 받아오는 기능의 함수)
		
		
		// ※ 이 함수( $.post())의 사용 방법(방식)
		//-- $.post(요청주소, 전송데이터, 응답액션처리)
		//   · 요청주소(url)
		//      → 데이터를 요청할 파일에 대한 정보
		//   · 전송데이터(data)
		//      → 서버 측에 요청하는 과정에서 내가 전달할 파라미터
		//   · 응답액션처리(function)
		//      → 응답을 받을 수 있는 함수
		//         여기서는 익명의 함수를 사용 → 단순 기능 구현 및 적용
		// ※ 참고로 data는 파라미터의 데이터타입을 그대로 취하게 되므로
		//    html 이든, 문자열 이든 상관이 없다.
		$.post(
		"ajax.action"
		, {positionId : $("#positionId").val()}
		, function(args) {$("#minBasicPay").html(args);}
		);
		
	};

</script>
	

</head>
<body>


	<!-- -------------------------------------------
     #20. EmployeeInsertForm.jsp
     - 직원 데이터 입력 폼 페이지
     - 관리자가 접근하는 직원 데이터 입력 폼 페이지
     ------------------------------------------------ -->
	
	<div>
		<!-- 메뉴 영역 -->
		<div>
			<c:import url="EmployeeMenu.jsp"></c:import>
		</div>
		
		<!-- 콘텐츠 영역 -->
		<div id="content">
			
			<h1>[직원 수정]</h1>
			<hr>
			
			<form action="employeeupdate.action" method="post" id="employeeForm">
				<table>
					<tr>
						<th>사원번호</th>
						<td>
							<input type="text" id="employeeId" name="employeeId" readonly="readonly"
							value="${employee.employeeId }"/>
						</td>
					</tr>
				
				
				
					<tr>
						<th>이름</th>
						<td>
							<input type="text" id="name" name="name" placeholder="이름" 
							value="${employee.name }"/>
						</td>
					</tr>
					<tr>
						<th>주민번호</th>
						<td>
							<input type="text" id="ssn1" name="ssn1"
								style="width: 100px;"
								value="${employee.ssn1 }"> - 
							<input type="password" id="ssn2" name="ssn2"
								style="width: 110px;">
						</td>
					</tr>
					<tr>
						<th>생년월일</th>
						<td>
							<input type="text" id="birthday" name="birthday"
							 placeholder="생년월일" 
							 value="${employee.birthday }"/>
						</td>
					</tr>
					<tr>
						<th>양/음력</th>
						<td>
							<input type="radio" value="0" name="lunar" id="lunar0"
							${employee.lunar ==0 ? "checked=\"checked\"" : "" } >
							<label for="lunar0">양력</label>
							<input type="radio" value="1" name="lunar" id="lunar1" 
							${employee.lunar == 1 ? "checked=\"checked\"" : "" } >
							<label for="lunar1">음력</label>
						</td>
					</tr>
					
					<tr>
						<th>전화번호</th>
						<td>
							<input type="tel" id="telephone" name="telephone" placeholder="ex) 010-1234-1234"
							value="${employee.telephone }">
						</td>
					</tr>
					
					
					<tr>
						<th>지역</th>
						<td>
							<select id="regionId" name="regionId">
								<!--
 								<option value="1">마포</option>
								<option value="2">서초</option>
								<option value="3">은평</option>
								-->
								<c:forEach var="region" items="${regionList}">
									<option value="${region.regionId}"
										${employee.regionId == region.regionId ? "selected=\"selected\"" : ""}>
										${region.regionName}
									</option>
								</c:forEach>
								
							</select>
						</td>
					</tr>
					
					<tr>
						<th>부서</th>
						<td>
							<select id="departmentId" name="departmentId">
								<c:forEach var="department" items="${departmentList}">
									<option value="${department.departmentId}"
									${employee.departmentId == department.departmentId ? "selected=\"selected\"" : ""}>
										${department.departmentName}
									</option>
								</c:forEach>
							</select>
						</td>
					</tr>
					
									
					
					<tr>
						<th>직위</th>
						<td>
							<select id="positionId" name="positionId">
								<c:forEach var="position" items="${positionList}">
									<option value="${position.positionId}"
										${position.positionId == department.positionId ? "selected=\"selected\"" : ""}>
										${position.positionName}
									</option>
								</c:forEach>
							</select>
						</td>
					</tr>
					
					<tr>
						<th>기본급</th>
						<td>
							<input type="text" id="basicPay" name="basicPay"
							value="${employee.basicPay }">
							(최소 기본급 
							<span id="minBasicPay" style="color: red; font-weight: bold;">
								0
							</span>
							원)
						</td>
					</tr>			
					<tr>
						<th>수당</th>
						<td>
							<input type="text" id="extraPay" name="extraPay"
							value="${employee.extraPay }">
						</td>
					</tr>
					<tr>
						<td colspan="2" align="center">
							<br><br>
							
							<button type="button" id="submitBtn" class="btn btn-primary"
							style="width: 40%;">직원 수정</button>
							<button type="button"  id="listBtn" class="btn btn-primary"
							style="width: 40%;">직원 리스트</button>
							<br><br>
							
							<span id="err" style="color: red; font-weight: bold; display: none;">
							
							</span>
							
						</td>
					</tr>

					
				</table>
			</form>		

			
		</div>
		
			
		<!-- 회사 소개 및 어플리케이션 소개 영역-->
		<div id="footer">
			
			
			
			
		</div>
		
		
		
		
	</div>
	


</body>
</html>