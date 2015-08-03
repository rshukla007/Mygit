<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"  %>
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

<style>
/* CSS used here will be applied after bootstrap.css */

body { 
 background: url('../../images/men.jpg') no-repeat center center fixed; 
 -webkit-background-size: cover;
 -moz-background-size: cover;
 -o-background-size: cover;
 background-size: cover;
}

.panel-default {
 opacity: 0.9;
 margin-top:30px;
}
.form-group.last {
 margin-bottom:0px;
}
</style>

</head>
<body class="theme-green">
<div class="container">
    <div class="row">
        <div class="col-md-4 col-md-offset-7">
            <div class="panel panel-default">
                <div class="panel-heading"> <strong class="">Login</strong>

                </div>
                <div class="panel-body">
                       <form:form commandName="user" action="userlogin.html" class="form-horizontal" role="form">
                        <div class="form-group">                            
                            <form:label path="userEmail" class="col-sm-3 control-label">UserID</form:label>
                            <div class="col-sm-9">
                                  <form:input path="userEmail" class="form-control" placeholder="Email" required="" type="email"/>
                                  <font color="red" size="1px"><form:errors path="userEmail"></form:errors></font>     
                            </div>
                            
                        </div>
                        <div class="form-group">
                            <form:label path="password" class="col-sm-3 control-label">Password</form:label>
                            <div class="col-sm-9">
                                 <form:password path="password" class="form-control" placeholder="Password" required=""/>
                                 <font color="red" size="1px"><form:errors path="password"></form:errors></font>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-3 col-sm-9">
                                <div class="checkbox">
                                    <label class="">
                                        <input class="" type="checkbox">Remember me</label>
                                </div>
                            </div>
                        </div>
                        <div class="form-group last">
                            <div class="col-sm-offset-3 col-sm-9">                                
                                <input type="submit" value="Login" class="btn btn-success btn-sm"/>
                                <button type="reset" class="btn btn-default btn-sm">Reset</button>
                            </div>
                        </div>
                   </form:form> 
                </div>
                <div class="panel-footer">Not Registered? <a href="#" class="">Register here</a>
                </div>
            </div>
        </div>
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