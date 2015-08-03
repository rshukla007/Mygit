<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
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

            <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>         
        <script type="text/javascript">
            function chkdisble(pageNo){
                 
                $('#dispPage').val(Number(pageNo));
                if(parseInt($('#pageNo').val(), 10) != 1){
                    $('#btnFirst').removeAttr("disabled");
                    $('#btnFirst').css('color', 'Red');
                   // $('#btnFirst').css('color', 'Active');
                    
                }
 
                if(parseInt($('#pageNo').val(), 10) == 1){
                    $('#btnFirst').attr("disabled", "true");
                    $('#btnFirst').css('color', 'gray');                    
                }
 
                if(parseInt($('#pageNo').val(), 10) == 1){
                    $('#btnPrevious').attr("disabled", "true")
                    $('#btnPrevious').css('color', 'gray');
                }
 
                if(parseInt($('#pageNo').val(), 10) > 1){
                    $('#btnPrevious').removeAttr("disabled");
                    $('#btnPrevious').css('color', 'Red');
                   // $('#btnPrevious').addClass('active');
                }
                
 
                if(parseInt($('#pageNo').val(), 10) == parseInt($('#totalPages').val())){
                    $('#btnLast').attr("disabled", "true");
                    $('#btnLast').css('color', 'gray');
                }
 
                else{
                    $('#btnLast').removeAttr("disabled");
                    $('#btnLast').css('color', 'Red');
                   // $('#btnLast').addClass('active');
                }
 
                if(parseInt($('#pageNo').val(), 10) == parseInt($('#totalPages').val())){
                    $('#btnNext').attr("disabled", "true")
                    $('#btnNext').css('color', 'gray');                    
                }
                else{
                    $('#btnNext').removeAttr("disabled");
                    $('#btnNext').css('color', 'Red');    
                    //$('#btnNext').addClass('active');
                    //$('#btnNext').parent.addClass('active');
                    
                }
            }
        </script>
        <script type="text/javascript">
            $(function() {
                $('#btnFirst').click(function() {
                    var totalPages=parseInt($('#totalPages').val(),10);                  
                    if(totalPages>0 && $('#pageNo').val()!="1")
                    {
                        $('#pageNo').val("1");
                        loadTable();
                        $('#dispPage').val("1");
                    }
                  //$('#btnFirst').addClass("active");
                  //$('#btnLast').addClass("active");
                });
            });
        </script>
        <script type="text/javascript">
            $(function() {
                $('#btnLast').click(function() {
                    var totalPages=parseInt($('#totalPages').val(),10);
                    if(totalPages>0)
                    {
                        $('#pageNo').val(totalPages);
                        loadTable();
                        $('#dispPage').val(totalPages);
                    }
                });
            });
        </script>
        <script type="text/javascript">
            $(function() {
                $('#btnNext').click(function() {
                    var pageNo=parseInt($('#pageNo').val());
                    //alert(pageNo);                    
                    var totalPages=parseInt($('#totalPages').val());
                    //alert(totalPages);
                   // var totalPages=parseInt($('#totalPages').val(),10);
                    if(pageNo < totalPages) {
                        $('#pageNo').val(Number(pageNo)+1);
                        loadTable();
                        $('#dispPage').val(Number(pageNo)+1);
                        $('#btnPrevious').removeAttr("disabled");
                    }
                });
            });
 
        </script>
        <script type="text/javascript">
            $(function() {
                $('#btnPrevious').click(function() {
                    var pageNo=$('#pageNo').val();
                    if(parseInt(pageNo, 10) > 1)
                    {
                        $('#pageNo').val(Number(pageNo) - 1);
                        loadTable();
                        $('#dispPage').val(Number(pageNo) - 1);
                    }
                });
            });
        </script>
        <script type="text/javascript">
            $(function() {
                $('#btnGoto').click(function() {
                    var pageNo=parseInt($('#dispPage').val(),10);
                    var totalPages=parseInt($('#totalPages').val(),10);
                    if(pageNo > 0)
                    {
                        if(pageNo <= totalPages) {
                            $('#pageNo').val(Number(pageNo));
                            loadTable();
                            $('#dispPage').val(Number(pageNo));
                        }
                    }
                });
            });
        </script>
        <script type="text/javascript">            
            function loadTable()
            {
                $.post("<%=request.getContextPath()%>/DataServlet", {pageNo: $("#pageNo").val(),size: $("#size").val()},  function(j){
                     
                    $('#resultTable').find("tr:gt(0)").remove();
                    $('#resultTable tr:last').after(j);
 
                    if($('#noRecordFound').val() == "noRecordFound")
                    {
                        $('#pagination').hide();
                    }
                    else
                    {
                        $('#pagination').show();
                    }
                     
                    if($("#totalPages").val() == 1)
                    {
                    	 
                        $('#btnNext').attr("disabled", "true");
                        $('#btnLast').attr("disabled", "true");
                    }
                    else
                    {
                        $('#btnNext').removeAttr("disabled");
                        $('#btnLast').removeAttr("disabled");
                        // $('#btnNext').addClass("active");
                        
                    }
                        $("#pageNoTot").html($("#pageNo").val());
                        chkdisble($("#pageNo").val());
                        $("#pageTot").html($("#totalPages").val());
                });
            }
        </script>
        <link href="jQuery/jquery-ui-1.8.5.custom.css" rel="stylesheet" type="text/css" />
        <link rel="stylesheet" type="text/css" href="../../css/bootstrap.css" />
        <link rel="stylesheet" type="text/css" href="../../css/bootstrap.min.css" />
        <link rel="stylesheet" type="text/css" href="../../css/font-awesome.min.css" />
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
                        </ul>
				  </div>
			  </div>
         <!-- row -->
         <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Manage User</h1>
                </div>                            
            <!--row -->			
                <div class="row">
                <div class="col-lg-3 col-md-6">
                    <div class="panel panel-primary">
                       <div class="btn-group btn-group-justified" role="group" aria-label="...">
						  <div class="btn-group" role="group">
						    <button type="button" class="btn btn-success" onClick="location.href='userregistration.html'">+ Add</button>
						  </div>
						  <div class="btn-group" role="group">
						    <button type="button" class="btn btn-default">Export</button>
						  </div>
						  <div class="btn-group" role="group">
						    <button type="button" class="btn btn-default">Print</button>
						  </div>
						</div>
                    </div>
                  </div>
               </div>
        <!-- /row -->     
                <form:form action="#">                  
                   Go to : <select name="foo" id="foo" value="${myBean.foo}">
					    <option value="">ALL</option>
					    <core:forEach var="User" items="${allUserList}">
					        <%-- <option value="${User}" ${User.userEmail == val ? 'selected' : ' '}><c:out value="${val}" ></c:out></option> --%>   
					        <option value="${User.userEmail}"><core:out value="${User.userEmail}" ></core:out></option>
					    </core:forEach>                
				  </select>  				                 
               </form:form> 
               <br/>
		<!--<div class="row">
			<div class="col-lg-12">
		 	  <div class="panel panel-default">
				   <div class="panel-heading"> 
                         <i class="fa fa-bar-chart-o fa-fw"></i> Welcome to CRMSoft
                   </div>
						<div class="panel-body">  
							TEST
						</div>				  
			  </div>
			</div>
		   </div>
 		 -->
 		 <div class="row">
			<div class="col-lg-12">
   			          <div class="panel panel-default">
                      	    <div class="panel-heading">
                               <i class="fa fa-bar-chart-o fa-fw"></i> Registered Users
                        	</div>
                             <div class="panel-body"> 
                                 <div class="row"> 
									<div class="table-responsive">
                                        <!-- <table class="table table-bordered table-hover table-striped">
                                            <thead>
                                                <tr>
                                                    <th>#</th>
                                                    <th>Date</th>
                                                    <th>Time</th>
                                                    <th>Amount</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td>3326</td>
                                                    <td>10/21/2013</td>
                                                    <td>3:29 PM</td>
                                                    <td>$321.33</td>
                                                </tr>
                                             </tbody>
                                          </table> -->
                                     </div>
                                          <table width="100%" cellspacing="0" id="resultTable" class="table table-bordered table-hover table-striped">
									            <tr>
									                <th align="center">#</th>
									                <th align="center">Name</th>
									                <th align="center">Email</th>
									                <th align="center">Gender</th>
									                <th align="center">Phone No</th>
									                <th align="center">Address</th>
									            </tr>
									        </table>
									
									        <table width="100%" border="0" cellspacing="0" cellpadding="0" id="pagination" class="table table-stripped">
									            <tr>
									                <td align="left" width="30%">Page <span id="pageNoTot">1</span> of <span id="pageTot">10</span></td>
									                <td align="center" width="40%"><input name="textfield3" type="text" id="dispPage" value="1" class="formTxtBox_1" style="width:20px;" />
									                    &nbsp;
									                    <select name="size" id="size">
									                        <option value="10">10</option>
									                        <option value="20">20</option>
									                        <option value="30">30</option>
									                    </select>
									                    &nbsp;
									                    <label class="formBtn_1">
									                        <input type="submit" name="button" id="btnGoto" id="button" value="Go To Page" />
									                    </label></td>
									                <td width="30%">
									                    <ul class="pagination">
									                        <li><a href="javascript:void(0)" disabled id="btnFirst">First</a></li>
									                        <li><a href="javascript:void(0)" disabled id="btnPrevious">Previous</a></li>
									                        <li><a href="javascript:void(0)" id="btnNext">Next</a></li>
									                        <li><a href="javascript:void(0)" id="btnLast">Last</a></li>
									                    </ul>
									                </td>
									            </tr>
									        </table>        
									            <input type="hidden" id="pageNo" value="1"/>            
									        <script type="text/javascript">
									            loadTable();
									        </script> 
                                  </div>
                                 </div>
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