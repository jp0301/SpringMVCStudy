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
<title>Write.jsp</title>
</head>
<body>

<div>
	<h1>파일 업로드</h1>
	<hr>
</div>

<div>
	<form action="Write_ok.jsp" method="post" encType="multipart/form-data">
		작성자 : <input type="text" name="userName" >
		제목 : <input type="text" name="subject" >
		파일 : <input type="file" name="uploadFile" >
		<br>
		
		<input type="submit" value="파일올리기"><br>		
	</form>
</div>






</body>
</html>


