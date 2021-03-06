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
  <link rel="stylesheet" href="./resources/style/profile.css">
  <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> 
 <style>
.eImage { height: 80px;
         width: auto; }
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
        Friend
        <small>${sessionScope.member.id}のスケジュール / <span id="clock"></span><c:if test="${sessionScope.eventtitle!=null}"> / 今の日程: ${sessionScope.eventtitle}</c:if></small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="goWorkMain"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Friend</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
        <div class="row">
        	<div class="col-md-4">
        	  <!-- TO DO List -->
	          <div class="box box-success">
	            <div class="box-header">
	              <i class="ion ion-clipboard"></i>
	
	              <h3 class="box-title">今週 Friend Schedule</h3>
	            </div>
	            <!-- /.box-header -->
	            
	            <div class="box-body">
	              <!-- See dist/js/pages/dashboard.js to activate the todoList plugin -->
	              <ul class="todo-list">
	                <c:forEach var="schList" items="${schList}" varStatus="status">
	                
	                <c:if test="${schList.doornot==1}">
	                	<li id="${schList.schseq}" class="done">
	                	<!-- drag handle -->
	                  <span class="handle">
	                        <i class="fa fa-ellipsis-v"></i>
	                        <i class="fa fa-ellipsis-v"></i>
	                      </span>
	                  <!-- checkbox -->
	                  <input type="checkbox" data-rno="${schList.schseq}" name="scheduleCk" class="chkbox" checked="checked">
	                  <!-- todo text -->
	                  <span class="text">${schList.eventtitle}</span>
	                  <!-- Emphasis label -->
	                  <small class="label label-success"><i class="fa fa-clock-o"></i>${schList.startday}</small>
	                </li> 
	                </c:if>
	                
	                <c:if test="${schList.doornot==0}">
	                	<li id="${schList.schseq}">
	                	<!-- drag handle -->
		                  <span class="handle">
		                        <i class="fa fa-ellipsis-v"></i>
		                        <i class="fa fa-ellipsis-v"></i>
		                      </span>
		                  <!-- checkbox -->
		                  <input type="checkbox" data-rno="${schList.schseq}" name="scheduleCk" class="chkbox">
		                  <!-- todo text -->
		                  <span class="text">${schList.eventtitle}</span>
		                  <!-- Emphasis label -->
		                  <small class="label label-success"><i class="fa fa-clock-o"></i>${schList.startday}</small>
	                </li> 
	                </c:if>
		                 
	                </c:forEach>
	              </ul>
	            </div>
	            <!-- /.box-body -->
	            <div class="box-footer clearfix no-border">
		        </div>
		        <div class="box box-success">
		            <div class="box-header">
		              <i class="ion ion-clipboard"></i>
		
		              <h3 class="box-title">Popular Meetings</h3>
		            </div>
		            <!-- /.box-header -->
		            <div class="box-body">
		              <!-- See dist/js/pages/dashboard.js to activate the todoList plugin -->
		              <input type="text" id="searchMeeting">&nbsp;<input type="button" class="btn btn-success" id="goSearch" value="#で検索">
		                
		              <ul class="eventlist">
		              </ul>
		            </div>
		              <div id="boardfooter"></div>
	          </div>
	          </div>
	          <!-- /.box -->
	          
	       </div>
		   <div class="col-md-8">
				<c:if test="${empty sessionScope.member.job or empty sessionScope.member.hobby }">
					<script>
					alert("趣味、職業を登録しに行きます.");
					location.href="joinfriend";
					</script>
				</c:if>
				 
				 <div class="box box-success">
		            <div class="box-header">
		              <h3 class="box-title"><i class="ion ion-clipboard"></i>Friend_Recommendation</h3>
		
		              <div class="box-tools">
		               <div class="input-group input-group-sm">
		                
		                <form class="right" action="searchRecommendFriends" method="get" style="display: inline;">
				         <select name="searchItem" style="height: 26px;">
				            <option value="id"${searchItem =='id'? 'selected':''}>ID</option>
				            <option value="job" ${searchItem =='job'? 'selected':''}>JOB</option>
				            <option value="hobby" ${searchItem =='hobby'? 'selected':''}>HOBBY</option>
				         </select>
				         <input type="text" placeholder="Search" name="searchWord" value="${searchWord}"/>
				         <button type="submit" value="search"  class="btn btn-success" ><i class="fa fa-search"></i></button>
				       </form>
				       
				       
		              </div>
		    
		             </div>
		             <br/>
		             <div>
				      	<a href="tooldFriend"><label class="label label-success">My friend</label></a>
				      </div>
		            </div> 
		            <!-- /.box-header -->
		            <div class="box-body table-responsive no-padding">
		              <table class="table table-hover">
		                <tr>
		                  <th>ICON</th>
					      <th>ID</th>
					      <th>NICKNAME</th>
					      <th>NAME</th>
					      <th>GENDER</th>
					      <th>AGE</th>
					      <th>JOB</th>
					      <th>HOBBY</th>
		                </tr>
					   <c:choose>
					      <c:when test="${!empty list}">
					       <c:forEach begin="0" var="member" items="${list}" varStatus="index">
					          <tr>
					              <td><img class="direct-chat-img" src="./resources/userData/image/${member.id}.jpg"  data-rno="${member.id}" alt="message user image" onError="this.src='resources/userData/image/unknown.png';" style="width:50px; height:50px;"></td>
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
    	              </table>
		            </div>
		            <!-- /.box-body -->
		            <div>
				   	</div>
				   	<div class="boardfooter">
						   <a href="searchRecommendFriends?currentPage=${navi.currentPage - navi.pagePerGroup}&searchItem=${searchItem}&searchWord=${searchWord}">◁◁</a>
						   <a href="searchRecommendFriends?currentPage=${navi.currentPage - 1}&searchItem=${searchItem}&searchWord=${searchWord}">◀</a>
						   &nbsp; &nbsp;
						   <c:forEach var="page" begin="${navi.startPageGroup}" end="${navi.endPageGroup}">
						      <c:if test="${page == currentPage}">
						         <span style="color:red; font-weight:bolder;">${page}</span> &nbsp;
						      </c:if>
						      
						      <c:if test="${page != currentPage}">
						         <a href="searchRecommendFriends?currentPage=${page}&searchItem=${searchItem}&searchWord=${searchWord}">${page}</a> &nbsp;
						      </c:if>
						   </c:forEach>
						   &nbsp; &nbsp;
						   <a href="searchRecommendFriends?currentPage=${navi.currentPage + 1}&searchItem=${searchItem}&searchWord=${searchWord}">▶</a>
						   <a href="searchRecommendFriends?currentPage=${navi.currentPage + navi.pagePerGroup}&searchItem=${searchItem}&searchWord=${searchWord}">▷▷</a>	   
				   </div>
				   <script type="text/javascript"> 
					   	console.log('asdf');
					   	console.log('${list}');
				    </script>
		          </div>
		          <!-- /.box -->
		     </div>
		          
		</div>          
	</section>
	
  </div>	          	
  <!-- ./content wrapper -->		
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

