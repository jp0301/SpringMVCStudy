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

	
	<h1 class="titleName" style="margin-bottom: 50px;">학생 정보 리스트</h1>

	<div>
	
		<div class="table">
			<div class="row">
				<div class="cell-title">아이디</div>
				<div class="cell-title">패스워드</div>
				<div class="cell-title">이름</div>
				<div class="cell-title">전화번호</div>
				<div class="cell-title">이메일</div>
			</div>
		
			<c:forEach var="mem" items="${memlist}">
				<div class="row">
					<div class="cell">${mem.id }</div>
					<%-- <div class="cell">${member.pw }</div> --%>
					<div class="cell">(비공개처리 )</div>
					<div class="cell">${mem.name }</div>
					<div class="cell">${mem.tel }</div>
					<div class="cell">${mem.email }</div>
				</div>
			</c:forEach>
			
		</div>
	</div>
	
	
	
	
</div>



</body>
</html>