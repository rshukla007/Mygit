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
	<script type="text/javascript">
   
    $(document).ready(function() {
      
      $('#newSmartphoneForm').submit(function(event) {
    	  
    	  var leadName = $('#leadName').val();
    	  var leadName = $('#leadName').val();
    	  var leadName = $('#leadName').val();
    	  var json = { "leadType" : leadName, "leadName" : leadName, "leadDate": leadName};
    	  
        $.ajax({
        	url: $("#newSmartphoneForm").attr( "action"),
        	data: JSON.stringify(json),
        	type: "POST",
        	
        	beforeSend: function(xhr) {
        		xhr.setRequestHeader("Accept", "application/json");
        		xhr.setRequestHeader("Content-Type", "application/json");
        	},
        	success: function(data) {
        		var respContent = "";
        		
		  		respContent += "<span class='success'>New Lead created: [";
		  		respContent += data.leadType + " : ";
		  		respContent += data.leadName + " : " ;
		  		respContent += data.leadDate + "]</span>";
        		
        		$("#sPhoneFromResponse").html(respContent);   		
        	}
        });
         
        event.preventDefault();
      });
       
    });   
  </script>
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
                    <h1 class="page-header">Manage Category:</h1>
                </div> 
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            New Category
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-6">
								   <form:form method="POST" action="saveCategory.html">  
									      <table>  
									       <tr>  
									           <td><form:label path="categoryId">Category ID (read only) :</form:label></td>  
									           <td><form:input path="categoryId" readonly="true"/></td>  
									       </tr>  
									       <tr>  
									           <td><form:label path="categoryName">Category Name :</form:label></td>  
									           <td><form:input path="categoryName" value="${category.categoryName}"/></td>  
									       </tr>  
									         
									       <tr>  
									       <tr>  
									        <td>&nbsp;</td>  
									         <td><input type="submit" value="SAVE" class="btn btn-default"/></td>  
									         </tr>  
									   </table>   
									  </form:form>  
									  <br/>
									  <br/>
									  <a href="#">Adding Products</a> | <a href="${pageContext.request.contextPath}/forms/user/crmpanel.html">Go to Dashboard...</a> 
									  <hr/>								    
									  <core:if test="${!empty categories}">  
										 <table align="center" border="1">  
										  <tr>  
										   <th>Category ID</th>  
										   <th>Category Name</th>  
										   <th>Options</th>  
										   </tr>
										   <core:forEach items="${categories}" var="category">  
										   <tr>  
										    <td><core:out value="${category.categoryId}"/></td>  
										    <td><core:out value="${category.categoryName}"/></td>  
										    <td align="center"><a href="editCategory.html?categoryId=${category.categoryId}">Edit</a> | <a href="deleteCategory.html?categoryId=${category.categoryId}">Delete</a></td>  
										   </tr>  
										  </core:forEach>  
										 </table>  
								      </core:if>                                      
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