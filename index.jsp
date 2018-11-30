<!DOCTYPE html>
<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Tender-Management-System</title>

    <!-- Bootstrap -->
    <link href="vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- bootstrap-daterangepicker -->
    <link href="vendors/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet">
    <!-- bootstrap-datetimepicker -->
    <link href="vendors/bootstrap-datetimepicker/build/css/bootstrap-datetimepicker.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="vendors/nprogress/nprogress.css" rel="stylesheet">
    <!-- bootstrap-wysiwyg -->
    <link href="vendors/google-code-prettify/bin/prettify.min.css" rel="stylesheet">
     <!-- Custom Theme Style -->
    <link href="build/css/custom.min.css" rel="stylesheet">
    <!-- Custom styling plus plugins -->
    <link href="build/css/custom.min.css" rel="stylesheet">
    
    <!-- Datatables -->
    <link href="vendors/datatables.net-bs/css/dataTables.bootstrap.min.css" rel="stylesheet">
    <link href="vendors/datatables.net-buttons-bs/css/buttons.bootstrap.min.css" rel="stylesheet">
    <link href="vendors/datatables.net-fixedheader-bs/css/fixedHeader.bootstrap.min.css" rel="stylesheet">
    <link href="vendors/datatables.net-responsive-bs/css/responsive.bootstrap.min.css" rel="stylesheet">
    <link href="vendors/datatables.net-scroller-bs/css/scroller.bootstrap.min.css" rel="stylesheet">
     <script src="vendors/jquery/dist/jquery.min.js"></script>
     <script type="text/javascript">
   	  function showDoc(str) {
                  if (str=="") {
                    document.getElementById("notifyStatus").innerHTML="";
                    return;
                  }
                  if (window.XMLHttpRequest) {
                   xmlhttp=new XMLHttpRequest();
                  } 
                  else 
                  {
                    xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
                  }
                  xmlhttp.onreadystatechange=function() {
                    if (this.readyState==4 && this.status==200) {
                      document.getElementById("notifyStatus").innerHTML=this.responseText;
                    }
                  };
                  xmlhttp.open("GET","class/ajaxcontrolor.jsp?key="+str,true);
                  xmlhttp.send();
                }
