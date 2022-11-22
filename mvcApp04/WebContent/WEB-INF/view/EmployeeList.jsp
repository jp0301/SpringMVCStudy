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
<title>EmployeeList.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/main.css">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">


<link rel="stylesheet" type="text/css" href="<%=cp%>/css/mainStyle.css">

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script type="text/javascript">
	
	$(function() 
	{
		$(".updateBtn").click(function()
		{
			$(location).attr("href", "employeeupdateform.action?employeeId=" + $(this).val());
			
		});
		
		$(".deleteBtn").click(function()
		{
			if (confirm("현재 선택한 데이터를 정말 삭제하시겠습니까?"))
				$(location).attr("href", "employeedelete.action?employeeId=" +$(this).val());
		});
		
	});
	
	
	
</script>

</head>
<body>


	<!-- -----------------------------------------------------------------------------
     #14. EmployeeList.jsp
     - 직원 리스트 출력 페이지
	 - 관리자가 접근하는 직원 리스트 출력 페이지
	   (일반 직원이 접근하는 직원 리스트 출력 페이지는 EmpList.jsp 로 구성할 예정)
     --------------------------------------------------------------------------------- -->
	
	<div>
		<!-- 메뉴 영역 -->
		<div>
			<c:import url="EmployeeMenu.jsp"></c:import>
		</div>
		
		<!-- 콘텐츠 영역 -->
		<div id="content">
			
			<h1>[직원 관리] > [직원 리스트]</h1>
			<hr>
			
			<div>
				<form action="" >
					<input type="button" value="직원 추가" class="btn btn-primary"
					onclick="location.href='employeeinsertform.action'">
				</form>
				

				
			</div>
			<br><br>
			
			<!-- --------------------------------------------------------------------
			EMPLOYEEID NAME SSN BIRTHDAY LUNAR LUNARNAME TELEPHONE 
			DEPARTMENTNAME POSITIONNAME REGIONNAME
			BASICPAY EXTRAPAY PAY GRADE                 
			--------------------------------------------------------------------- -->
			
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
					<th>기본급</th>
					<th>수당</th>
					<th>급여</th>
					<th>등급</th>
					
					<th>수정</th>
					<th>삭제</th>
				</tr>
				
				<c:forEach var="employee" items="${employeeList}">
				<tr>
					<%-- MemberDTO 객체의 getMid(), getName(), getTelePhone() 메소드를 호출하는 EL 표현 --%>
					<td>${employee.employeeId }</td>
					<td>${employee.name }</td>
					<td>${employee.ssn }-*******</td>
					<td>${employee.birthday }</td>
					<td>${employee.lunarName }</td>
					<td>${employee.telephone }</td>
					<td>${employee.regionName }</td>
					<td>${employee.departmentName }</td>
					<td>${employee.positionName }</td>
					
					
					<%-- <td>${employee.basicPay }</td> --%>
					<td>
						<fmt:formatNumber value="${employee.basicPay}" groupingUsed="true"></fmt:formatNumber>	
					</td>
					
					<%-- <td>${employee.extraPay }</td> --%>
					<td>
						<fmt:formatNumber value="${employee.extraPay}" groupingUsed="true"></fmt:formatNumber>
					</td>
					<%-- <td>${employee.pay }</td> --%>	
					<td>
						<fmt:formatNumber value="${employee.pay}" groupingUsed="true"></fmt:formatNumber>
					</td>
					
								
					<%-- <td>${employee.grade }</td> --%>
					<%--
					<td>
						<c:choose>
							<c:when test="${employee.grade eq '0'}">관리자</c:when>
							<c:when test="${employee.grade eq '1'}">일반사원</c:when>
						</c:choose>
					</td>
					--%>
					
					<td>${employee.grade == 0 ? "관리자" : "일반사원" }</td>
					
					<td>
					<%-- value="${employee.employeeId} --%>
					<button type="button" class="btn btn-primary control updateBtn"
					value="${employee.employeeId}">
						수정
					</button>
					</td>
					
					<td><button type="button" class="btn btn-primary control deleteBtn"
					value="${employee.employeeId}">삭제</button></td>
				</tr>
				</c:forEach>
				
				<!--
 				<tr>	
					<td>3</td>
					<td>조현하</td>
					<td>981212</td>
					<td>1998-12-12</td>
					<td>양력</td>
					<td>010-1234-1234</td>
					<td>서울</td>
					<td>개발부</td>
					<td>사원</td>
					<td>1500000</td>
					<td>1500000</td>
					<td>3000000</td>
					<td>관리자</td>
					
					<td><button type="button" class="btn">수정</button></td>
					<td><button type="button" class="btn">삭제</button></td>
				</tr>
				-->
			</table>			

			
		</div>
		
		
		<!-- 회사 소개 및 어플리케이션 소개 영역-->
		<div id="footer">
			
		</div>
		
		
		
		
	</div>
	







</body>
</html>