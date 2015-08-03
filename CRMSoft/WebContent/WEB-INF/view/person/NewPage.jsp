<%-- 
    Document   : index
    Created on : Jan 31, 2011, 11:13:55 AM
    Author     : TaherT
--%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pagination Through JQuery Ajax</title>
        <link href="home.css" rel="stylesheet" type="text/css" />
        <link href="theme_1.css" rel="stylesheet" type="text/css" />
      <!--   <script src="jQuery/jquery-1.4.3.min.js" type="text/javascript"></script>
        <script src="jQuery/jquery.validate.js"type="text/javascript"></script> -->
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
    <body>
 <div class="container">
		<div class="well">
			<strong>List of Persons</strong>
		</div>
        <table width="100%" cellspacing="0" id="resultTable" class="table table-stripped">
            <tr>
                <th align="center">Serial. No.</th>
                <th align="center">Student Name.</th>
                <th align="center">Student Std.</th>
                <th align="center">Address.</th>
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
	    <script type="text/javascript" src="../../js/jquery.js"></script>
	    <script type="text/javascript" src="../../js/bootstrap.min.js"></script>
    </body>
</html>