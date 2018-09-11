<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>AdminLTE 2 | Registration Page</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.7 -->
  <link rel="stylesheet" href="resources/main/bower_components/bootstrap/dist/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="resources/main/bower_components/font-awesome/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="resources/main/bower_components/Ionicons/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="resources/main/dist/css/AdminLTE.min.css">
  <!-- iCheck -->
  <link rel="stylesheet" href="resources/main/dist/css/blue.css">
  <!-- Google Font -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
  
</head>
<body class="hold-transition register-page">
<div class="register-box">
  <div class="register-logo">
    <a href="redirect:/"><b>Plan</b>Man</a>
  </div>

  <div class="register-box-body">
    	<p class="login-box-msg">취미 직업 정보 입력하기</p>
		<form id="writeform" action="finallyjoinin"  method="post" 	onsubmit="return formCheck();">
		<div class="form-group has-feedback">
			<input id="id" type="text" value="${sessionScope.member.id }" class="form-control" readonly="readonly" name="id">
	        <span class="glyphicon glyphicon-user form-control-feedback"></span>
     	</div>
		
		<div class="form-group has-feedback" align="center" >
        	 <div align="center">직업</div>
			    <select id="job" name="job" class="form-control">
			  	<option value="student" selected="selected">학생</option>
			  	<option value="worker">회사원</option>
			  </select>	  
      	</div>
      	
		<div class="form-group has-feedback">
        	<input id="hobby" type="text" class="form-control" name="hobby" placeholder="hobby">
     	</div>
     	
		<div>
		  <input type="submit" class="btn btn-primary btn-block btn-flat" value="직업 취미 입력하기" />	
        </div>

	</form>
   
  </div>
  <!-- /.form-box -->
</div>
<!-- /.register-box -->

<!-- jQuery 3 -->
<script src="resources/main/bower_components/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="resources/main/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- iCheck -->
<script src="resources/main/dist/js/icheck.min.js"></script>
<script>
//글쓰기폼 확인
function formCheck() {
	var job = document.getElementById('job');
	var hobby = document.getElementById('hobby');
	
	if (job.value.length < 1) {
		alert("직업 입력해라.");
		id.focus();
		id.select();
		return false;
	}
	if (hobby.value.length < 1) {
		alert("취미 입력해라");
		id.focus();
		id.select();
		return false;
	}
	return true;
}
</script>
</body>
</html>
