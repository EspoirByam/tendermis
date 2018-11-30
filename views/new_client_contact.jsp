 <!-- page content -->
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="core.*" %>
 <%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
 <html>
  <head>
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <script type="text/javascript" src="js/jquery.min.js"></script>
 <script type="text/javascript" src="js/scriptT.min.js"></script>
 
</head>
<body>
    <%
        db d = new db();
        Connection conn = d.getcon();
    
    %>
    <div class="right_col" role="main">
      
        <a class="panel-heading" role="tab" id="headingOne" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
            <h4 class="panel-title"><span class="fa fa-plus-circle"/> New Client Contact</h4>
        </a>
        <div id="collapseOne" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOne">
              <div class="panel-body">
                   <form id="demo-form2" name="myform" data-parsley-validate class="form-horizontal form-label-left">                                       
                   <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="tender_category">Client<span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <select id="idclient" class="form-control" name="tender_issue" >
                            <option disabled selected>[ Select ]</option>
                            <option value="">Add</option>
                            <%
                               
                                PreparedStatement ps = conn.prepareStatement("select * from tendermis_client");
                                        ResultSet rs=ps.executeQuery();
                                            while(rs.next()){
                            
                            %>
                            <option value="<%=rs.getInt(1) %>"><%=rs.getString(2) %></option>
                            <%
                              }
                            %>
                          </select>
                        </div>
                      </div>
                      <div class="form-group">
                       <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">Names<span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="text" id="namesstaff" name="name" required="required" class="form-control col-md-10">
                        </div>
                      </div>
                      <div class="form-group">
                       <label class="control-label col-md-3 col-sm-3 col-xs-12" for="position">Position<span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="text" id="positionstaff" name="position" required="required" class="form-control col-md-10">
                        </div>
                      </div>
                      <div class="form-group">
                       <label class="control-label col-md-3 col-sm-3 col-xs-12" for="phone">Phone <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="text" id="phonenum" name="phone" required="required" class="form-control col-md-10">
                        </div>
                      </div>
                         <div class="form-group">
                       <label class="control-label col-md-3 col-sm-3 col-xs-12" for="phone">Email <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="text" id="emailadd" name="email" required="required" class="form-control col-md-10">
                          
                        </div>
                      </div>
                    
                      
                      
                      <div class="form-group">
                        <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                            <input id="cancelccontact" onclick="cancelcc()" class="btn btn-danger" type="button" value="Cancel"/>
                          <input id="submitonsi" onclick="submitClientStaff()" type="button" value="Submit" class="btn btn-primary pull-right"/>

                        </div>
                      </div>
                  </form>
              </div>
            </div>
        
</div>
    
    
    
    
<script>
function cancelcc()
{
     var style = this.value == 1 ? 'block' : 'none';   
    document.getElementById('demo-form2').style.display = style; 
 }


function submitClientStaff()
{
var client = document.getElementById("idclient").value;
var names = document.getElementById("namesstaff").value;
var posit = document.getElementById("positionstaff").value;
var phonestaff = document.getElementById("phonenum").value;
var emailstaff=document.getElementById("emailadd").value;


//filling the variable acording to the choice done


// Returns successful data submission message when the entered information is stored in database.
var clientstaffDataString = 'client1=' + client + '&names1=' + names + '&posit1=' + posit + '&phonestaff1=' + phonestaff + '&emailstaff1=' + emailstaff;



if (client == '[ Select ]' || names == ''|| posit=='[ Select ]'|| phonestaff ==''||emailstaff=='' ) {
    alert("All the fields have to be filled");
// document.write(clientstaffDataString);
    //console.error(submitcomment);

}
else
{

$.ajax({
type: "post",
url: "class/clientstaffcontrolor.jsp",
data: clientstaffDataString,
async:false,
success: function(html) {
alert("well saved");
}
});
//console.error();
}
return false;
}

</script>
</body>
 </html>