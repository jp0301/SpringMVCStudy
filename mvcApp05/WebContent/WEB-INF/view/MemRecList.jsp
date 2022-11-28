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
<title>MemRecList.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/main.css">
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/table2.css">

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>


</head>
<body>

<div>
	<div>
		<c:import url="MemberMenu.jsp"></c:import>
	</div>

	
	<h1 class="titleName" style="margin-bottom: 30px;">학생 성적 리스트</h1>

	<br><br>

	<div>
	
		<div class="table">
			<div class="row">
				<div class="cell-title">번호</div>
				<div class="cell-title">국어</div>
				<div class="cell-title">영어</div>
				<div class="cell-title">수학</div>
				<div class="cell-title">아이디</div>

			</div>
		
			<c:forEach var="memrec" items="${memreclist}">
				<div class="row">
					<div class="cell">${memrec.scoreId }</div>
					<div class="cell">${memrec.kor }</div>
					<div class="cell">${memrec.eng }</div>
					<div class="cell">${memrec.mat }</div>
					<div class="cell">${memrec.id }</div>
				</div>
			</c:forEach>
			
		</div>
	</div>
	
	
</div>


</body>
</html>