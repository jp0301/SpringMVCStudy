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
<title>MemberList.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/main.css">
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/table.css">

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>


<script type="text/javascript">

	$(function()
	{
		$(".updateBtn").click(function()
		{
			$(location).attr("href", "memberupdateform.action?id=" + $(this).val());
			//alert($(this).val());
		});
		
		$(".deleteBtn").click(function()
		{
			$(location).attr("href", "memberdelete.action?id=" + $(this).val());
		});
		
	});

</script>

</head>
<body>

<!-- -----------------------------------------------------------------------------
 #08. MemberList.jsp
 - 학생 리스트 출력 페이지
 - [관리자]가 접근하는 학생 리스트 출력 페이지
--------------------------------------------------------------------------------- -->

<div>
	<div>
		<c:import url="MemberMenu.jsp"></c:import>
	</div>

	
	<h1 class="titleName">학생 정보 리스트</h1>

	<div>
		<form action="" >
			<input type="button" class="insertBtn" value="학생 추가" onclick="location.href='memberinsertform.action'">
		</form>
	</div>
	<br><br>

	<div>
	
		<div class="table">
			<div class="row">
				<div class="cell-title">아이디</div>
				<div class="cell-title">패스워드</div>
				<div class="cell-title">이름</div>
				<div class="cell-title">전화번호</div>
				<div class="cell-title">이메일</div>
				<div class="cell-title">수정</div>
				<div class="cell-title">삭제</div>
			</div>
		
			<c:forEach var="member" items="${memberlist}">
				<div class="row">
					<div class="cell">${member.id }</div>
					<div class="cell">${member.pw }</div>
					<div class="cell">${member.name }</div>
					<div class="cell">${member.tel }</div>
					<div class="cell">${member.email }</div>
					<div class="cell-Btn">
						<button type="button" class="updateBtn" value="${member.id}">수정</button>
					</div>
					<div class="cell-Btn">
						<button type="button" class="deleteBtn" value="${member.id}">삭제</button>
					</div>
				</div>
			</c:forEach>
			
		</div>
	</div>
	
	
	
	
</div>



</body>
</html>