</script>
     
 
  </head>

  <body class="nav-md">
     
   <div class="container body">
      <div class="main_container">

        <!-- side_bar -->
        <jsp:include page="side_bar.jsp"/>
        <!-- /side_bar -->

        <!-- top navigation -->
        <jsp:include page="top_nav.jsp"/>
        <!-- /top navigation -->

        <!-- page content -->
    
            <%

	        if ("registration".equals(request.getParameter("request"))) {
	    %>  
                <jsp:include page="views/tender_registration.jsp"/> 
            <%                
                }
             else if ("preparation".equals(request.getParameter("request"))) { 

            %>
                <jsp:include page="views/tender_preparation.jsp"/>
            <%
                }
             else if ("dashboard".equals(request.getParameter("request"))) { 

            %>
                <jsp:include page="views/dashboard.jsp"/>
            <%
                }
             else if ("submission".equals(request.getParameter("request"))) { 

            %>
                <jsp:include page="views/tender_submission.jsp"/>
            <%
                }
             else if ("display_client".equals(request.getParameter("request"))) { 

            %>
                <jsp:include page="views/display_client.jsp"/>
            <%
                }
             else if ("display_bidder".equals(request.getParameter("request"))) { 

            %>
                <jsp:include page="views/display_bidder.jsp"/>
            <%
                }
             else if ("opening".equals(request.getParameter("request"))) { 

            %>
                <jsp:include page="views/tender_opening.jsp"/>
            <%
                }
             else if ("notification".equals(request.getParameter("request"))) { 

            %>
                <jsp:include page="views/tender_notification.jsp"/>
            <%
                }
             else if ("award".equals(request.getParameter("request"))) { 

            %>
                <jsp:include page="views/tender_award.jsp"/>
            <%
                }
             else if ("negotiation".equals(request.getParameter("request"))) { 

            %>
                <jsp:include page="views/tender_negotiation.jsp"/>
            <%
                }
             else if ("contract".equals(request.getParameter("request"))) { 

            %>
                <jsp:include page="views/tender_contract.jsp"/>
            <%
                }
             else if ("competitor".equals(request.getParameter("request"))) { 

            %>
                <jsp:include page="views/competitor.jsp"/>
            <%
                }
             else if ("document".equals(request.getParameter("request"))) { 

            %>
                <jsp:include page="views/document.jsp"/>
            <%
                }
             else if ("purchase".equals(request.getParameter("request"))) { 

            %>
                <jsp:include page="views/purchase.jsp"/>
            <%
                }
             else if ("communication".equals(request.getParameter("request"))) { 

            %>
                <jsp:include page="views/tender_communication.jsp"/>
            <%
                }
             else if ("newClientContact".equals(request.getParameter("request"))) { 

            %>
                <jsp:include page="views/new_client_contact.jsp"/>
            <%
                }
             else if ("newclient".equals(request.getParameter("request"))) { 

            %>
                <jsp:include page="views/new_client.jsp"/>
            <%
                }
             else if ("display_doc".equals(request.getParameter("request"))) { 

            %>
                <jsp:include page="views/display_doc.jsp"/>
            <%
                }
             else if ("_staff".equals(request.getParameter("request"))) { 

            %>
                <jsp:include page="views/tender_staff.jsp"/>
            <%
                }
             else if ("_office".equals(request.getParameter("request"))) { 

            %>
                <jsp:include page="views/tender_office.jsp"/>
            <%
                }
                         
             else if ("client_list".equals(request.getParameter("request"))){
            %>
             <jsp:include page="views/client_list.jsp"/>
             <%
                 }
             else  {
            %>
             <jsp:include page="views/dashboard.jsp"/>
             <%
                 }
             %>
        <!-- /page content -->

        <!-- footer content -->
        <jsp:include page="footer.jsp"/>
        <!-- /footer content -->
      </div>
    </div>

    <!-- compose -->
    
    <!-- /compose -->

    <!-- jQuery -->
    <script src="vendors/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap -->
    <script src="vendors/bootstrap/dist/js/bootstrap.min.js"></script>
    
      <!-- bootstrap-daterangepicker -->
    <script src="vendors/moment/min/moment.min.js"></script>
    <script src="vendors/bootstrap-daterangepicker/daterangepicker.js"></script>
    <!-- bootstrap-datetimepicker -->    
    <script src="vendors/bootstrap-datetimepicker/build/js/bootstrap-datetimepicker.min.js"></script>
    <!-- FastClick -->
    <script src="vendors/fastclick/lib/fastclick.js"></script>
    <!-- NProgress -->
    <script src="vendors/nprogress/nprogress.js"></script>
    <!-- bootstrap-wysiwyg -->
    <script src="vendors/bootstrap-wysiwyg/js/bootstrap-wysiwyg.min.js"></script>
    <script src="vendors/jquery.hotkeys/jquery.hotkeys.js"></script>
    <script src="vendors/google-code-prettify/src/prettify.js"></script>
  
    <!-- jQuery Smart Wizard -->
    <script src="vendors/jQuery-Smart-Wizard/js/jquery.smartWizard.js"></script>
       
    <!-- bootstrap-datetimepicker -->    
    <script src="vendors/bootstrap-datetimepicker/build/js/bootstrap-datetimepicker.min.js"></script>
    
    <!-- Datatables -->
    <script src="vendors/datatables.net/js/jquery.dataTables.min.js"></script>
    <script src="vendors/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
    <script src="vendors/datatables.net-buttons/js/dataTables.buttons.min.js"></script>
    <script src="vendors/datatables.net-buttons-bs/js/buttons.bootstrap.min.js"></script>
    <script src="vendors/datatables.net-buttons/js/buttons.flash.min.js"></script>
    <script src="vendors/datatables.net-buttons/js/buttons.html5.min.js"></script>
    <script src="vendors/datatables.net-buttons/js/buttons.print.min.js"></script>
    <script src="vendors/datatables.net-fixedheader/js/dataTables.fixedHeader.min.js"></script>
    <script src="vendors/datatables.net-keytable/js/dataTables.keyTable.min.js"></script>
    <script src="vendors/datatables.net-responsive/js/dataTables.responsive.min.js"></script>
    <script src="vendors/datatables.net-responsive-bs/js/responsive.bootstrap.js"></script>
    <script src="vendors/datatables.net-scroller/js/dataTables.scroller.min.js"></script>
    <script src="vendors/jszip/dist/jszip.min.js"></script>
    <script src="vendors/pdfmake/build/pdfmake.min.js"></script>
    <script src="vendors/pdfmake/build/vfs_fonts.js"></script>

    <!-- Custom Theme Scripts -->
    <script src="build/js/custom.min.js"></script>
    <!-- Initialize datetimepicker -->
    <script>
    $('#myDatepicker').datetimepicker();
    
    $('#myDatepicker2').datetimepicker({
        format: 'DD.MM.YYYY'
    });
    
    $('#myDatepicker3').datetimepicker({
        format: 'hh:mm A'
    });
    
    $('#myDatepicker4').datetimepicker({
        ignoreReadonly: true,
        allowInputToggle: true
    });

    $('#datetimepicker6').datetimepicker();
    
    $('#datetimepicker7').datetimepicker({
        useCurrent: false
    });
    
    $("#datetimepicker6").on("dp.change", function(e) {
        $('#datetimepicker7').data("DateTimePicker").minDate(e.date);
    });
    
    $("#datetimepicker7").on("dp.change", function(e) {
        $('#datetimepicker6').data("DateTimePicker").maxDate(e.date);
    });
</script>

  </body>
</html>