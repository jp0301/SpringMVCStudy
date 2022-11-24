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
<title>PosList.jsp</title>
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


</head>
<body>

	<!-- -----------------------------------------------------------------------------
     #71. PosList.jsp
     - 직위 리스트 출력 페이지
	 - 일반 직원이 접근하는 직위 리스트 출력 페이지
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

			<br><br>
			
			<table id="customers" class="table">
				<tr>
					<th>번호</th>
					<th style="width: 200px;">직위명</th>
					<th>최소기본급</th>

				</tr>
				
				<c:forEach var="pos" items="${poslist}">
					<tr>
						<td>${pos.positionId}</td>
						<td>${pos.positionName}</td>
						<td>${pos.minBasicPay }</td>

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