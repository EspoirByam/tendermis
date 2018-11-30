 <!-- page content -->
 <%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="core.*" %>
<%
        db d = new db();
        Connection conn = d.getcon();
    
    %>
    <div class="right_col" role="main">
      
        <a class="panel-heading" role="tab" id="headingOne" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
            <h4 class="panel-title"><span class="fa fa-plus-circle"/> New Award</h4>
        </a>
        <div id="collapseOne" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOne">
              <div class="panel-body">
                 <form id="demo-form2" name="myform" data-parsley-validate class="form-horizontal form-label-left">

                     <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="tender">Tender <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <select class="form-control" name="client_name" id="tenderSelect">
                                <option disabled selected>[ Select ]</option>
                             <%
                                String def ="submitted";
                                PreparedStatement ps = conn.prepareStatement("select id, name from tendermis_tender where status ='"+def+"'");
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
                     <div class="form-group" id="clientName" style="display: none;">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="client_name">Client Name
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input type="text" id="last-name" name="tender_number" disabled class="form-control col-md-7 col-xs-12" value="Smart Best Ltd">
                        </div>
                      </div>                      
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="award_date">Date <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="date" id="dateaward" name="award_date" required="required" class="form-control col-md-7 col-xs-12">
                        </div>
                      </div>
                     <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="tender_name">Award Status <span class="required">*</span>
                        </label>
                        <div class="col-md-3 col-sm-3 col-xs-12">
                            <label><input type="radio" name="award_status" required="required" value="yes">Yes</label>
                        </div>  
                         <div class="col-md-3 col-sm-3 col-xs-12">
                             <label><input type="radio" name="award_status" required="required" value="no">No</label>
                        </div>  
                      </div>
                     <div class="form-group"  >
                        <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                          <button class="btn btn-danger" type="button">Cancel</button>
						       
                          <input id="submitaward" onclick="saveAw()" type="button" value="Submit" class="btn btn-success pull-right"/>
                        </div>
                      </div>

                    </form>
              </div>
            </div>
        
    <div class="table-responsive">
             <table id="datatable" class="table table-striped jambo_table bulk_action">
                <thead>
                  <tr class="headings">
                  
                    <th class="column-title">Name</th>
                    <th class="column-title">Date</th>
                    <th class="column-title">Status </th>
                    <th class="column-title no-link last"><span class="nobr">Action</span>
                    </th>
                    <th class="bulk-actions" colspan="7">
                      <a class="antoo" style="color:#fff; font-weight:500;">Bulk Actions ( <span class="action-cnt"> </span> ) <i class="fa fa-chevron-down"></i></a>
                    </th>
                  </tr>
                </thead>

                <tbody>
                     <%
                      String name="";
                      String bidder_name="";
                      String ok ="";
    
                      PreparedStatement p = conn.prepareStatement("select * from tendermis_award");
                      ResultSet r=p.executeQuery();
                      while(r.next()){
                      int tender_id = r.getInt(2);
                   
                      String query = "select name from tendermis_tender where id='"+tender_id+"'";
                      PreparedStatement prep = conn.prepareStatement(query);
                      ResultSet rrr= prep.executeQuery();
                
                while(rrr.next()){
                    name = rrr.getString(1);
                }
                 
                
                  %> 
                  <tr class="even pointer"><td><%=name %></td><td><%=r.getString(3) %></td><td><%=r.getString(4) %></td><td class=" last"><input id="submitonsdelete" onclick="del(<%=r.getInt(1)%>,<%=tender_id%>)" type="button" value="Delete" class="btn btn-success pull-right" /><input data-toggle="modal" data-target="#updateAward_<%=r.getInt(1)%>" id="submitonsprepare" type="button" value="Update" class="btn btn-success pull-right" /></td></tr> 
                  
 <div class="modal fade" id="updateAward_<%=r.getInt(1)%>" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Update Award</h4>
        </div>
        <div class="modal-body">
           <div class="panel-body">
                 <form id="demo-form2" name="myform" data-parsley-validate class="form-horizontal form-label-left">

                     <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="tender">Tender <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <select class="form-control" name="client_name" id="tenderSelect">
                                <option disabled selected><%=name %></option>
                                <%
                               
                                PreparedStatement oo = conn.prepareStatement("select id, name from tendermis_tender");
                                        ResultSet aa=oo.executeQuery();
                                            while(aa.next()){
                            
                            %>
                            <option value="<%=aa.getInt(1) %>"><%=aa.getString(2) %></option>
                            <%
                              }
                            %>                                   
                          </select>
                        </div>
                      </div>
                     <div class="form-group" id="clientName" style="display: none;">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="client_name">Client Name
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input type="text" id="last-name" name="tender_number" disabled class="form-control col-md-7 col-xs-12" value="Smart Best Ltd">
                        </div>
                      </div>                      
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="award_date">Date <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input type="date" id="dateaward" name="award_date" required="required" value="<%=r.getString(3) %>" class="form-control col-md-7 col-xs-12">
                        </div>
                      </div>
                             
                     <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="tender_name">Award Status <span class="required">*</span>
                        </label>
                        
                                <input type="radio" name="award_status" required="required"  value="yes">Awarded
                                <input type="radio" name="award_status" required="required"value="yes">Not awarded
              
                      </div>
                            
                     <div class="form-group"  >
                        <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                          <button class="btn btn-danger" type="button">Cancel</button>
						       
                          <input id="submitaward" onclick="saveAw()" type="button" value="Submit" class="btn btn-success pull-right"/>
                        </div>
                      </div>
                        
                    </form>
              </div>
        </div>
        
      </div>
      
    </div>
  </div>
 
 <%
 }
