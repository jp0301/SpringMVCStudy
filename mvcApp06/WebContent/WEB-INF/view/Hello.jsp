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
<title>Hello.jsp</title>
</head>
<body>

<!-- 뷰(view) 페이지 -->
<!-- → Model 객체의 정보를 수신해서 출력하는 처리 -->

<div>
	<h1>결과 출력</h1>
	<hr>
</div>

<div>
	<h2>${hello}</h2>
</div>

</body>
</html>