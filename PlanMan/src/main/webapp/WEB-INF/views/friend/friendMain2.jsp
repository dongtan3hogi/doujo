<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Welcome PlanMan</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.7 -->
  <link rel="stylesheet" href="resources/main/bower_components/bootstrap/dist/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="resources/main/bower_components/font-awesome/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="resources/main/bower_components/Ionicons/css/ionicons.min.css">
  <!-- fullCalendar -->
  <link rel="stylesheet" href="resources/main/bower_components/fullcalendar/dist/fullcalendar.min.css">
  <link rel="stylesheet" href="resources/main/bower_components/fullcalendar/dist/fullcalendar.print.min.css" media="print">
  <!-- Theme style -->
  <link rel="stylesheet" href="resources/main/dist/css/AdminLTE.min.css">
  <!-- AdminLTE Skins. Choose a skin from the css/skins folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="resources/main/dist/css/skins/_all-skins.min.css">
  <!-- Google Font -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
  
  <link rel="stylesheet" href="./resources/style/board.css" />
  
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> 
<script type="text/javascript">
function fn_btnChoice(){
	 alert("친구신청이 접수되었습니다.");
	 $("input:checkbox[name='selected']:checked").each(function(){

		 var tdArr = new Array(); 
		 var tr = $("input:checkbox[name=selected]:checked").closest('tr');
		 
		 var td = tr.children()
		alert(td.length);
		 td.each(function(index,value){
			 if(index==0){
				 return true;
			 }
		        tdArr.push(td.eq(index).text());
		        alert(td.eq(index).text());
		    }); 
		 
		 var id = tdArr[0];
		  $.ajax({
				url : "chooseOnefriend",
				method : "POST", 
				data : {"id":id},
				success : function(data){
					alert("친구 신청이 접수되었습니다.");
				},error : function(data){
					alert("접속 불량");
				} 
				
			}); 
			 
		 });	    	 
}

	    
</script>
<!-- head -->
</head>
<body class="hold-transition skin-blue sidebar-mini">
<input type="hidden" id="MyID" value="${sessionScope.memberID}">
<input type="hidden" id="friendID" value="${sessionScope.friendID}">
<div class="wrapper">

  <header class="main-header">
    <!-- Logo -->
    <a href="redirect:/" class="logo">
      <!-- mini logo for sidebar mini 50x50 pixels -->
      <span class="logo-mini"><b>Pm</b></span>
      <!-- logo for regular state and mobile devices -->
      <span class="logo-lg"><b>Planman</b></span>
    </a>
    
    <!-- Header Navbar: style can be found in header.less -->
    <nav class="navbar navbar-static-top">
      <!-- Sidebar toggle button-->
      <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
        <span class="sr-only">Toggle navigation</span>
       <!--   <span class="icon-bar"></span>
        <span class="icon-bar"></span> -->
      </a>

      <div class="navbar-custom-menu">
        <ul class="nav navbar-nav" id="topMenuBarUl">
          <!-- Tasks: style can be found in dropdown.less -->
          <li class="dropdown messages-menu" id="pParentMessageBoard">
            
          </li>
          <!-- User Account: style can be found in dropdown.less -->
          <li class="dropdown user user-menu">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <img src="resources/main/dist/img/user2-160x160.jpg" class="user-image" alt="User Image">
              <span class="hidden-xs">${sessionScope.member.id}</span>
            </a>
            <ul class="dropdown-menu">
              <!-- User image -->
              <li class="user-header">
                <img src="resources/main/dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">

                <p>
                  ${sessionScope.member.id}
                  <small>${sessionScope.member.nickname}</small>
                </p>
              </li>
              <!-- Menu Body -->
              <li class="user-body">
                <div class="row">
                  <div class="col-xs-4 text-center">
                    <a href="#">기능1</a>
                  </div>
                  <div class="col-xs-4 text-center">
                    <a href="#">기능2</a>
                  </div>
                  <div class="col-xs-4 text-center">
                    <a href="#">기능3</a>
                  </div>
                </div>
                <!-- /.row -->
              </li>
              <!-- Menu Footer-->
              <li class="user-footer">
                <div class="pull-left">
                  <a href="#" class="btn btn-default btn-flat">개인정보</a>
                </div>
                <div class="pull-right">
                  <a href="#" class="btn btn-default btn-flat">로그아웃</a>
                </div>
              </li>
            </ul>
          </li>
        </ul>
      </div>
    </nav>
  </header>
  <!-- Left side column. contains the logo and sidebar -->
  <aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
      <!-- Sidebar user panel -->
      <div class="user-panel">
        <div class="pull-left image">
          <img src="resources/main/dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">
        </div>
        <div class="pull-left info">
          <p>${sessionScope.member.id}</p>
          <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
        </div>
      </div>
      <!-- search form -->
      <form action="#" method="get" class="sidebar-form">
        <div class="input-group">
          <input type="text" name="q" class="form-control" placeholder="Searchresources.">
          <span class="input-group-btn">
                <button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i>
                </button>
              </span>
        </div>
      </form>
      <!-- /.search form -->
      <!-- sidebar menu: : style can be found in sidebar.less -->
      <ul class="sidebar-menu" data-widget="tree">
        <li class="header">MENU</li>
        <li class="treeview">
          <a href="#">
            <i class="fa fa-edit" style="color: #2ECCFA"></i> <span>Study</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu"> 
            <li><a href="gotoStudy"><i class="fa fa-circle-o text-aqua"></i> Study Main</a></li> 
            <li><a href="gotoQuiz"><i class="fa fa-circle-o text-aqua"></i> Quiz</a></li> 
            <li><a href="gotoGroupLobby"><i class="fa fa-circle-o text-aqua"></i> Study Group</a></li>
          </ul>
        </li>
        <li class="treeview">
          <a href="#">
            <i class="fa fa-suitcase" style="color: #F7D358"></i> <span>Work</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="mainWork"><i class="fa fa-circle-o text-yellow"></i> Work Main</a></li>
            <li><a href="goNewsMap"><i class="fa fa-circle-o text-yellow"></i> News</a></li>         
          </ul>
        </li>
        <li class="treeview">
          <a href="#">
            <i class="fa fa-heartbeat" style="color: #FF0040"></i> <span>Health</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="gotoHealth"><i class="fa fa-circle-o text-red"></i> Health Main</a></li>
            <li><a href="gotoMeal"><i class="fa fa-circle-o text-red"></i> Add Meal</a></li>
            <li><a href="gotoActivity"><i class="fa fa-circle-o text-red"></i> Add Activity</a></li>
            <li><a href="gotoNutrition"><i class="fa fa-circle-o text-red"></i> My Nutrition</a></li>
            <li><a href="gotoShowHospital"><i class="fa fa-circle-o text-red"></i> Hospital&Pharmarcy</a></li>
          </ul>
        </li>
        <li class="treeview">
          <a href="#">
            <i class="fa fa-users" style="color: #008000"></i> <span>Friend</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="gotoSearchFriend"><i class="fa fa-circle-o text-green"></i> Friend Main</a></li>
            <li><a href="friend2"><i class="fa fa-circle-o text-green"></i>Club Recommend</a></li>
            <li><a href="friendSchedule"><i class="fa fa-circle-o text-green"></i>Friend Schedule</a></li>
            <li><a href="friend3"><i class="fa fa-circle-o text-green"></i>Place Recommend</a></li>
          </ul>
        </li>
        <li class="treeview">
          <a href="#">
            <i class="fa fa-calendar" style="color: #0000FF"></i> <span>Schdule</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="gotoCalendar"><i class="fa fa-circle-o text-blue"></i> Calendar</a></li>
            <li><a href="gotoTimeline"><i class="fa fa-circle-o text-blue"></i> Timeline</a></li>
          </ul>
        </li>
      </ul>
    </section>
    <!-- /.sidebar -->
  </aside>
  
  <!-- ========================================================================================================== -->
  <!-- ========================================================================================================== -->
  <!-- ========================================================================================================== -->
  
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Friend
        <small>${sessionScope.member.id}님의 타임라인 / <span id="clock"></span><c:if test="${sessionScope.eventtitle!=null}"> / 지금 일정: ${sessionScope.eventtitle}</c:if></small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="goWorkMain"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">title</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
      
       </section>
