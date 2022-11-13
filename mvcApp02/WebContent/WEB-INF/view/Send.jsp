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
<title>Send.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/main.css">
</head>
<body>

<div>
	<h1>Spring MVC 데이터 송수신 실습</h1>
	<hr>
</div>

<div>
	<!-- <form action="Receive.jsp" method="post"> -->
	<form action="receive.action" method="post">
		이름 <input type="text" name="userName" class="txt">
		<button type="submit" class="btn">submit</button>
	</form>
</div>

<p>
나중에 작업할때는 jsp 파일을 WebContent에 넣어놓고 확인할거 다한다음에 view에 넣고
돌려도 된다.
</p>

</body>
</html>