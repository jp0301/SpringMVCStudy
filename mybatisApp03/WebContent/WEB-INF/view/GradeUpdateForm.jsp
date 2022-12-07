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
<title>StudentUpdateForm.jsp</title>

<!-- jquery -->
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>


<script type="text/javascript">

	$(function() {
		
		$("#sub1").on("keyup", function() {
			$.ajax({
				type: "POST",
				url: "ajax.action",
				dataType: "text",
				data: $(this).serialize(),
				success: function(data) {
					if(data > 100 || data < 0) {
						$("#basic-addon2").css("color", "white");
						$("#basic-addon2").css("background-color", "red");
						
						$("#sub1_Warning").css("color", "white");
						$("#sub1_Warning").css("background-color", "red");
					}
					else
					{
						$("#basic-addon2").removeAttr("style");
						$("#sub1_Warning").removeAttr("style");
					};
				}
			});
		});
		
		$("#sub2").on("keyup", function() {
			$.ajax({
				type: "POST",
				url: "ajax2.action",
				dataType: "text",
				data: $(this).serialize(),
				success: function(data) {
					if(data > 100 || data < 0) {
						$("#basic-addon3").css("color", "white");
						$("#basic-addon3").css("background-color", "red");
						
						$("#sub2_Warning").css("color", "white");
						$("#sub2_Warning").css("background-color", "red");
					}
					else
					{
						$("#basic-addon3").removeAttr("style");
						$("#sub2_Warning").removeAttr("style");
					};
				}
			});
		});
		
		$("#sub3").on("keyup", function() {
			$.ajax({
				type: "POST",
				url: "ajax3.action",
				dataType: "text",
				data: $(this).serialize(),
				success: function(data) {
					if(data > 100 || data < 0) {
						$("#basic-addon4").css("color", "white");
						$("#basic-addon4").css("background-color", "red");
						
						$("#sub3_Warning").css("color", "white");
						$("#sub3_Warning").css("background-color", "red");
					}
					else
					{
						$("#basic-addon4").removeAttr("style");
						$("#sub3_Warning").removeAttr("style");
					};
				}
			});
		});
		
		
		
		$("#submitBtn").click(function() {
		
			if( $("#sub1").val() < 0 || $("#sub1").val() > 100
				||  $("#sub2").val() < 0 || $("#sub2").val() > 100 
				||   $("#sub3").val() < 0 || $("#sub3").val() > 100 ) {
				alert("값을 제대로 입력해주세요~!!!");
				return;
			}
			
			$("#myForm").submit();
		});
	
		
		
		
			
		
	});
	

	

</script>



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
				<li >
					<a href="studentlist.action">학생 관리 <span class="sr-only">(current)</span></a>
				</li>
				<li class="active">
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
				<span style="font-size: 17pt; font-weight: bold;" class="col-md-3">학생 데이터 수정</span>
				<span>
				<a href="gradelist.action" role="button" class="btn btn-success btn-xs" id="btnAdd"
				style="vertical-align: bottom;">학생 리스트 출력</a>
				</span>
			</div>
			
			<div class="panel-body">
				
				<form action="gradeupdate.action?sid=${grade.sid }" method="post" id="myForm">
					<table class="table table-striped">
						<tr>
							<td>
								<div class="input-group" role="group">
									<span class="input-group-addon" id="basic-addon1">
										번호
										<sup style="color:red;">※</sup>
									</span>
									<input type="text" id="sid" name="sid" class="form-control"
									placeholder="sid" maxlength="30" disabled="disabled" value="${grade.sid}">
									<span class="input-group-addon"></span>
								</div>
							</td>
						</tr>
						
						<tr style="height: 10px;">
						</tr>
						
						<tr>
							<td>
								<div class="input-group" role="group">
									<span class="input-group-addon" id="basic-addon2">
										성적1
										<sup style="color:red;">※</sup>
									</span>
									<input type="text" id="sub1" name="sub1" class="form-control"
									placeholder="sub1" maxlength="30" required="required" value="${grade.sub1}">
									<span class="input-group-addon" id="sub1_Warning">
										0~100자 이내
									</span>
								</div>
							</td>
						</tr>
						
						<tr style="height: 10px;">
						</tr>
						
						<tr>
							<td>
								<div class="input-group" role="group">
									<span class="input-group-addon" id="basic-addon3">
										성적2
										<sup style="color:red;">※</sup>
									</span>
									<input type="text" id="sub2" name="sub2" class="form-control"
									placeholder="sub2" maxlength="30" required="required" value="${grade.sub2}">
									<span class="input-group-addon" id="sub2_Warning">
										0~100자 이내
									</span>
								</div>
							</td>
						</tr>
							
						<tr style="height: 10px;">
						</tr>
						
						<tr>
							<td>
								<div class="input-group" role="group">
									<span class="input-group-addon" id="basic-addon4">
										성적3
										<sup style="color:red;">※</sup>
									</span>
									<input type="text" id="sub3" name="sub3" class="form-control"
									placeholder="sub3" maxlength="30" required="required" value="${grade.sub3}">
									<span class="input-group-addon" id="sub3_Warning">
										0~100자 이내
									</span>
								</div>
							</td>
						</tr>
							
						<tr style="height: 10px;">
						</tr>
						
						<tr>
							<td colspan="2" style="text-align: center;">
								<button type="button" class="btn btn-success" id="submitBtn">수정</button>
								<button type="reset" class="btn btn-default">취소</button>
								<br>
								
								<span style="font-size: small;">(※)는 필수입력 사항입니다.</span>
								<span style="font-size: small; color:red; display: none;" >
									필수 입력 사항을 모두 입력해야합니다.
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