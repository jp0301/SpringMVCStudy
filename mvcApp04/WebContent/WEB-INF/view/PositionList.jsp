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
<title>PositionList.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/main.css">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/mainStyle.css">
<style type="text/css">
	#customers
	{
		width: 40%;
	}

</style>

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script type="text/javascript">

	$(function() {
		
		$(".btnUpdate").click(function() {
			
			//alert("테스트 업데이트버튼");
			
			$(location).attr("href", "positionupdateform.action?positionId=" + $(this).val());
		});
		
	$(".btnDelete").click(function() {
			//alert("테스트 업데이트버튼");
			
			$(location).attr("href", "positiondelete.action?positionId=" + $(this).val());
		});
		
	});
</script>

</head>
<body>

	<!-- -----------------------------------------------------------------------------
     #57. PositionList.jsp
     - 직위 리스트 출력 페이지
	 - 관리자가 접근하는 직위 리스트 출력 페이지
	   (일반 직원이 접근하는 직위 리스트 출력 페이지는 PosList.jsp 로 구성할 예정)
     --------------------------------------------------------------------------------- -->
	
	<div>
		<!-- 메뉴 영역 -->
		<div>
			<c:import url="EmployeeMenu.jsp"></c:import>
		</div>
		
		<h1>[직원 관리] > [직원 리스트]</h1>
		<hr>
		
		<!-- 콘텐츠 영역 -->
		<div id="content">
			<div>
				<form action="">
					<input type="button" value="직위 추가" class="btn btn-primary"
					onclick="location.href='positioninsertform.action'">
				</form>
			</div>
			<br><br>
			
			<table id="customers" class="table">
				<tr>
					<th>번호</th>
					<th style="width: 200px;">직위명</th>
					<th>최소기본급</th>
					<th>수정</th>
					<th>삭제</th>
				</tr>
				
				<c:forEach var="position" items="${positionList}">
					<tr>
						<td>${position.positionId}</td>
						<td>${position.positionName}</td>
						<td>${position.minBasicPay }</td>
						<td>
							<button type="button" class="btn btn-primary btn-xs btnUpdate"
							value="${position.positionId }">
							수정
							</button>
						</td>
						<td>
							<button type="button"
							value="${position.positionId}"
							${position.delCheck == 0 ?  "class=\"btn btn-danger btnDelete btn-xs\"" : "class=\"btn btn-xs\"" }
							${position.delCheck == 0 ?  "" : "disabled=\"disabled\"" }
							>
							삭제
							</button>
						</td>
					</tr>
				</c:forEach>
			</table>
					
		</div>
		
		<!-- 회사 소개 및 어플리케이션 소개 영역-->
		<div id="footer">
			
		</div>
	</div>

</body>
</html>