%> 
                  
                 </tbody>
              </table>
    </div>
</div>
<!-- /page content -->

 <!-- Modal -->
  <div class="modal fade" id="newSubmissionWay" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">New Submission Way</h4>
        </div>
        <div class="modal-body">
           <div class="panel-body">
                  <form id="demo-form2" name="myform" data-parsley-validate class="form-horizontal form-label-left">
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="submission_way">Name <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="text" id="last-name" name="submission_way" required="required" class="form-control col-md-7 col-xs-12">
                        </div>
                      </div>                     
                                   
                      <div class="form-group"  >
                        <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                            <button class="btn btn-danger" type="button" data-dismiss="modal">Cancel</button>						       
                          <button type="submit" class="btn btn-success pull-right">Submit</button>
                        </div>
                      </div>
                  </form>
              </div>
        </div>
        
      </div>
      
    </div>
  </div>
 
 
 
  
 
 
<script>
    document.getElementById('tenderSelect').addEventListener('change', function () {
    var style = this.value == 0 ? 'block' : 'none';    
    document.getElementById('clientName').style.display = style;        
});

function saveAw()
{
var submitaward =  document.getElementById("submitway");
var tender = document.getElementById("tenderSelect").value;
var dateaward = document.getElementById("dateaward").value;

var status = document.getElementsByTagName('input');
var statusLength = status.length;

for (var i = 0 ; i < statusLength ; i++) 
{
    if (status[i].type == 'radio' && status[i].checked) 
    {
        var statusfinal = status[i].value;
    }
    
}

//// Returns successful data submission message when the entered information is stored in database.
var awardDataString ='submitaward1='+submitaward+'&tender1='+ tender+ '&dateaward1=' + dateaward + '&statusfinal1=' + statusfinal;

if (tender == '[ Select ]' || dateaward == ''|| statusfinal=='') {
    alert("All the fields have to be filled");
}
else
{
// AJAX code to submit form.
$.ajax({
type: "post",
url: "class/awardcontrolor.jsp",
data: awardDataString,
async:false,
success: function(html) {
alert("well saved");
document.forms[0].action="index.jsp?request=award";
document.forms[0].method = "post";
document.forms[0].submit();
}
});
//console.error();
}
return false;
}

function del(id, idTender){
     var bt = document.getElementById("submitonsdelete");
       if(confirm("Do you really want to delete this component?")){
          
         var deleteCompoData = 'id1='+id + '&btn1='+bt+'&idTender1='+idTender;
        
         if(id=='')
          {
              alert("the component doesn't exist");
         }
       else
      {
$.ajax({
type: "post",
url: "class/awardcontrolor.jsp",
data: deleteCompoData,
async:false,
success: function(html) {
alert("well deleted");
document.forms[0].action="index.jsp?request=award";
document.forms[0].method = "post";
document.forms[0].submit();
//response.sendRedirect("error.jsp");

}
});
}
}
return false;
}

</script>
	