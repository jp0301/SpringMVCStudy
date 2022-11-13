<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	// 예전방식으로 한다면ㄴ
	//이전 페이지 (ReceiveController.java)로부터 데이터 수신
	//--userName(Send.jsp가 넘긴 데이터가 아니라 Controller 가 가공한 데이터)
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Receive.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/main.css">
</head>
<body>

<div>
	<h1>Spring MVC 데이터 송수신 실습</h1>
	<hr>
</div>

<div>
	<h2>안녕하세요~! ${userName}</h2>
</div>

</body>
</html>