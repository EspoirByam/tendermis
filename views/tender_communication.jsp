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
            <h4 class="panel-title"><span class="fa fa-plus-circle"/> New Communication</h4>
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
                               String val= "yes";
                                PreparedStatement ps = conn.prepareStatement("select id,name from tendermis_tender where awardstatus ='"+val+"'");
                                        ResultSet rs=ps.executeQuery();
                                            while(rs.next()){
                            
                            %>
                            <option value="<%=rs.getString(2) %>"><%=rs.getString(2) %></option>
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
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="communication_date">Date <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="date" id="comdateid" name="communicatio_date" required="required" class="form-control col-md-7 col-xs-12">
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="from">From <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <select class="form-control" name="from" id="provenence">
                            <option disabled selected>[ Select ]</option>
                            <option value="0">Internal</option>
                            <option value="1">External</option>
                          </select>
                        </div>
                      </div>
                     <div class="form-group" id="hidden_div" style="display: none;">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="staff">Staff Name<span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <select class="form-control" name="staff" id="expestaffnameid" >
                            <option disabled selected>[ Select ]</option>
                            <option value="">Add</option>
                            <%
                               
                                PreparedStatement prop = conn.prepareStatement("select id,name from tendermis_client");
                                        ResultSet ror=prop.executeQuery();
                                            while(ror.next()){
                            
                            %>
                            <option value="<%=ror.getString(2) %>"><%=ror.getString(2) %></option>
                            <%
                              }
                            %>          
                          </select>
                        </div>
                      </div>
                      <div class="form-group" id="client_staff" style="display: none;">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="client_staff">Client Staff<span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <select class="form-control" name="client_staff" id="expeclientstaffid" >
                            <option disabled selected>[ Select ]</option>
                            <option data-toggle="modal" data-target="#newClientStaff">Add</option>
                            <%
                               
                                PreparedStatement rop = conn.prepareStatement("select id,names from tendermis_client_staff");
                                        ResultSet pop=rop.executeQuery();
                                            while(pop.next()){
                            
                            %>
                            <option value="<%=pop.getString(2) %>"><%=pop.getString(2) %></option>
                            <%
                              }
                            %> 
                          </select>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="to">To <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <select class="form-control" name="to" id="destination">
                            <option disabled selected>[ Select ]</option>
                            <option value="0">Internal</option>
                            <option value="1">External</option>
                          </select>
                        </div>
                      </div>
                     <div class="form-group" id="staff_name1" style="display: none;">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="staff">Staff Name <span class="required"> *</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <select class="form-control" name="to_staff"  id="destistaffnameid">
                            <option disabled selected>[ Select ]</option>
                            <option value="">Add</option>
                            <%
                               
                                PreparedStatement opq = conn.prepareStatement("select id,name from tendermis_client");
                                        ResultSet oror=opq.executeQuery();
                                            while(oror.next()){
                            
                            %>
                            <option value="<%=oror.getString(2) %>"><%=oror.getString(2) %></option>
                            <%
                              }
                            %>     
                             
                          </select>
                        </div>
                      </div>
                     <div class="form-group" id="client_staff1" style="display: none;">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="to_client_staff">Client Staff<span class="required"> *</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <select class="form-control" name="to_client_staff"  id="desticlientstaffid">
                            <option disabled selected>[ Select ]</option>
                            <option value="">Add</option>
                            <%
                               
                                PreparedStatement prom = conn.prepareStatement("select id,names from tendermis_client_staff");
                                        ResultSet mopr=prom.executeQuery();
                                            while(mopr.next()){
                            
                            %>
                            <option value="<%=mopr.getString(2) %>"><%=mopr.getString(2) %></option>
                            <%
                              }
                            %> 
                          </select>
                        </div>
                      </div>
                         <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="communication_way">Communication Way <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <select class="form-control" name="communication_way" id="communicationwayid">
                                <option disabled>[ Select ]</option>
                            <option value="">New</option>
                            <option value="email">Email</option>
                            <option value="phone">Telephone</option>
                            <option value="social_media">Social Media</option>
                            
                          </select>
                        </div>
                      </div>
                     <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="description">Description <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <textarea name="description" placeholder="Description" id="descriptionid" required="required" class="form-control col-md-7 col-xs-12">
                                
                            </textarea>
                        </div>                       
                      </div>
                 
                       
                 
                     <div class="form-group"  >
                        <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                          <button class="btn btn-danger" type="button">Cancel</button>
						       
                          <input id="btcomm" onclick="save()" type="button" value="Submit" class="btn btn-success pull-right"/>

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
                    <th class="column-title">Way of communication </th>
                    <th class="column-title">From</th>
                    <th class="column-title">To</th>
                    <th class="column-title">Description</th>
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
    
                      PreparedStatement p = conn.prepareStatement("select * from tendermis_tender_communication");
                      ResultSet r=p.executeQuery();
                      while(r.next()){
                      name = r.getString(2);
                
                  %> 
                  <tr class="even pointer"><td><%=name %></td><td><%=r.getString(5) %></td><td><%=r.getString(6) %></td><td><%=r.getString(3) %></td><td><%=r.getString(4) %></td><td><%=r.getString(7) %></td><td class=" last"><input id="submitonsdelete" onclick="del(<%=r.getInt(1)%>)" type="button" value="Delete" class="btn btn-success pull-right" /><input data-toggle="modal" data-target="#updateOpening" id="submitonsprepare" type="button" value="Update" class="btn btn-success pull-right" /></td></tr> 
                  <%
                  }
                  %>
                
                </tbody>
              </table>
    </div>
</div>
<!-- /page content -->


 <!-- Modal -->
  <div class="modal fade" id="newClientStaff" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">New Client Staff</h4>
        </div>
        <div class="modal-body">
           <div class="panel-body">
                <form id="demo-form2" name="myform" data-parsley-validate class="form-horizontal form-label-left">                                       
                   <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="tender_category">Client<span class="required">*</span>
                        </label>
                        <div class="col-md-9 col-sm-9 col-xs-12">
                          <select class="form-control" name="tender_issue" >
                            <option disabled selected>[ Select ]</option>                            
                            <option value="one">Client One</option>
                            <option value="two">Client Two</option>
                            <option value="three">Client Three</option>
                          </select>
                        </div>
                      </div>
                      <div class="form-group">
                       <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">Names<span class="required">*</span>
                        </label>
                        <div class="col-md-9 col-sm-9 col-xs-12">
                          <input type="text" id="first-name" name="name" required="required" class="form-control col-md-10">
                        </div>
                      </div>
                      <div class="form-group">
                       <label class="control-label col-md-3 col-sm-3 col-xs-12" for="position">Position<span class="required">*</span>
                        </label>
                        <div class="col-md-9 col-sm-9 col-xs-12">
                          <input type="text" id="first-name" name="position" required="required" class="form-control col-md-10">
                        </div>
                      </div>
                      <div class="form-group">
                       <label class="control-label col-md-3 col-sm-3 col-xs-12" for="phone">Phone <span class="required">*</span>
                        </label>
                        <div class="col-md-9 col-sm-9 col-xs-12">
                          <input type="text" id="first-name" name="phone" required="required" class="form-control col-md-10">
                        </div>
                      </div>
                         <div class="form-group">
                       <label class="control-label col-md-3 col-sm-3 col-xs-12" for="phone">Email <span class="required">*</span>
                        </label>
                        <div class="col-md-9 col-sm-9 col-xs-12">
                          <input type="text" id="first-name" name="email" required="required" class="form-control col-md-10">
                        </div>
                      </div>                                                            
                      <div class="form-group">
                        <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                          <button class="btn btn-danger" type="button" data-dismiss="modal">Cancel</button>
                          <button class="btn btn-primary pull-right" type="submit">Reset</button>
                        </div>
                      </div>
                  </form>
              </div>
        </div>
        
      </div>
      
    </div>
  </div>
	
<script>
    
         document.getElementById('tenderid').addEventListener('change', function () {
    var style = this.value == 0 ? 'block' : 'none';    
    document.getElementById('clientName').style.display = style;        
});

   document.getElementById('provenence').addEventListener('change', function () {
    var style = this.value == 0 ? 'block' : 'none';    
    document.getElementById('hidden_div').style.display = style;        
});
 document.getElementById('provenence').addEventListener('change', function () {
    var style = this.value == 1 ? 'block' : 'none';    
    document.getElementById('client_staff').style.display = style;    
        
});

   document.getElementById('destination').addEventListener('change', function () {
    var style = this.value == 0 ? 'block' : 'none';    
    document.getElementById('staff_name1').style.display = style;        
});
   document.getElementById('destination').addEventListener('change', function () {
    var style = this.value == 1 ? 'block' : 'none';    
    document.getElementById('client_staff1').style.display = style;        
});

function save()
{
  
  var exp="";
  var dest="";
  
  var provenance = document.getElementById("provenence").value;  
  var destination = document.getElementById("destination").value;
  
  var expeditor = document.getElementById("expestaffnameid").value;
  var expeditor1 = document.getElementById("expeclientstaffid").value;
  
  var destinator = document.getElementById("destistaffnameid").value;
  var destinator1 = document.getElementById("desticlientstaffid").value;
  
  var tender = document.getElementById("tenderid").value;
  var dateD = document.getElementById("comdateid").value;
  var comway = document.getElementById("communicationwayid").value;
  var desc = document.getElementById("descriptionid").value;
  var btcom = document.getElementById("btcomm").value;
  
  if(provenance == 0)
  {
      exp = expeditor;
  }
  else if(provenance==1)
      {
          exp=expeditor1;
      }
  
  
  
  if(destination == 0)
  {
      dest=destinator;
  }
  else if(destination == 1)
      {
         dest=destinator1; 
      }
  
  
 var comDataString ='btcom1='+btcom+'&exp1='+ exp+ '&dest1=' + dest + '&tender1=' + tender +'&dateD1='+dateD +'&comway1='+comway +'&desc1='+desc;
 
if (tender == '[ Select ]' || exp == '[ Select ]'|| dest =='' || dateD =='' || comway ==''|| desc =='') {
    alert("All the fields have to be filled");
    //document.write(tenderDataString);
    //console.error(submitcomment);
}
else
{

$.ajax({
type: "post",
url: "class/communicationcontrolor.jsp",
data: comDataString,
async:false,
success: function(html) {
alert("well saved");
//response.sendRedirect("error.jsp");

}
});
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
url: "class/communicationcontrolor.jsp",
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

</script>
	