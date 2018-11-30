 <%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="core.*" %>
 <%
        db d = new db();
        //Connection conn = d.getcon();
        d.connection();
        Connection conn = d.getcon();
    %>
    <div class="right_col" role="main">
      
        <a class="panel-heading" role="tab" id="headingOne" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
            <h4 class="panel-title"><span class="fa fa-plus-circle"/> New Document</h4>
        </a>
        <div id="collapseOne" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOne">
              <div class="panel-body">
                  <form method="post" action="./class/documentcontrolor.jsp" enctype="multipart/form-data" id="form-id" data-parsley-validate class="form-horizontal form-label-left">
                
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="document_name">Name <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="text" id="namedocid" name="document_name" required="required" class="form-control col-md-7 col-xs-12">
                        </div>
                      </div>  
                     <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="validity">Validity <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <select class="form-control" name="document_validity" id="validityid" >
                            <option >[ Select ]</option>
                            <%
                               
                                PreparedStatement ps = conn.prepareStatement("select * from tendermis_document_validity");
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
                          <label class="control-label col-md-3 col-sm-3 col-xs-12" for="">Upload<span class="required">*</span>
                        </label>
                          <div class="col-md-6 col-sm-6 col-xs-12">
                              <input id="file-id" type="file" name="our-file" />
                    
                      </div>
                    </div>
                      
                       
                       <div class="form-group" id="hidden_div" style="display: none;">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="validity_period">Issue - End Date <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">                            
                            <div class="input-prepend input-group">
                              <span class="add-on input-group-addon"><i class="glyphicon glyphicon-calendar fa fa-calendar"></i></span>
                              <input type="text"  name="validity_period" id="validity_periodid" class="form-control col-md-7 col-xs-12" value="01/01/2018 - 01/25/2018" />
                            </div>
                         </div>
                      </div>
                      
                     <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="tender_name">Notification <span class="required">*</span>
                        </label>
                        <div class="col-md-3 col-sm-3 col-xs-12">
                            <label><input type="radio" name="award_status" required="required" value="required">Required</label>
                        </div>  
                         <div class="col-md-3 col-sm-3 col-xs-12">
                             <label><input type="radio" name="award_status" required="required" value="notrequired">Not Required</label>
                        </div>  
                      </div>
                                                                           
                     <div class="form-group"  >
                        <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                          <button class="btn btn-danger" type="button">Cancel</button>
						       
                          <button type="submit" name="submitDoc" class="btn btn-success pull-right" value="ok">Submit</button>
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
                    <th class="column-title">Validity</th>
                    <th class="column-title">Authentification </th>
                    <th class="column-title no-link last"><span class="nobr">Action</span>
                    </th>
                    <th class="bulk-actions" colspan="7">
                      <a class="antoo" style="color:#fff; font-weight:500;">Bulk Actions ( <span class="action-cnt"> </span> ) <i class="fa fa-chevron-down"></i></a>
                    </th>
                  </tr>
                </thead>

                <tbody>
                 <%
                             String valname="";  
                             PreparedStatement p = conn.prepareStatement("select * from tendermis_document");
                             ResultSet r=p.executeQuery();
                                            while(r.next()){
                                                
                             PreparedStatement py = conn.prepareStatement("select name from tendermis_document_validity where id = '"+r.getString(5)+"'");
                             ResultSet sss = py.executeQuery();
                             
                             while(sss.next())
                             {
                                 valname = sss.getString(1);
                             
                             }
                            
                            %>
                             <tr class="even pointer"><td><%=r.getString(2) %></td><td><%=valname %></td><td><%=r.getString(4) %></td><td class=" last"><input id="submitonsdelete" onclick="del(<%=r.getInt(1)%>)" type="button" value="Delete" class="btn btn-success pull-right" /><input data-toggle="modal" data-target="#updateDoc_<%=r.getInt(1)%>" id="submitonsprepare" type="button" value="Update" class="btn btn-success pull-right" /></td></tr> 
                 
                             
              <!-- Modal -->
  <div class="modal fade" id="updateDoc_<%=r.getInt(1)%>" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Update Document</h4>
        </div>
        <div class="modal-body">
           <div class="panel-body">
                <form method="post" enctype="multipart/form-data" id="form-id" data-parsley-validate class="form-horizontal form-label-left">
                
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="document_name">Name <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input type="text" id="namedocid" name="document_name" value="<%=r.getString(2) %>" required="required" class="form-control col-md-7 col-xs-12">
                        </div>
                      </div><br/><br/>
                     <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="validity">Validity <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <select class="form-control" name="document_validity" id="validityid" >
                            <option value="<%=valname %>" ><%=valname %></option>
                            <%
                               
                                PreparedStatement poos = conn.prepareStatement("select * from tendermis_document_validity");
                                        ResultSet roos=poos.executeQuery();
                                            while(roos.next()){
                            
                            %>
                            <option value="<%=roos.getInt(1) %>"><%=roos.getString(2) %></option>
                            <%
                              }
                            %>        
                          </select>  
                        </div>
                      </div>
                      <br/><br/>
                      <div class="form-group">
                          <label class="control-label col-md-3 col-sm-3 col-xs-12" for="">Upload<span class="required">*</span>
                        </label>
                          <div class="col-md-6 col-sm-6 col-xs-12">
                              <input id="file-id" type="file" name="our-file" />
                              <input type="button" value="Upload" id="upload-button-id" onclick=""  class="btn btn-success pull-right" />
                           
                         
                      </div>
                          </div>
                      
                       
                       <div class="form-group" id="hidden_div" style="display: none;">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="validity_period">Issue - End Date <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">                            
                            <div class="input-prepend input-group">
                              <span class="add-on input-group-addon"><i class="glyphicon glyphicon-calendar fa fa-calendar"></i></span>
                              <input type="text"  name="validity_period" id="validity_periodid" class="form-control col-md-7 col-xs-12" value="01/01/2018 - 01/25/2018" />
                            </div>
                         </div>
                      </div>
                      <br/><br/><br/>
                     <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="tender_name">Notification <span class="required">*</span>
                        </label>
                        <div class="col-md-3 col-sm-3 col-xs-12">
                            <label><input type="radio" name="award_status" required="required" value="required">Required</label>
                        </div>  
                         <div class="col-md-3 col-sm-3 col-xs-12">
                             <label><input type="radio" name="award_status" required="required" value="notrequired">Not Required</label>
                        </div>  
                      </div>
                       <br/><br/><br/>                                                    
                     <div class="form-group"  >
                        <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                          <button class="btn btn-danger" type="button">Cancel</button>
						       
                          <button type="button" id="submitDoc" onclick="updateDoc()" class="btn btn-success pull-right">Submit</button>
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
//    document.getElementById('validityid').addEventListener('change', function () {
//    var style = this.value == 2 ? 'block' : 'none';    
//    document.getElementById('hidden_div').style.display = style;        
//});
//
//
//function del(id)
//{
//    if(confirm("Do you really want to delete this component?")){
//    var btndelete = document.getElementById("submitonsdelete").value;
//    var deleteDataString = 'id1='+id+'&btdelete1='+btndelete;
//    
//    if(id=='')
//    {
//        alert("the component dosen't exist");
//    }
//    else
//    {
//       $.ajax({
//        type: "post",
//        url: "class/documentcontrolor.jsp",
//        data: deleteDataString,
//        async:false,
//        success: function(html) {
//        alert("well saved");
//        document.forms[0].action="index.jsp?request=document";
//        document.forms[0].method = "post";
//        document.forms[0].submit();
//        }
//        }); 
//    }
//    }
//}
</script>
	