<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
   <!-- Date Picker -->
  <link rel="stylesheet" href="resources/main/bower_components/bootstrap-datepicker/dist/css/datepicker.css">
  <link rel="stylesheet" href="./resources/style/profile.css">
  <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<style>
.colordate{
   background:yellow}
</style>
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
$(document).ready(function(){
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
      var temp=td;
  
  
      $('#saveMemo').click(function(){
      var memo = $('#memo').val();
      
      
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
            alert("保存されました");
         }else{'오류 발생'};
         },fail: function(){
            alert("次に、再びチャレンジーしてください.");
         }
      });
      });


      var memodays="";
         $.ajax({
          url:'memodays',
           type: 'post',
           data: {
              'id': '${sessionScope.member.id}'
           },
           success: function(data){
              memodays=data;
              
             },
           error: function() {
             alert('there was an error while fetching events!');
           }
        });
         
         
         $('#datepicker1').val("日付選択");   
         
         $( ".datepicker" ).datepicker({ 
             changeMonth: true, 
             changeYear: true,
             dateFormat: "yy-mm-dd",
             beforeShowDay: function(day) {
                if(memodays.indexOf($.datepicker.formatDate('yy-mm-dd', day)) != -1) return [true, "colordate","" ];
                  else return [true, "", ""];
                  
              },
             onSelect: function(dateText) {  
                //alert(dateText);
                $.ajax({
                   url:'findmemo',
                    type: 'post',
                    data: {
                       'id': '${sessionScope.member.id}', 'startdate': dateText
                    },
                    success: function(data){
                      if(data==null)   {
                         alert("メモがありません");                
                            }else{
                               if(dateText==td){
                                  $('#memoTitle').html("今日のメモ");
                               }else{
                                  $('#memoTitle').html(dateText+"のメモ");                  
                               }
                               $('#memo').val(data.memo);
                            }
                      },
                    error: function() {
                      alert('there was an error while fetching events!');
                    }
               });
            }
         });
   
});
   
   


</script>
  <style>
      /* Set the size of the div element that contains the map */
      #map {
        height: 400px;  /* The height is 400 pixels */
        width: 100%;  /* The width is the width of the web page */
       }
    </style>