<c:if test="${empty sessionScope.member.job or empty sessionScope.member.hobby }">
<script>
alert("취미 직업을 등록하러 갑니다");
location.href="joinfriend";
</script>
</c:if>
 <div class="box box-primary" style="width: 50%; height: 600px; float:left; margin-right:20px; ">
            <div class="box-header">
              <i class="ion ion-clipboard"></i>
              <h3 class="box-title">Friend_Recommendation</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <!-- See dist/js/pages/dashboard.js to activate the todoList plugin -->
  
            <div>
      <form class="right" action="searchRecommendFriends" method="get">
         
         <select name="searchItem">
            <option value="id"${searchItem =='id'? 'selected':''}>ID</option>
            <option value="job" ${searchItem =='job'? 'selected':''}>JOB</option>
            <option value="hobby" ${searchItem =='hobby'? 'selected':''}>HOBBY</option>
         </select>
         
         <input type="text" name="searchWord" value="${searchWord}"/>
         <input type="submit" value="search" />
         
      </form>   
      
      <div class="left">
      <a href="tooldFriend">ToFriend_List</a>
      </div>
      
   <table summary="member" cellpadding="0" cellspacing="0" id="member" style="text-align:center">
   <colgroup>
   <col width="10%"/>
   <col width="10%"/>
   <col width="10%"/>
   <col width="10%"/>
   </colgroup>
   <thead>
      <th scope="col"><input type="checkbox" onClick="fn_allChecked();"/></th>
      <th scope="col">ID</th>
      <th scope="col">NICKNAME</th>
      <th scope="col">NAME</th>
      <th scope="col">GENDER</th>
      <th scope="col">AGE</th>
      <th scope="col">JOB</th>
      <th scope="col">HOBBY</th>
   </thead>
   
   <tbody>
   <c:choose>
      <c:when test="${!empty list}">
       <c:forEach begin="0" var="member" items="${list}" varStatus="index">
          <tr class='sibal'>
              <td><input type="checkbox" name='selected'></td>
              <td>${member.id}</td>   
              <td>${member.nickname}</td>
              <td>${member.name}</td>
              <td>${member.gender}</td>
              <td>${member.age}</td>
              <td>${member.job}</td>
              <td>${member.hobby}</td>
          </tr>    
       </c:forEach>   
      </c:when>
      <c:otherwise>
      <tr><td colspan="7" >No Information</td></tr>
      </c:otherwise>
   </c:choose>
   </tbody>
   </table>
   
   <div>
        <a href="#" onClick="fn_btnChoice()">choose</a>
   </div>
   
   <!-- <div>
        <a href="#" onClick="fn_delRow()">삭제</a>
   </div> -->
   
   <div class="boardfooter">
   <a href="listfriend?currentPage=${navi.currentPage - navi.pagePerGroup}&searchItem=${searchItem}&searchWord=${searchWord}">◁◁</a>
   <a href="listfriend?currentPage=${navi.currentPage - 1}&searchItem=${searchItem}&searchWord=${searchWord}">◀</a>
   &nbsp; &nbsp;
   <c:forEach var="page" begin="${navi.startPageGroup}" end="${navi.endPageGroup}">
      <c:if test="${page == currentPage}">
         <span style="color:red; font-weight:bolder;">${page}</span> &nbsp;
      </c:if>
      
      <c:if test="${page != currentPage}">
         <a href="listfriend?currentPage=${page}&searchItem=${searchItem}&searchWord=${searchWord}">${page}</a> &nbsp;
      </c:if>
   </c:forEach>
   &nbsp; &nbsp;
   <a href="listfriend?currentPage=${navi.currentPage + 1}&searchItem=${searchItem}&searchWord=${searchWord}">▶</a>
   <a href="listfriend?currentPage=${navi.currentPage + navi.pagePerGroup}&searchItem=${searchItem}&searchWord=${searchWord}">▷▷</a>
   
   </div>
   <script type="text/javascript">
   
   	console.log('asdf');
   	console.log('${list}');
   </script>
   
