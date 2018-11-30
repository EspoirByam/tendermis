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
            <h4 class="panel-title"><span class="fa fa-plus-circle"/> New Negotiation</h4>
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
                               String val= "yes";
                                PreparedStatement ps = conn.prepareStatement("select id, name from tendermis_tender where awardstatus='"+val+"'");
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
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="negotiation_date">Date <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="date" id="dateid" name="negotiation_date" required="required" class="form-control col-md-7 col-xs-12">
                        </div>
                      </div>
                     <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="tender_name">Description <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <textarea id="descrid" name="description" placeholder="Description" required="required" row="3" class="form-control col-md-7 col-xs-12"></textarea>
                        </div>  
                          
                      </div>
                     
                       
                 
                     <div class="form-group"  >
                        <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                          <button class="btn btn-danger" type="button">Cancel</button>
						       
                          <input id="submitonsnegocid" onclick="save()" type="button" value="Submit" class="btn btn-success pull-right"/>
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
                    <th class="column-title">Date</th>
                    <th class="column-title">Description </th>
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
    
                      PreparedStatement p = conn.prepareStatement("select * from tendermis_negociation");
                      ResultSet r=p.executeQuery();
                      while(r.next()){
                      int id = r.getInt(2);
                   
                      String query = "select name from tendermis_tender where id='"+id+"'";
                      PreparedStatement prep = conn.prepareStatement(query);
                      ResultSet rrr= prep.executeQuery();
                
                while(rrr.next()){
                    name = rrr.getString(1);
                }    
                  %> 
                  <tr class="even pointer"><td><%=name %></td><td><%=r.getString(3)%></td><td><%=r.getString(4) %></td><td class=" last"><input id="submitonsdelete" onclick="del(<%=r.getInt(1)%>)" type="button" value="Delete" class="btn btn-success pull-right" /><input data-toggle="modal" data-target="#updateNegociation_<%=r.getInt(1)%>" name="essaiedoc" type="button" value="Update" class="btn btn-success pull-right" /></td></tr> 
    
    
<div class="modal fade" id="updateNegociation_<%=r.getInt(1)%>" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Update Notification</h4>
        </div>
        <div class="modal-body">
           <div class="panel-body">
               
                  <form id="demo-form2" name="myform" data-parsley-validate class="form-horizontal form-label-left">

                     <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="tender">Tender <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <select class="form-control" name="client_name" id="uptenderSelect">
                                <option value="<%=id%>"><%=name%></option>
                                <%
                               
                                PreparedStatement papa = conn.prepareStatement("select id, name from tendermis_tender");
                                        ResultSet mama=papa.executeQuery();
                                            while(mama.next()){
                            
                                %>
                                <option value="<%=mama.getInt(1) %>"><%=mama.getString(2) %></option>
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
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="negotiation_date">Date <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input type="date" id="updateid" name="negotiation_date" value="<%=r.getString(3)%>" required="required" class="form-control col-md-7 col-xs-12">
                        </div>
                      </div><br/><br/>
                     <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="tender_name">Description <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <textarea id="updescrid" name="description" placeholder="Description" required="required" row="3" class="form-control col-md-7 col-xs-12"><%=r.getString(4) %></textarea>
                        </div>  
                          
                      </div><br/><br/><br/>
                     
                       
                 
                     <div class="form-group"  >
                        <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                          <button class="btn btn-danger" type="button">Cancel</button>
						       
                          <input id="upsubmitonsnegocid" onclick="updateNegociation(<%=r.getInt(1) %>)" type="button" value="Submit" class="btn btn-success pull-right"/>
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



<script>
    document.getElementById('tenderSelect').addEventListener('change', function () {
    var style = this.value == 0 ? 'block' : 'none';    
    document.getElementById('clientName').style.display = style;        
});

function save()
{
var btnnegocd = document.getElementById("submitonsnegocid").value;   
var tender_id = document.getElementById("tenderSelect").value;
var dateD = document.getElementById("dateid").value;
var description = document.getElementById("descrid").value;

// Returns successful data submission message when the entered information is stored in database.
var negociationDataString = 'btnnegocd1='+btnnegocd+'&tender_id1='+tender_id+'&dateD1='+ dateD+ '&description1=' + description;
 
if (tender_id == '[ Select ]'|| dateD==''|| description =='') {
    alert("All the fields have to be filled");
    //document.write(tenderDataString);
    //console.error(submitcomment);

}
else
{
// AJAX code to submit form.
$.ajax({
type: "post",
url: "class/negociationcontrolor.jsp",
data: negociationDataString,
async:false,
success: function(html) {
alert("well saved");
document.forms[0].action = "index.jsp?request=negotiation";
document.forms[0].method = "post";
document.forms[0].submit();
}
});
//console.error();
}
return false;
}

function del(id){
     var bt = document.getElementById("submitonsdelete");
       if(confirm("Do you really want to delete this component?")){
          
         var deleteCompoData = 'id1='+id + '&btn1='+bt;
        
         if(id=='')
          {
              alert("the component doesn't exist");
         }
       else
      {
$.ajax({
type: "post",
url: "class/negociationcontrolor.jsp",
data: deleteCompoData,
async:false,
success: function(html) {
alert("well deleted");
//response.sendRedirect("error.jsp");

}
});
}
}
return false;
}

function updateNegociation(id)
{
    var upbtnnegocd = document.getElementById("upsubmitonsnegocid").value;   
    var uptender_id = document.getElementById("uptenderSelect").value;
    var updateD = document.getElementById("updateid").value;
    var updescription = document.getElementById("updescrid").value;
    
    var UpdatenegociationDataString = 'upbtnnegocd1='+upbtnnegocd+'&uptender_id1='+uptender_id+'&updateD1='+ updateD+ '&updescription1=' + updescription+'&myid1='+id;
//    
     
    
        $.ajax({
        type: "post",
        url: "class/negociationcontrolor.jsp",
        data: UpdatenegociationDataString,
        async:false,
        success: function(html) {
        alert("well deleted");
}
}); 
//        
    

    
}
</script>