<!-- Page specific script -->
<script>
function goPage(a){
	   $.ajax({
			url:"goMPage",
			type:"post",
			//client에서 server로 가는 값
			data:{"value": a},
			success: function(data){
				$(".eventlist").empty();
				$.each(data.meeting, function(index, item){
					
					var result ="<li><a href="+item[0]+"target='_blank' > <image class='eImage' src="+item[1]+">  <span class='text'>"+item[2]+"</span></a></li>";
					$(".eventlist").append(result);
					});
					var navi = data.navi;
					var line="";
					var current= Number(0);
					if(navi.currenPage >1){
						current = Number(navi.currentPage);
						current--;
						line += "<a href='javascript:void(0);' onclick='goPage("+current+")'>◀</a>";
					}
					for( var i=navi.startPageGroup; i<navi.endPageGroup; i++){
						if(navi.currentPage == i){
							line+= 	"<a href='javascript:void(0);' onclick='goPage("+i+")' style='color : red'>"+i+"</a> &nbsp";
						}else{
							line+= 	"<a href='javascript:void(0);' onclick='goPage("+i+")'>"+i+"</a> &nbsp";
						}
					}
					if(navi.currentPage <navi.totalPageCount){
						current = Number(navi.currentPage);
						
						current++;
						line+=	"<a href='javascript:void(0);' onclick='goPage("+current+")'>▶</a>";

					}
				      $('#boardfooter').empty();

				      $('#boardfooter').append(line);
			}
		});
	}
  $(function () {
	  
	  $(".chkbox").change(function(){
	        if($(this).is(":checked")){
	            $.ajax({
	            	url:'chkschdule'
	      			,type:'post'
	      			,data:{
	      				"schseq":$(this).attr('data-rno')
	      			}
	      			,success: function (data){
	    				if(data="success"){
	    					swal("スケジュール確認完了!")
	    				}	
	      			}
	            })
	            $(this).parent('li').addClass('done');
	        }else if($(this).is(":not(:checked)")){
	        	 $.ajax({
		            	url:'unchkschdule'
		      			,type:'post'
		      			,data:{
		      				"schseq":$(this).attr('data-rno')
		      			}
		      			,success: function (data){
		      				if(data="success"){
		    					swal("スケジュール解除!")
		    				}	
		      			}
		        })
	            $(this).parent('li').removeClass('done');
	        }
	  });
	  
	  $("#goSearch").on("click",function(){
	      var search= $("#searchMeeting").val();
	      if(search==""){
	         swal('入力してください.');
	      }
	      $.ajax({
	         url:"searchMeeting",
	         type:"post",
	         //client에서 server로 가는 값
	         data:{"search": search},
	         success: function(data){
	            $.each(data.meeting, function(index, item){

            	var result ="<li><a href='"+item[0]+"' target='_blank' > <image class='eImage' src="+item[1]+">  <span class='text'>"+item[2]+"</span></a></li>";
	            $(".eventlist").append(result);
	            });
	            var navi = data.navi;
	            var line="";
	            var current= Number(0);
	            if(navi.currenPage >1){
	               current = Number(navi.currentPage);
	               current--;
	               line += "<a href='javascript:void(0);' onclick='goPage("+current+")'>◀</a>";
	            }
	            for( var i=navi.startPageGroup; i<navi.endPageGroup; i++){
	               if(navi.currentPage == i){
	                  line+=    "<a href='javascript:void(0);' onclick='goPage("+i+")' style='color : red'>"+i+"</a> &nbsp";
	               }else{
	                  line+=    "<a href='javascript:void(0);' onclick='goPage("+i+")'>"+i+"</a> &nbsp";
	               }
	            }
	            if(navi.currentPage <navi.totalPageCount){
	               current = Number(navi.currentPage);
	               
	               current++;
	               line+=   "<a href='javascript:void(0);' onclick='goPage("+current+")'>▶</a>";

	            }
	               $('#boardfooter').append(line);
	         },fail: function(){
	            swal("次に、再びチャレンジーしてください.");
	         }
	      });
	   }); 
     
     $('a.favorite').click(function() {
        //alert("클릭");
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
                  }else{swal("再び試みてください.");}
               
           },
                 fail: function(res){
              swal("再び試みてください.");
              }
     });
        }
        else if($(this).children('i').attr('class')=='fa fa-star-o text-yellow'){
           var title = prompt("名前を入力してください.");
           if(title==null||title==""){
              return;
           }
           var locations = $(this).next().attr('href');
           //swal(title+"\n"+locations);
           $.ajax({
               url:"insertFavorites",
               type:"post",
               //client에서 server로 가는 값
               data:{"id": '${sessionScope.member.id}', "title":title,"locations":locations},
               success: function(data){
                  if(data==1){
                     $(this).children('i').attr('class','fa fa-star text-yellow');
                  }else{swal("再び試みてください.");}
               
           },
                 fail: function(res){
              swal("再び試みてください.");
           }
     });
       
      }
        location.reload();
     });
     
     $('.direct-chat-img').on('click',function(){
    	 var id=$(this).attr('data-rno');
    	 //alert(id);
    	 var flag = confirm('友達を申請しますか?');
    	 if(flag){
    		 $.ajax({
 				url : "friendRegistApply",
 				method : "POST", 
 				data : {"id":id},
 				success : function(data){
 					if(data=="already"){
 						swal("もう友達申請をしました.");
 					}else{
 						swal("友達申請が受付されました.");
 					}
 					
 				},error : function(data){
 					swal("接続不良");
 				} 
 				
 		 	}); 	 
    	 }else{
    		
    	 }
    	 
     });
     
  
  });
</script>
<script type="text/javascript" src="<c:url value="/resources/study/sockjs-0.3.4.js"/>"></script>
<script type="text/javascript">

    var sock;

    //웸소켓을 지정한 url로 연결한다.
    sock = new SockJS("<c:url value="/echo2"/>");
    
</script>
<script src="resources/main/js/messageBar.js"></script> 
</body>
</html>
