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
<title>MemberMenu.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/main.css">

<style type="text/css">
	.menubar
	{
		height: 35px;
		margin: 15px;
		display: flex;
	}


	.title
	{
		width: 120px;
		display: flex;
		justify-content: center;
		text-align: center;
		margin: 0px 10px 0px 0px;
	}

	.menu
	{
		margin-left: 5px;
		margin-right: 5px;
		width: 120px;
		font-size: 14px;
		color: #B6CAD7;
		text-align: center;
		line-height: 35px;
		text-decoration-line: none;
		border: 1px solid #B6CAD7;
		border-radius: 7px;
		transition: all 0.5s;
	}
	.menu:hover
	{
		color: #fff;
		border: 1px solid #fff;
		background-color: #0099FF;
		transform: scale(1.2);
		transition: all 0.5s;
	}
	
	.logout
	{
		margin-left: auto;
		width: 120px;
		font-size: 14px;
		color: #B6CAD7;
		text-align: center;
		line-height: 35px;
		text-decoration-line: none;
		
		border: 1px solid #B6CAD7;
		border-radius: 7px;
		
		transition: all 0.5s;
	}
	
	.logout:hover
	{
		color: #fff;
		border: 1px solid #fff;
		background-color: #0099FF;
		transform: scale(1.2);
		transition: all 0.5s;
	}


</style>

</head>
<body>


	<!-- -----------------------------------------------------------------------------
     #07. MemberMenu.jsp
     - 멤버 메뉴
     --------------------------------------------------------------------------------- -->

<div>

	<div class="menubar">
				<h2 class="title">SIST...@"</h2>
				
				<c:choose>
					<c:when test="${sessionScope.admin == null }">
						<a href="memlist.action" class="menu">학생정보</a>	
					</c:when>
					<c:otherwise>
						<a href="memberlist.action" class="menu">학생정보</a>	
					</c:otherwise>
				</c:choose>		
			
				<c:choose>
					<c:when test="${sessionScope.admin == null }">
						<a href="memreclist.action" class="menu">성적정보</a>
					</c:when>
					<c:otherwise>
						<a href="memberrecordlist.action" class="menu">성적정보</a>	
					</c:otherwise>
				</c:choose>	
				<div style="font-size: 14px; margin-left: auto; height: 35px; line-height: 35px;">${sessionScope.name} 님 환영합니다.</div>
				<a href="logout.action" class="logout">로그아웃</a>
	</div>
	<hr>
</div>





</body>
</html>