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
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/table2.css">

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>


<script type="text/javascript">

	$(function()
	{
		$(".updateBtn").click(function()
		{
			$(location).attr("href", "memberrecordupdateform.action?scoreId=" + $(this).val());
			//alert($(this).val());
		});
		
		$(".deleteBtn").click(function()
		{
			$(location).attr("href", "memberrecorddelete.action?scoreId=" + $(this).val());
		});
		
	});

</script>

</head>
<body>

<div>
	<div>
		<c:import url="MemberMenu.jsp"></c:import>
	</div>

	
	<h1 class="titleName">학생 성적 리스트</h1>

	<div>
		<form action="" >
			<input type="button" class="insertBtn" value="성적 추가" onclick="location.href='memberrecordinsertform.action'">
		</form>
	</div>
	<br><br>

	<div>
	
		<div class="table">
			<div class="row">
				<div class="cell-title">번호</div>
				<div class="cell-title">국어</div>
				<div class="cell-title">영어</div>
				<div class="cell-title">수학</div>
				<div class="cell-title">아이디</div>
				<div class="cell-title">수정</div>
				<div class="cell-title">삭제</div>
			</div>
		
			<c:forEach var="memberrecord" items="${memberrecordlist}">
				<div class="row">
					<div class="cell">${memberrecord.scoreId }</div>
					<div class="cell">${memberrecord.kor }</div>
					<div class="cell">${memberrecord.eng }</div>
					<div class="cell">${memberrecord.mat }</div>
					<div class="cell">${memberrecord.id }</div>
					<div class="cell-Btn">
						<button type="button" class="updateBtn" value="${memberrecord.scoreId}">수정</button>
					</div>
					<div class="cell-Btn">
						<button type="button" class="deleteBtn" value="${memberrecord.scoreId}">삭제</button>
					</div>
				</div>
			</c:forEach>
			
		</div>
	</div>
	
	
</div>


</body>
</html>