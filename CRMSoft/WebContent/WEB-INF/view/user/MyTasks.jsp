<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"  %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html ng-app="taskManagerApp">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>CRM - Admin Panel</title>
    <script src="../../js/jquery.min.js"></script>
    <!-- Bootstrap Core CSS -->
    <link href="../../css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="../../js/metisMenu/dist/metisMenu.min.css" rel="stylesheet">

    <!-- Timeline CSS -->
    <link href="../../../dist/css/timeline.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="../../css/admin.css" rel="stylesheet">

    <!-- Morris Charts CSS -->
    <link href="../../../bower_components/morrisjs/morris.css" rel="stylesheet">

    <!-- Custom Fonts -->
    
    <!-- Angular Custom Fonts -->
    <link href="../../cssng/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href='../../cssng/style.css' rel="stylesheet" type="text/css"></link>
    <link href='../../cssng/css/font-awesome.css' rel="stylesheet" type="text/css"></link>
    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'>
    <script data-require="angular.js@*" data-semver="1.2.13" src="http://code.angularjs.org/1.2.13/angular.js"></script>
    <script data-require="angular-animate@*" data-semver="1.2.13" src="http://code.angularjs.org/1.2.13/angular-animate.js"></script>
    <script type="text/javascript" src="../../js/app.js"></script>

</head>
<body class="theme-green">
      <!-- navbar-bar -->
        <div class="navbar navbar-default" role="navigation" style="margin-bottom: 0">
            <!-- navbar-header -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.html">CRMSoft</a>
            </div>         
              <%if(session.getAttribute("userName")!=null){ %>
              <ul id="main-menu" class="nav navbar-top-links navbar-right">				        	 
                <li class="dropdown">
                    <a style="background-color:#FFFFFF" class="dropdown-toggle" data-toggle="dropdown" href="#">
                        Welcome - <i class="fa fa-user fa-fw"></i> 
						<% out.print(session.getAttribute("userName"));%>
			  <%} %><i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                        <li><a href="#"><i class="fa fa-user fa-fw"></i> User Profile</a>
                        </li>
                        <li><a href="#"><i class="fa fa-gear fa-fw"></i> Settings</a>
                        </li>
                        <li><a href="#"><i class="fa fa-envelope-o"></i> MailBox</a>
                        </li>
                        <li class="divider"></li>
                        <li><a href="login.html"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
                        </li>
                    </ul>
                </li>
              </ul>
            <!--navbar-header/ -->
		 </div>
       <!-- navbar-header/-->	
            <div class="navbar-default sidebar" role="navigation">   
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                        <li class="sidebar-search">
                            <div class="input-group custom-search-form">
                                <input type="text" class="form-control" placeholder="Search...">
                                <span class="input-group-btn">
									<button class="btn btn-default" type="button">
										<i class="fa fa-search"></i>
									</button>
                                </span>
                            </div>
                        </li>                        
							<li>
								<a href="crmpanel.html"><i class="fa fa-dashboard fa-fw"></i> Dashboard</a>
							</li>                         
							<li>
								<a href="#"><i class="fa fa-home"></i> Admin Panel</a>
							</li>
							<li>
								<a href="usermanage.html"><i class="fa fa-home"></i> User Management</a>
							</li>
      					  <li>
								<a href="#"><i class="fa fa-bar-chart-o fa-fw"></i> CRM<span class="fa arrow"></span></a>
								<ul class="nav nav-second-level">
								   <li>
										<a href="MyTasks">Task Management</a>
									</li>	
									<li>
										<a href="addCategory.html">Manage Category</a>
									</li>								
									<li>
										<a href="Leadmanager.html">Manage Leads</a>
									</li>
									<li>
										<a href="UploadForm">Upload File</a>
									</li>
									<li>
										<a href="Contacts.html">Manage Contacts</a>
									</li>
									<li>
										<a href="Companies.html">Manage Companies</a>
									</li>												
								</ul>
								<!-- /.nav-second-level -->
						 </li>
                        <li>
                     </ul>
				  </div>
			  </div>
         <!-- row -->
         <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Dashboard</h1>
                </div>                            
            <!--row -->			
               <div class="row">
                <div class="col-lg-3 col-md-6">
                    <div class="panel panel-success">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-flag fa-3x pull-left"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="small">June 2015</div>
                                    <div>Welcome @CRMSoft!</div>
                                </div>                                
                            </div>
                        </div>                       
                    </div>
                  </div>
                  <div class="col-lg-3 col-md-6">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-cog fa-3x fa fa-cog fa-spin"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="small">2</div>
                                    <div>Events Schedule !</div>
                                </div>                                
                            </div>
                        </div>                       
                    </div>                    
                  </div>
                  <div class="col-lg-3 col-md-6">
                    <div class="panel panel-green">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-envelope-o fa-3x "></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="small">2</div>
                                    <div>New Mail !</div>
                                </div>                                
                            </div>
                        </div>                       
                    </div>                    
                  </div>
                  <div class="col-lg-3 col-md-6">
                    <div class="panel panel-red">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-user fa-3x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="small">26</div>
                                    <div>Users Online !</div>
                                </div>                                
                            </div>
                        </div>                       
                    </div>                    
                  </div>
               </div>              
             <!-- /row -->     
                 
		 <div class="row">
			<div class="col-lg-12">
		  <!-- panel-->
			  <div class="panel panel-red">				  
						<div class="panel-body">  
						    <blockquote>
						         <P><strong>Tips of the Day...</strong></P>
						         <p>The world is a dangerous place to live; not because of the people who are evil, but because of the people who don't do anything about it.</p>
						         <small>by <cite>Albert Einstein</cite></small>
						    </blockquote>
						</div>				  
			  </div>
			</div>
		   </div>
 		<div class="row">
			<div class="col-lg-12">
   			        <div class="panel panel-default">
         <!-- ngpanel--> 
                   <div ng-controller="taskManagerController">
