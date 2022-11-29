<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MemberInsert.jsp</title>
</head>
<body>


<div>
	<h1>회원 등록이 완료되었습니다.</h1>
	<hr>
	
	
	<h2><a href="memberinsertform.action">회원 추가 등록</a></h2>
	<h2><a href="memberlist.action">회원 명단 확인</a></h2>
</div>





</body>
</html>