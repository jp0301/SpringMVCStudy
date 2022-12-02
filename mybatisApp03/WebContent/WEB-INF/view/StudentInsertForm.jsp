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
<title>StudentInsert.jsp</title>

<!-- jquery -->
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>


</head>
<body>

<div class="panel title">
	<h1>성적 관리(SpringMVC + Annotation + mybatis 버전)</h1>
</div>


<!--  메인 메뉴 영역  -->
<nav class="navbar navbar-default">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand" href="#">Home</a>
		</div>
		
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li class="active">
					<a href="studentlist.action">학생 관리 <span class="sr-only">(current)</span></a>
				</li>
				<li>
					<a href="gradelist.action">성적 관리</a>
				</li>
				
			</ul>
		</div>
		
	</div>
</nav>






<div class="container">
	<div class="panel-group">
		<div class="panel panel-default">
			<div class="panel-heading">
				<span style="font-size: 17pt; font-weight: bold;" class="col-md-3">학생 데이터 입력</span>
				<span>
				<a href="studentlist.action" role="button" class="btn btn-success btn-xs" id="btnAdd"
				style="vertical-align: bottom;">학생 리스트 출력</a>
				</span>
			</div>
			
			<div class="panel-body">
				
				<form action="studentinsert.action" method="post" id="myForm">
					<table border="1">
						<tr>
							<th>번호(*)</th>
							<td>
								<input type="text" name="sid" id="sid" />
							</td>
						</tr>
						<tr>
							<th>이름(*)</th>
							<td>
							<input type="text" name="name" id="name" 
							maxlength="30" required="required"/>(30자 이내)
							</td>
						</tr>
						<tr>
							<th>전화번호</th>
							<td>
							<input type="tel" name="tel" id="tel" 
							maxlength="40" />(40자 이내)
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<input type="submit" value="SUBMIT" 
								class="btn btn-success btn-default" />
								<span style="font-size: small;">
									(*)는 필수입력 사항입니다.
								</span>
								<span id="errMsg" 
								style="font-size: small; color: red; display: none;">
									필수 입력 사항을 모두 입력해야 합니다.
								</span>
							</td>
						</tr>
					</table>	

				</form>			
				
			</div> <!-- /.panel-body -->
			
		</div> <!-- /.panel .panel-default -->
	</div> <!-- /.panel-group -->
</div> <!-- /.container -->

</body>
</html>