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
<title>EmpList.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/main.css">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">


<link rel="stylesheet" type="text/css" href="<%=cp%>/css/mainStyle.css">

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

</head>
<body>


	<!-- -----------------------------------------------------------------------------
     #33. EmpList.jsp
     - 직원 리스트 출력 페이지
	 - 일반 직원이 접근하는 직원 리스트 출력 페이지
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
			<table id="customers" class="table">
				<tr>
					<th>번호</th>
					<th>이름</th>
					<th>주민번호</th>
					<th>생년월일</th>
					<th>양/음력</th>
					<th>전화번호</th>
					<th>지역</th>
					<th>부서</th>
					<th>직위</th>
				</tr>
				
				<c:forEach var="emp" items="${emplist}">
				<tr>
					<%-- MemberDTO 객체의 getMid(), getName(), getTelePhone() 메소드를 호출하는 EL 표현 --%>
					<td>${emp.employeeId }</td>
					<td>${emp.name }</td>
					<td>${emp.ssn1 }-*******</td>
					<td>${emp.birthday }</td>
					<td>${emp.lunarName }</td>
					<td>${emp.telephone }</td>
					<td>${emp.regionName }</td>
					<td>${emp.departmentName }</td>
					<td>${emp.positionName }</td>
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