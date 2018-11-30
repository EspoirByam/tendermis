 <!-- page content -->
 <%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
 <%@page import="core.*" %>

  <%
        db d = new db();
        d.connection();
        Connection conn = d.getcon();
    
    %>
    
    <div class="right_col" role="main">
      
        <a class="panel-heading" role="tab" id="headingOne" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
            <h4 class="panel-title"><span class="fa fa-plus-circle"/> New Submission</h4>
        </a>
        <div id="collapseOne" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOne">
              <div class="panel-body">
                 <form id="demo-form2" name="myform" data-parsley-validate class="form-horizontal form-label-left">

                       <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="tender">Tender <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <select class="form-control" name="client_name" id="tenderid">
                                <option disabled selected>[ Select ]</option>
                                <%
                                String etat = "pending";
                                PreparedStatement ps = conn.prepareStatement("select id,name from tendermis_tender where status = '"+etat+"'");
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
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="submission_date">Submission Date <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="date" id="submission_dateid" name="submission_date" required="required" class="form-control col-md-7 col-xs-12">
                        </div>
                      </div>
                  
                     <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="tender">Submission Way <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <select class="form-control" name="submission_way" id="submission_wayid">
                            <option>[ Select ]</option>
                            <option data-toggle="modal" data-target="#newSubmissionWay">New Way</option>
                            <%
                               
                                PreparedStatement pt = conn.prepareStatement("select id,name from tendermis_submission_way");
                                        ResultSet re=pt.executeQuery();
                                            while(re.next()){
                            
                            %>
                            <option value="<%=re.getInt(1) %>"><%=re.getString(2) %></option>
                            <%
                              }
                            %>                                   
                          </select>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="tender_name">Comment <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <textarea id="commentid" name="comment" placeholder="Add some commment" required="required" class="form-control col-md-7 col-xs-12">
                                
                            </textarea>
                        </div>                       
                      </div>
                 
                     <div class="form-group"  >
                        <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                          <button class="btn btn-danger" type="button">Cancel</button>
						       
                          <input id="submitonssubid" onclick="save()" type="button" value="Submit" class="btn btn-success pull-right"/>
                        </div>
                      </div>

                    </form>
              </div>
            </div>
        
        <div class="table-responsive">
             <table id="datatable" class="table table-striped jambo_table bulk_action">
                <thead>
                  <tr class="headings">
                  
                    <th class="column-title">Tender</th>
                    <th class="column-title">Submission Date</th>
                    <th class="column-title">Submission Way </th>
                    <th class="column-title">Comment</th>
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
                      String submissionWay = "";
    
                      PreparedStatement p = conn.prepareStatement("select * from tendermis_tender_submission");
                      ResultSet r=p.executeQuery();
                      while(r.next()){
                      int id = r.getInt(2);
                   
                      String query = "select name from tendermis_tender where id='"+id+"'";
                      PreparedStatement prep = conn.prepareStatement(query);
                      ResultSet rrr= prep.executeQuery();
                
                while(rrr.next()){
                    name = rrr.getString(1);
                }
                
                int tender_sub_way = r.getInt(4);
                String req = "select name from tendermis_submission_way where id='"+tender_sub_way+"'";
                PreparedStatement pp = conn.prepareStatement(req);
                ResultSet resu= pp.executeQuery();
                
                while(resu.next()){
                    submissionWay = resu.getString(1);
                }
                
                    
                  %> 
                  <tr class="even pointer"><td><%=name %></td><td><%=r.getString(3) %></td><td><%=submissionWay %></td><td><%=r.getString(5) %></td><td class=" last"><input id="submitonsdelete" onclick="del(<%=r.getInt(1)%>,<%=id%>)" type="button" value="Delete" class="btn btn-success pull-right" /><input data-toggle="modal" data-target="#updateSubmission_<%=r.getInt(1)%>" name="essaiedoc" type="button" value="Update" class="btn btn-success pull-right" /></td></tr> 
   
<div class="modal fade" id="updateSubmission_<%=r.getInt(1)%>" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Update Submission</h4>
        </div>
        <div class="modal-body">
           <div class="panel-body">
                <form id="demo-form2" name="myform" data-parsley-validate class="form-horizontal form-label-left">

                     
                       <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="tender">Tender <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <select class="form-control" name="client_name" id="uptenderid">
                                <option value="<%=id%>"><%=name%></option>
                                <%
                                    String pending ="pending";
                               
                                PreparedStatement ay = conn.prepareStatement("select id,name from tendermis_tender where status='"+pending+"'");
                                        ResultSet aw=ay.executeQuery();
                                            while(aw.next()){
                            
                            %>
                            <option value="<%=aw.getInt(1) %>"><%=aw.getString(2) %></option>
                            <%
                              }
                            %>                             
                          </select>
                        </div>
                      </div><br/><br/>
                     <div class="form-group" id="clientName" style="display: none;">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="client_name">Client Name
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input type="text" id="last-name" name="tender_number" disabled class="form-control col-md-7 col-xs-12" value="Smart Best Ltd">
                        </div>
                      </div>                      
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="submission_date">Submission Date <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input type="date" id="upsubmission_dateid" name="submission_date" required="required" value="<%=r.getString(3)%>" class="form-control col-md-7 col-xs-12">
                        </div>
                      </div><br/><br/>
                          
                  
                     <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="tender">Submission Way <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <select class="form-control" name="submission_way" id="upsubmission_wayid">
                                <option value="<%=tender_sub_way%>"><%=submissionWay%></option>
                            <option data-toggle="modal" data-target="#newSubmissionWay">New Way</option>
                            <%
                               
                                PreparedStatement oyo = conn.prepareStatement("select id,name from tendermis_submission_way");
                                        ResultSet yui=oyo.executeQuery();
                                            while(yui.next()){
                            
                            %>
                            <option value="<%=yui.getInt(1) %>"><%=yui.getString(2) %></option>
                            <%
                              }
                            %>                                   
                          </select>
                        </div>
                      </div><br/><br/>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="tender_name">Comment <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <textarea id="upcommentid" name="comment" placeholder="Add some commment" required="required" class="form-control col-md-7 col-xs-12"><%=r.getString(5)%></textarea>
                        </div>                       
                      </div><br/><br/><br/>
                             
                     <div class="form-group"  >
                        <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                          <button class="btn btn-danger" type="button">Cancel</button>
						       
                          <input id="updatesubmisid" onclick="updateSub(<%=r.getInt(1)%>)" type="button" value="Submit" class="glyphicon glyphicon-trash"/>
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

function save()
{
var btnsubmission = document.getElementById("submitonssubid");
var tender = document.getElementById("tenderid").value;
var submission_date = document.getElementById("submission_dateid").value;
var submission_way = document.getElementById("submission_wayid").value;
var comment = document.getElementById("commentid").value;

// Returns successful data submission message when the entered information is stored in database.
var submissionDataString ='btnsubmission1='+btnsubmission+'&tender1='+ tender+ '&submission_date1=' + submission_date + '&submission_way1=' + submission_way + '&comment1=' + comment;
 
 
if (tender == '[ Select ]' || submission_date == ''|| submission_way=='[ Select ]'|| comment =='') {
    alert("All the fields have to be filled");
    //document.write(tenderDataString);
    //console.error(submitcomment);

}
else
{
// AJAX code to submit form.
$.ajax({
type: "post",
url: "class/submissioncontrolor.jsp",
data: submissionDataString,
async:false,
success: function(html) {
alert("well saved");

document.forms[0].action="index.jsp?request=submission";
document.forms[0].method = "post";
document.forms[0].submit();


}
});
//console.error();
}
return false;
}


 function del(id,id_tender){
     var bt = document.getElementById("submitonsdelete");
       if(confirm("Do you really want to delete this component?")){
          
         var deleteCompoData = 'id1='+id + '&btn1='+bt+'&idtender1='+id_tender;
        
         if(id=='')
          {
              alert("the component doesn't exist");
         }
       else
      {
$.ajax({
type: "post",
url: "class/submissioncontrolor.jsp",
data: deleteCompoData,
async:false,
success: function(html) {
alert("well deleted");

document.forms[0].action="index.jsp?request=submission";
document.forms[0].method = "post";
document.forms[0].submit();
//response.sendRedirect("error.jsp");

}
});
}
}
return false;
}

function updateSub(id)
{
    var tenderid = document.getElementById("uptenderid").value;
    var submitdate = document.getElementById("upsubmission_dateid").value;
     var submitway = document.getElementById("upsubmission_wayid").value;
    var comment = document.getElementById("upcommentid").value;
    var btnupdatesub = document.getElementById("updatesubmisid").value;
    
    var updateSubmissionData = 'upbtnupdatesub1='+btnupdatesub+'&uptenderid1='+tenderid+'&upsubmitdate1='+submitdate+'&upsubmitway1='+submitway+'&upcomment1='+comment +'&upid1='+id;
    
    if(tenderid =='' || submitdate==''||submitway==''||comment=='')
    {
        alert("fill all the componets");
    }
    else
    {
        // AJAX code to submit form.
        $.ajax({
        type: "post",
        url: "class/submissioncontrolor.jsp",
        data: updateSubmissionData,
        async:false,
        success: function(html) {
        alert("well saved");
        document.forms[0].action="index.jsp?request=submission";
        document.forms[0].method = "post";
        document.forms[0].submit();
        }
        });
    }
        
}
</script>
		