<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <title>Welcome Planman</title>
  <!-- Bootstrap 3.3.7 -->
  <link rel="stylesheet" href="./resources/main/bower_components/bootstrap/dist/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="./resources/main/bower_components/font-awesome/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="./resources/main/bower_components/Ionicons/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="./resources/main/dist/css/AdminLTE.min.css">
  <!-- Google Font -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
  
</head>
<body class="hold-transition login-page">
<div class="login-box">
   <div class="login-logo"> 
   <img src="./resources/images/planmanlogo(2).png" > <!--  <a href="redirect:/"> <b>Plan</b>Man</a> --> 
   <img src="./resources/images/PMcha(3).gif">
   </div> 
  <!-- /.login-logo -->
  <div class="login-box-body">
    <p class="login-box-msg">로그인 하기</p>

    <form action="doLogin" method="post" onsubmit="return loginChk()">
      <div class="form-group has-feedback">
        <input type="text" class="form-control" name='id' id="id" placeholder="ID">
        <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
      </div>
      <div class="form-group has-feedback">
        <input type="password" class="form-control" name='password' id="password" placeholder="Password">
        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
      </div>
      <div class="row">
       
        <!-- /.col -->
        <div align="right">
          <button type="submit" style="width: 120px;" class="btn btn-primary btn-block btn-flat">로그인</button>
        </div>
        <!-- /.col -->
      </div>
    </form>
	<div align="right">
    <a href="gotoSignIn" class="text-center">회원가입 하기</a>
	</div>

  </div>
  <!-- /.login-box-body -->
</div>
<!-- /.login-box -->

<!-- jQuery 3 -->
<script src="./resources/main/bower_components/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="./resources/main/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

<script>
var doccc = '<script src="https:/';
doccc += '/unpkg.com/sweetalert/dist/sweetalert.min.js"></';
doccc += 'script>';
document.write(doccc);
$(function(){ 
	$(document).ready(function (){
		var res = '';
		res += "${loginResult}";
		if(res == 'loginfail'){
			swal("아이디나 비밀번호를 잘못 입력하셨습니다. 다시 입력해주세요.");
		}
	});
});

	function loginChk(){
		
		if($('#id').val().length==0||$('#password').val().length==0){
			swal('아이디나 비밀번호가 입력되지 않았습니다.');
			return false;
		}
		
		return true;
	}
</script>
</body>
</html>
