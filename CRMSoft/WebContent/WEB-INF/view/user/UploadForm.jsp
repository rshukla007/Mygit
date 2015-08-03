<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"  %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="core"%>  
<!DOCTYPE html>
<html lang="en">
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
    <link href="../../css/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
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
      <!-- Formrow -->
       <div id="page-wrapper">
        <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Manage Leads:</h1>
                </div>                            
            <!--row -->			
                <div class="row">
                <div class="col-lg-3 col-md-6">
                    <div class="panel panel-primary">
                       <div class="btn-group btn-group-justified" role="group" aria-label="...">
						  <div class="btn-group" role="group">
						    <button type="button" class="btn btn-success" onClick="location.href='Leadmanager.html'">+ Add</button>						    
						  </div>
						  <div class="btn-group" role="group">
						   <!--  <button type="button" class="btn btn-default">Export</button> -->
						   <input type="button" class="btn btn-default" onClick=window.open("exportwin.jsp","demo","width=550,height=300,left=150,top=200,toolbar=0,status=0,"); value="Export"/>
						  </div>
						  <div class="btn-group" role="group">
						    <!-- <button type="button" class="btn btn-default">Print</button> -->
						    <input type="button" class="btn btn-default" onClick=window.open("printwin.jsp","demo","width=550,height=300,left=150,top=200,toolbar=0,status=0,"); value="Print"/>
						    
					<!-- 	    <input type=button onClick="opener.location='http://www.plus2net.com/'" value='Make the Main window change'>
							<input type=button onClick="opener.location='http://www.plus2net.com/html_tutorial/button-linking.php'" value='Bring the button linking tutorial again'>							
							<input type=button onClick="location='http://www.plus2net.com/'" value='Make the current  window change'>							
							<input type=button onClick="self.close();" value="Close this window">	 -->					    
						    
						  </div>
						</div>
                    </div>
                  </div>
               </div>
        <!-- /row -->    
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <i class="fa fa-bar-chart-o fa-fw"></i>Manage Leads
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-6">                                   
                                   <div id="sPhoneFromResponse"></div>
                                    <a href="${pageContext.request.contextPath}/forms/user/crmpanel.html">Go to Home page...</a>
                                            <br/>
											<br/>
								     		<h1>File Upload : </h1>
												<form method="post" action="uploadFile.html" enctype="multipart/form-data">
													<table border="0">
														<tr>
															<td>Description:</td>
															<td><input type="text" name="description" size="50"/></td>
														</tr>
														<tr>
															<td>Pick File #1:</td>
															<td><input type="file" name="fileUpload" size="50" /></td>
														</tr>
														<tr>
															<td>Pick File #2:</td>
															<td><input type="file" name="fileUpload" size="50" /></td>
														</tr>
														<tr>
															<td colspan="2" align="center"><input type="submit" value="Upload" /></td>
														</tr>
													</table>
												</form>
												<br/>
												<br/>
								   <a href="${pageContext.request.contextPath}/forms/user/crmpanel.html">Go to Home page...</a>
                                </div>
                            </div>
                        </div> 
                     </div>
                </div>
           </div>
       <!-- Formrow/ -->     
          
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