<!-- 	              <h2 class="page-title">Task Manager</h2>
						<h4 class="page-title">Demo <a href="">CRM</a></h4>
						<a href="#" class="button-red" style="text-align:center;width:70px;margin-left:45%;margin-right:40%">CRM</a> -->	
							<div id="task-panel" class="fadein fadeout showpanel panel"  ng-show="toggle">	
								<div class="panel-heading">
									<i class="panel-title-icon fa fa-tasks"></i>
									<span class="panel-title">Recent Tasks</span>
									<div class="panel-heading-controls">
										<button ng-click="toggle = !toggle" class="btn-panel">Add New Task</button>
										<button class="btn-panel" confirmed-click="archiveTasks()" ng-confirm-click="Would you like to archive completed tasks?">Clear completed tasks</button>
									</div>
								</div>
								<div class="panel-body">
									<div class="task" ng-repeat="task in tasks">
										<span ng-if="task.taskPriority=='HIGH'" class="priority priority-red">{{task.taskPriority}}</span>
										<span ng-if="task.taskPriority=='MEDIUM'" class="priority priority-yellow">{{task.taskPriority}}</span>
										<span ng-if="task.taskPriority=='LOW'" class="priority priority-green">{{task.taskPriority}}</span>
										<div class="action-checkbox">
											<input id="{{task.taskId}}" type="checkbox" value="{{task.taskId}}" ng-checked="selection.indexOf(task.taskId) > -1" ng-click="toggleSelection(task.taskId)" />
							  				<label for="{{task.taskId}}"></label>		
										</div>
										<div ng-if="task.taskStatus=='COMPLETED'">				
											<a href="#" class="checkedClass">
												{{task.taskName}}
											<span class="action-status">{{task.taskStatus}}</span>
											</a>
										</div>
										<div ng-if="task.taskStatus=='ACTIVE'">				
											<a href="#" class="uncheckedClass">
												{{task.taskName}}
												<span class="action-status">{{task.taskStatus}}</span>
											</a>
										</div>
									</div>
								</div>
							</div>
							<div id="add-task-panel" class="fadein fadeout addpanel panel" ng-hide="toggle">
								<div class="panel-heading">
									<i class="panel-title-icon fa fa-plus"></i>
									<span class="panel-title">Add Task</span>
									<div class="panel-heading-controls">
										<button ng-click="toggle = !toggle" class="btn-panel">Show All Tasks</button>
									</div>
								</div>
								<div class="panel-body">
									<div class="task" >
										<table class="add-task">
											<tr>
												<td>Task Name:</td>
												<td><input type="text" ng-model="taskName"/></td>
											</tr>
											<tr>
												<td>Task Description:</td>
												<td><input type="text" ng-model="taskDesc"/></td>
											</tr>
											<tr>
												<td>Task Status:</td>
												<td>
													<select ng-model="taskStatus" ng-options="status as status for status in statuses">
														<option value="">-- Select --</option>						
												     	</select>
												</td>
											</tr>
											<tr>
												<td>Task Priority:</td>
												<td>
													<select ng-model="taskPriority" ng-options="priority as priority for priority in priorities">
														<option value="">-- Select --</option>
													</select>
												</td>
											</tr>
											<tr>
												<td><br/><button ng-click="addTask()" class="btn-panel-big">Add New Task</button></td>
											</tr>
										</table>								
									</div>
								</div>
							</div>
         <!-- ngpanel--> 
                   </div>
			</div>
        </div>
       <!-- row/ -->      
       <!-- panel footer-->
           <footer>
                <hr>
                <p class="pull-right">A <a href="http://www.soft2services.in" target="_blank">CRMSoft Developed By :</a> by <a href="http://www.soft2services.in/" target="_blank">Soft2Services</a></p>
                <p>© 2015 <a href="http://www.soft2services.in/" target="_blank">Soft2Services</a></p>
            </footer> 
        <!-- panel footer/-->
        </div>
	</div>
    <!-- jQuery -->
    <script src="../../js/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="../../js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="../../js/metisMenu/dist/metisMenu.min.js"></script>

    <!-- Morris Charts JavaScript -->
    <script src="../../../bower_components/raphael/raphael-min.js"></script>
    <script src="../../../bower_components/morrisjs/morris.min.js"></script>
    <script src="../../../js/morris-data.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="../../js/sb-admin-2.js"></script>
</body>
</html>