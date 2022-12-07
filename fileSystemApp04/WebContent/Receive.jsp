<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%
	String name= request.getParameter("name");
	String upload = request.getParameter("upload");

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
	<h1>관찰</h1>
	<hr>
</div>



<div>
	<h2>이름 : <%=name %></h2><br />
	<h2>파일 : <%=upload %></h2><br />
</div>
<!--  
	『Send.jsp』의 form 엘리먼트 enctype 속성을
	『enctype="multipart/form-data"』와 같이 구성할 경우
	form 의 내용을 바이너리 값의 형태로 전송한다는 의미이며,
	이와 같이 전송할 경우 수신된 데이터는
	---------------------
	이름 : null
	파일 : null
	---------------------
	로 확인된다.
	
	==> 바이너리 값을 getParmeter() 를 통해 수신할 수 없다는 의미이다.
-->

</body>
</html>