<!-- head -->
</head>
<body class="hold-transition skin-blue sidebar-mini">
<input type="hidden" id="MyID" value="${sessionScope.memberID}">
<input type="hidden" id="friendID" value="${sessionScope.friendID}">
<div class="wrapper">

  <header class="main-header">
    <!-- Logo -->
    <a href="gotoCalendar" class="logo">
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
              <img src="./resources/userData/image/${sessionScope.member.id}.jpg" class="user-image" id="profileImg" onError="this.src='./resources/userData/image/unknown.png;'">
              <span class="hidden-xs">${sessionScope.member.id}</span>
            </a>
            <ul class="dropdown-menu">
              <!-- User image -->
              <li class="user-header">
                <img src="./resources/userData/image/${sessionScope.member.id}.jpg" class="img-circle" id="profileImg" onError="this.src='./resources/userData/image/unknown.png;'">
				
                <p>
                  ${sessionScope.member.id}
                  <small>${sessionScope.member.nickname}</small>
                </p>
              </li>
              
              <!-- Menu Footer-->
              <li class="user-footer">
                <div align="center">
                  <a href="gotoupdate" class="btn btn-primary btn-flat">My Page</a>
                  <a class="btn btn-primary btn-flat" onclick="profileImgBtn()">Profile</a>
                  <a href="gotologout" class="btn btn-primary btn-flat">Log Out</a>
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
          <img src="./resources/userData/image/${sessionScope.member.id}.jpg" class="img-circle" onError="this.src='./resources/userData/image/unknown.png;'">
        </div>
        <div class="pull-left info">
          <p>${sessionScope.member.id}</p>
          <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
        </div>
      </div>
      
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
            <li><a href="goWC"><i class="fa fa-circle-o text-yellow"></i>Word Cloud</a></li>        
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
            <li><a href="gotoShowHospital"><i class="fa fa-circle-o text-red"></i> Hospital&Pharmacy</a></li>
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
    <div id="fortheprofilediv"></div>
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Work
        <small>${sessionScope.member.id}のスケジュール / <span id="clock"></span><c:if test="${sessionScope.eventtitle!=null}"> / 今の日程: ${sessionScope.eventtitle}</c:if></small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">work</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="row">
      
      
         <div class="col-md-9">
           <!-- general form elements disabled -->
          <div class="box box-Warning">
            <div class="box-header with-border">
              <h3 class="box-title">様々な国のニュース検索</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <label>ニュースや検索エンジン選択</label><select id="selectNews" class="form-control" ><option> </option><option>naver</option><option>BBC</option><option>nhk</option><option>google</option><option>baidu</option></select>
			    <br/><br/><!--The div element for the map -->
			    <div id="map"></div>
			    <script>
			    
			      var uk = {lat: 51.507, lng:  -0.127};
				  var usa = {lat: 40.664, lng: -73.938};
				  var korea = {lat:37.541, lng: 126.986};
				//  var china = {lat:38.037057, lng:114.468665};
				  var japan = {lat: 35.41, lng: 139.46};
				  var google = {lat: 37.3993, lng: -122.079}
				  var baidu= {lat: 39.9035, lng: 116.388}
				  var pList=[];
				  pList.push(korea);
				//  pList.push(china);
				  pList.push(uk);
				  pList.push(japan);
				  pList.push(google);
				  pList.push(baidu);
			    function initMap() { 
					var choose="";
					var prev_infowindow=false;
				  var map = new google.maps.Map(
				      document.getElementById('map'), {zoom: 2, center: korea});
				  for (var i = 0; i < 5; i++) {
			          // init markers
			          var marker = new google.maps.Marker({
			              position: pList[i],
			              map: map,
			              
         		  });

		          // process multiple info windows
		          (function(marker, i) {
		              // add click event
		              
		              google.maps.event.addListener(marker, 'click', function() {
		            	  
		            	  if(i==0)choose="naver";
		                  else if(i==1)choose="BBC";
		                  else if(i==2)choose="yahoo";
		                  else if(i==3)choose="google";
		                  else if(i==4)choose="baidu";
		                  
		            	  
		                  infowindow = new google.maps.InfoWindow({
		                      content: "<a href='goNews?type="+choose+"' ><img width='80' src='./resources/work/"+choose+".png' ></a>",
		                    		  maxWidth:300
		                  });
		                  if( prev_infowindow ) {
		                	  prev_infowindow.close();
		                   }
		                  prev_infowindow = infowindow;
		                  infowindow.open(map, marker);
		              });
		          })(marker, i);
		      }
				  
			  $( "#selectNews" ).change(function() {
				  choose=$(this).val();
			    	  if($(this).val()=="naver"){
			    		  var center = new google.maps.LatLng(korea);
			    		  map.panTo(center);
			    		  map.setZoom(10);
			    	  }else if($(this).val()=="BBC"){
			    		  var center = new google.maps.LatLng(uk);
			    		  map.panTo(center);
			    		  map.setZoom(10);
			    	  }else if($(this).val()=="yahoo"){
			    		  var center = new google.maps.LatLng(japan);
			    		  map.panTo(center);
			    		  map.setZoom(10);
			    	  }else if($(this).val()=="google"){
			    		  var center = new google.maps.LatLng(google);
			    		  map.panTo(center);
			    		  map.setZoom(10);
			    	  }
			    	  else if($(this).val()=="baidu"){
			    		  var center = new google.maps.LatLng(baidu);
			    		  map.panTo(center);
			    		  map.setZoom(10);
			    	  }
			    	  else{
			    		  var center = new google.maps.LatLng(korea);
			    		  map.panTo(center);
			    		  map.setZoom(2);
			    	  }
			    	});
			 }
	
	   	 	  </script>
	    	  <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCoyqsgIiNF-Zeh9Jl4_Khj59L_T-Cs_o8&callback=initMap" type="text/javascript"></script>
            </div>
            <!-- /.box-body -->
          </div>      
          <!-- /. box -->
         </div>
           
          <div class="col-md-3">
           <!-- /. 메모 box -->
          <div class="box box-warning">
            <div class="box-header with-border">
              <h3 class="box-title">MEMO</h3>
              <div class="box-tools">
                <input type="button" class="datepicker btn btn-block btn-warning"  id="datepicker1"></input>
              </div>
            </div>
            <div class="box-body no-padding">
               <h5 id= 'memoTitle' class="box-title">今日のメモ</h5>         
              <textarea id ="memo" rows="20" value="text" style="min-width: 100%; border: 0;"></textarea> <br/>
              <input type="button" class="btn btn-block btn-warning" value="貯蔵" id="saveMemo">   
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /. box -->
         </div> 
         
              
      </div>
      <!-- /.row -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
  

  <!-- ========================================================================================================== -->
  <!-- ========================================================================================================== -->
  <!-- ========================================================================================================== -->
  
  
   <footer class="main-footer">
    <div class="pull-right hidden-xs">
      <b>Version</b> 0.0.1
    </div>
    <strong>Copyright &copy; 2018 PlanMan.</strong>
  </footer>
  
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
<!-- datepicker -->
<script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!-- Page specific script -->
<script type="text/javascript" src="<c:url value="/resources/study/sockjs-0.3.4.js"/>"></script>
<script type="text/javascript">

    var sock;

    //웸소켓을 지정한 url로 연결한다.
    sock = new SockJS("<c:url value="/echo2"/>");
    
</script>
<script src="resources/main/js/messageBar.js"></script> 
</body>
</html>