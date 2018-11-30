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
            <h4 class="panel-title"><span class="fa fa-plus-circle"/> New Contract</h4>
        </a>
        <div id="collapseOne" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOne">
              <div class="panel-body">
                 <form id="demo-form2" name="new_contract" class="form-horizontal form-label-left" data-parsley-validate>

                    <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="tender">Tender <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <select class="form-control" name="client_name" id="tenderSelect">
                                <option disabled selected>[ Select ]</option>
                                <%
                               String val= "yes";
                                PreparedStatement ps = conn.prepareStatement("select id, name from tendermis_tender where awardstatus ='"+val+"'");
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
                     <div class="form-group" id="manager">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="tender">Manager <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input type="text" id="managernameid" name="manager_name" class="form-control col-md-7 col-xs-12"/>
                        </div>
                      </div>
                     <div class="form-group" id="position">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="manager_name">Manager Position <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input type="text" id="managerpositionid" name="manager_position" required="required" value="Procurement" class="form-control col-md-7 col-xs-12">
                        </div>
                      </div>
                     <div class="form-group" id="position1" style="display: none;">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="manager_contact">Manager Contact <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="text" id="managerphoneid" name="manager_contact" required="required" value="(250) 780 440 474" class="form-control col-md-7 col-xs-12">
                        </div>
                      </div>
                     <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="contract_amount">Contract Amount <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="text" id="contractamountid" name="contract_amount" required="required" class="form-control col-md-7 col-xs-12">
                        </div>
                      </div>
                     <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="signing_date">Signing Date <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <div class="input-prepend input-group">
                            <span class="add-on input-group-addon"><i class="glyphicon glyphicon-calendar fa fa-calendar"></i></span>
                            <input type="date" id="contractsigningdateid" name="signing_date" required="required" class="form-control col-md-7 col-xs-12">
                        </div>
                        </div>
                      </div>
                     <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="price_without_tax">Start-End Date <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">                            
                            <div class="input-prepend input-group">
                              <span class="add-on input-group-addon"><i class="glyphicon glyphicon-calendar fa fa-calendar"></i></span>
                              <input type="text"  name="reservation" id="startenddateid" class="form-control col-md-7 col-xs-12" value="01/01/2016 - 01/25/2016" />
                            </div>
                         </div>
                      </div>
            
                     <div class="form-group"  >
                        <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                          <button class="btn btn-danger" type="button">Cancel</button>						       
                          <input id="submitonscont" onclick="save()" type="button" value="Submit" class="btn btn-success pull-right"/>
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
                    <th class="column-title">Amount</th>
                    <th class="column-title">Signing Date</th>
                    <th class="column-title">Start & End Date </th>
                    <th class="column-title">Manager</th>
                    <th class="column-title">Manager Position</th>
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
    
                      PreparedStatement p = conn.prepareStatement("select * from tendermis_contract");
                      ResultSet r=p.executeQuery();
                      while(r.next()){
                      int id = r.getInt(8);
                   
                      String query = "select name from tendermis_tender where id='"+id+"'";
                      PreparedStatement prep = conn.prepareStatement(query);
                      ResultSet rrr= prep.executeQuery();
                
                while(rrr.next()){
                    name = rrr.getString(1);
                }
                 
                  %> 
                  <tr class="even pointer"><td><%=name %></td><td><%=r.getString(3) %></td><td><%=r.getString(2) %></td><td><%=r.getString(4) %></td><td><%=r.getString(5) %></td><td><%=r.getString(6) %></td><td class=" last"><input id="submitonsdelete" onclick="del(<%=r.getInt(1)%>)" type="button" value="Delete" class="btn btn-success pull-right" /><input data-toggle="modal" data-target="#updateContract_<%=r.getInt(1)%>" id="submitonsprepare" type="button" value="Update" class="btn btn-success pull-right" /></td></tr> 
                      
<div class="modal fade" id="updateContract_<%=r.getInt(1)%>" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Update Contract</h4>
        </div>
        <div class="modal-body">
           <div class="panel-body">
               
                  <form id="demo-form2" name="new_contract" class="form-horizontal form-label-left" data-parsley-validate>

                    <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="tender">Tender <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <select class="form-control" name="client_name" id="uptenderSelect">
                                <option value="<%=id %>"><%=name %></option>
                                <%
                               
                                PreparedStatement popo = conn.prepareStatement("select id, name from tendermis_tender");
                                        ResultSet momo=popo.executeQuery();
                                            while(momo.next()){
                            
                            %>
                            <option value="<%=momo.getInt(1) %>"><%=momo.getString(2) %></option>
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
                     <div class="form-group" id="manager">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="tender">Manager <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input type="text" id="upmanagernameid" name="manager_name" value="<%=r.getString(5)%>" class="form-control col-md-7 col-xs-12"/>
                        </div>
                      </div><br/><br/>
                     <div class="form-group" id="position">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="manager_name">Manager Position <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input type="text" id="upmanagerpositionid" name="manager_position" value="<%=r.getString(6)%>" required="required" value="Procurement" class="form-control col-md-7 col-xs-12">
                        </div>
                      </div>
                     <div class="form-group" id="position1" style="display: none;">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="manager_contact">Manager Contact <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="text" id="upmanagerphoneid" name="manager_contact" required="required" value="(250) 780 440 474" class="form-control col-md-7 col-xs-12">
                        </div>
                      </div><br/><br/>
                     <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="contract_amount">Contract Amount <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="text" id="upcontractamountid" name="contract_amount" value="<%=r.getString(3)%>" required="required" class="form-control col-md-7 col-xs-12">
                        </div>
                      </div><br/><br/>
                     <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="signing_date">Signing Date <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <div class="input-prepend input-group">
                            <span class="add-on input-group-addon"><i class="glyphicon glyphicon-calendar fa fa-calendar"></i></span>
                            <input type="date" id="upcontractsigningdateid" name="signing_date" value="<%=r.getString(2)%>" required="required" class="form-control col-md-7 col-xs-12">
                        </div>
                        </div>
                      </div><br/><br/>
                     <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="price_without_tax">Start-End Date <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">                            
                            <div class="input-prepend input-group">
                              <span class="add-on input-group-addon"><i class="glyphicon glyphicon-calendar fa fa-calendar"></i></span>
                              <input type="text"  name="reservation" value="<%=r.getString(4)%>" id="upsstartenddateid" class="form-control col-md-7 col-xs-12" />
                            </div>
                         </div>
                      </div><br/><br/><br/>
            
                     <div class="form-group"  >
                        <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                          <button class="btn btn-danger" type="button">Cancel</button>						       
                          <input id="upsubmitonscont" onclick="updateContract(<%=r.getInt(1)%>)" type="button" value="Submit" class="btn btn-success pull-right"/>
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
<script>
//    document.getElementById('tenderSelect').addEventListener('change', function () {
//    var style = this.value == 0 ? 'block' : 'none';    
//    document.getElementById('clientName').style.display = style;        
//});
//
//document.getElementById('managerName').addEventListener('change', function () {
//    var style = this.value == 0 ? 'block' : 'none';    
//    document.getElementById('position').style.display = style;        
//});
//
//document.getElementById('managerName').addEventListener('change', function () {
//    var style = this.value == 0 ? 'block' : 'none';    
//    document.getElementById('position1').style.display = style;        
//});

function save()
{
 
var submitonscontract = document.getElementById("submitonscont").value;
var tendername = document.getElementById("tenderSelect").value;
var managername = document.getElementById("managernameid").value;
var managerposition = document.getElementById("managerpositionid").value;
var managerphone = document.getElementById("managerphoneid").value;
var contractamount=document.getElementById("contractamountid").value;
var contractsigningdate = document.getElementById("contractsigningdateid").value;
var startenddate=document.getElementById("startenddateid").value;



// Returns successful data submission message when the entered information is stored in database.
var contractDataString ='submitonscontract1='+ submitonscontract+ '&tendername1=' + tendername + '&managername1=' + managername + '&managerposition1=' + managerposition + '&managerphone1=' + managerphone + '&contractamount1=' + contractamount + '&contractsigningdate1=' + contractsigningdate + '&startenddate1=' + startenddate;



if (tendername == '[ Select ]' || managername == ''|| managerposition==''|| managerphone ==''||contractamount == '' ||contractsigningdate  =='' ||startenddate =='') {
    alert("All the fields have to be filled");
    //document.write(tenderDataString);
    //console.error(submitcomment);
    
}
else
{
//// AJAX code to submit form.
$.ajax({
type: "post",
url: "class/contractcontrolor.jsp",
data: contractDataString,
async:false,
success: function(html) {
alert("well saved");
document.forms[0].action = "index.jsp?request=contract";
document.forms[0].method = "post";
document.forms[0].submit();
}
});
////console.error();

}
return false;
}
//
//
// function del(id){
//     var bt = document.getElementById("submitonsdelete");
//       if(confirm("Do you really want to delete this component?")){
//          
//         var deleteCompoData = 'id1='+id + '&btn1='+bt;
//        
//         if(id=='')
//          {
//              alert("the component doesn't exist");
//         }
//       else
//      {
//$.ajax({
//type: "post",
//url: "class/contractcontrolor.jsp",
//data: deleteCompoData,
//async:false,
//success: function(html) {
//alert("well deleted");
////response.sendRedirect("error.jsp");
//
//}
//});
//}
//}
//return false;
//}
//
//function updateContract(id)
//{
//var upsubmitonscontract = document.getElementById("upsubmitonscont");
//var uptendername = document.getElementById("uptenderSelect").value;
//var upmanagername = document.getElementById("upmanagernameid").value;
//var upmanagerposition = document.getElementById("upmanagerpositionid").value;
//var upmanagerphone = document.getElementById("upmanagerphoneid").value;
//var upcontractamount=document.getElementById("upcontractamountid").value;
//var upcontractsigningdate = document.getElementById("upcontractsigningdateid").value;
//var upstartenddate=document.getElementById("upsstartenddateid").value;
//
//
//var updateContractDataString ='upsubmitonscontract1='+ upsubmitonscontract+ '&uptendername1=' + uptendername + '&upmanagername1=' + upmanagername + '&upmanagerposition1=' + upmanagerposition + '&upmanagerphone1=' + upmanagerphone + '&upcontractamount1=' + upcontractamount + '&upcontractsigningdate1=' + upcontractsigningdate + '&upstartenddate1=' + upstartenddate+'&monId1='+id;
// 
//$.ajax({
//type: "post",
//url: "class/contractcontrolor.jsp",
//data: updateContractDataString,
//async:false,
//success: function(html) {
//alert("well saved");
//}
//});    
//}
</script>
	