</div>
</div>
</div>

  <!-- ========================================================================================================== -->
  <!-- ========================================================================================================== -->
  <!-- ========================================================================================================== -->
 <style>
 .footer {
    position: fixed;
    left: 0;
    right: 100;
    bottom: 0;
    width: 100%;
    text-align:right;
 }
 </style> 
 <footer class="footer">
     <div class="pull-right hidden-xs">
      <b>Version</b> 2.4.0
    </div>
    <strong>Copyright &copy; 2014-2016 <a href="https://adminlte.io">Almsaeed Studio</a>.</strong> All rights<b>Version</b> 2.4.0
    reserved.
 </footer>

  <!-- Control Sidebar -->
  
  <!-- /.control-sidebar -->
  <!-- Add the sidebar's background. This div must be placed
       immediately after the control sidebar -->
  <div class="control-sidebar-bg"></div>
</div>
<!-- ./wrapper -->

<!-- jQuery 3 -->
<script src="resources/main/bower_components/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="resources/main/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- jQuery UI 1.11.4 -->
<script src="resources/main/bower_components/jquery-ui/jquery-ui.min.js"></script>
<!-- Slimscroll -->
<script src="resources/main/bower_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>
<!-- FastClick -->
<script src="resources/main/bower_components/fastclick/lib/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="resources/main/dist/js/adminlte.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="resources/main/dist/js/demo.js"></script>
<!-- fullCalendar -->
<script src="resources/main/bower_components/moment/moment.js"></script>
<script src="resources/main/bower_components/fullcalendar/dist/fullcalendar.min.js"></script>
<!-- Page specific script -->
<script>

  $(function () {    
     
     $('a.favorite').click(function() {
        alert("클릭");
        var locations = $(this).next().attr('href');
        if($(this).children('i').attr('class')=='fa fa-star text-yellow'){
           $.ajax({
               url:"deleteFavorites",
               type:"post",
               //client에서 server로 가는 값
               data:{"id": '${sessionScope.member.id}',"locations":locations},
               success: function(data){
                  if(data==1){
                     $(this).children('i').attr('class','fa fa-star-o text-yellow');
                  }else{alert("다시 시도해주세용");}
               
           },
                 fail: function(res){
              alert("다시 시도해주세용");
              }
     });
        }
        else if($(this).children('i').attr('class')=='fa fa-star-o text-yellow'){
           var title = prompt("이름을 입력해주세요");
           if(title==null||title==""){
              return;
           }
           var locations = $(this).next().attr('href');
           alert(title+"\n"+locations);
           $.ajax({
               url:"insertFavorites",
               type:"post",
               //client에서 server로 가는 값
               data:{"id": '${sessionScope.member.id}', "title":title,"locations":locations},
               success: function(data){
                  if(data==1){
                     $(this).children('i').attr('class','fa fa-star text-yellow');
                  }else{alert("다시 시도해주세용");}
               
           },
                 fail: function(res){
              alert("다시 시도해주세용");
              }
     });
       
      }
        location.reload();
     });
    
   $('#saveMemo').click(function(){
      var memo = $('#memo').val();
      memo= memo.replace("\r\n","<br>");
      alert(memo);
      var today = new Date();
      var mm= today.getMonth()+1; 
      var dd =today.getDate();
      var yy = today.getFullYear();
      if(dd<10) {
          dd='0'+dd;
      } 
      if(mm<10) {
          mm='0'+mm;
      } 
      var td=yy+'-'+mm+'-'+dd;
      $.ajax({
         url:"saveMemo",
         type:"post",
         //client에서 server로 가는 값
         data:{"userid": memo, "text":memo,"startDate":temp},
         success: function(data){
         if(data=="1"||data=="3"){
            alert("저장 되었습니다");
         }else{'오류 발생'};
         },fail: function(){
            alert("다음에 다시 시도해주세요");
         }
      });
      });
  });
</script>
</body>
</html>