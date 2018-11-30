<!-- page content -->
 <%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
 <%@page contentType="text/html" pageEncoding="UTF-8"%>
 <%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="core.*" %>

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
        //Connection conn = d.getcon();
        d.connection();
        Connection conn = d.getcon();
    %>
    <div class="right_col" role="main">
      
        <a class="panel-heading" role="tab" id="headingOne" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
            <h4 class="panel-title"><span class="fa fa-plus-circle"/> New Tender</h4>
        </a> 
        <div id="collapseOne" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOne">
              <div class="panel-body">
                 <form id="demo-form2" name="myform" data-parsley-validate class="form-horizontal form-label-left">
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">Name <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="text" id="nameid" required="required" class="form-control col-md-7 col-xs-12">
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="tender_issue">Tender Issue <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <select class="form-control" name="tender_issue" id="test" >
                            <option selected disabled>[ Select ]</option>
                            <%
                                PreparedStatement pt = conn.prepareStatement("select id,name from tendermis_tender_issue");
                                        ResultSet rsult=pt.executeQuery();
                                            while(rsult.next()){
                            
                            %>
                            <option value="<%=rsult.getInt(1) %>"><%=rsult.getString(2) %></option>
                            <%
                              }
                            %>
                          </select>
                        </div>
                      </div>
                     <div class="form-group" id="hidden_div" style="display: none;" >
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">Web-Link <span class="required"></span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="text" id="web-link" name="web_link"  class="form-control col-md-7 col-xs-12">
                        </div>
                      </div>
                     <div class="form-group" id="tnumber" style="display: none;">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">Tender Number <span class="required"></span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input type="text" id="first-name" name="number"  class="form-control col-md-7 col-xs-12">
                        </div>
                      </div>
                     <div class="form-group" id="category" >
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="tender_category">Tender Category <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <select class="form-control" name="tender_category" id="tender_cat" >
                                <option selected disabled >[ Select ]</option>
                                <%
                                PreparedStatement prst = conn.prepareStatement("select id,name from tendermis_tender_category");
                                        ResultSet res=prst.executeQuery();
                                            while(res.next()){
                            
                            %>
                            <option value="<%=res.getInt(1) %>"><%=res.getString(2) %></option>
                            <%
                              }
                            %>
                            </select>  
                        </div>
                      </div>
                      <div class="form-group" id="companyname" style="display: none;">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">Company Name <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input type="text" id="company-name" name="company_name" required="required" class="form-control col-md-7 col-xs-12">
                        </div>
                      </div>
                    <!-- <div class="form-group" id="category" style="display: none;" >
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="company-name">Company Name <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <select class="form-control" name="tender_category">
                                <option selected disabled >[ Select ]</option>
                                <option >New Company</option>
                                <option>Company one</option>
                                <option>Company two</option>
                            </select>
                        </div>
                      </div> -->
                     <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="client_name">Client <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <select class="form-control" name="client" id="clientid">
                            <option selected disabled >[ Select ]</option> 
                            <option value="" data-toggle="modal" data-target="#newClient"> New Client</option>
                           <%
                               
                                PreparedStatement ps = conn.prepareStatement("select id, name from tendermis_client");
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
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="client_name">Contact staff <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <select class="form-control" name="contact_staff" id="contact_staffid">
                            <option selected disabled >[ Select ]</option>
                            <option data-toggle="modal" data-target="#newContactStaff" > New-Contact-Staff</option>
                            <%
                               
                                PreparedStatement pst = conn.prepareStatement("select id, names from tendermis_client_staff");
                                        ResultSet rest=pst.executeQuery();
                                            while(rest.next()){
                            
                            %>
                            <option value="<%=rest.getInt(1) %>"><%=rest.getString(2) %></option>
                            <%
                              }
                            %>
                          </select>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="advertising_date">Advertising Date <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="date" id="advdate" name="advertising_date" required="required" class="form-control col-md-7 col-xs-12">
                        </div>
                      </div>
                      
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="advertising_date">Dead Line <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="date" id="ddlineid" name="advertising_date" required="required" class="form-control col-md-7 col-xs-12">
                        </div>
                      </div>
                       <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="visit_date">Visit Date <span class="required"></span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="date" id="visitdate" name="visit_date"  class="form-control col-md-7 col-xs-12">
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="visit_date">Amount Of Doc <span class="required"></span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="number" id="amountdoc" name="amount_of_doc" class="form-control col-md-7 col-xs-12">
                        </div>
                      </div>
                           <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="doc">Required Documents <span class="required"></span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <select class="form-control" name="doc" id="documents" multiple="multiple">
                            <option selected disabled value="">[ Select ]</option>
                            <option value="" data-toggle="modal" data-target="#newDoc" > New-Documents</option>
                            <%
                               
                                PreparedStatement psto = conn.prepareStatement("select id, name from tendermis_document");
                                        ResultSet resto=psto.executeQuery();
                                            while(resto.next()){
                            
                            %>
                            <option value="<%=resto.getInt(1) %>"><%=resto.getString(2) %></option>
                            <%
                              }
                            %>
                          </select>
                        </div>
                          </div>
                     <div class="form-group"  >
                        <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                          <button class="btn btn-danger" type="button">Cancel</button>
						       
                           <input id="submitons" onclick="ok()" type="button" value="Submit" class="btn btn-success pull-right"/>

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
                    <th class="column-title">Number/Weblink</th>
                    <th class="column-title">Deadline</th>
                    <th class="column-title">Client</th>
                    <th class="column-title">Advertising Date </th>
                    <th class="column-title">Amount</th>
        
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
                      String way="";
                      String client ="";
                      String issue="";
    
                      PreparedStatement p = conn.prepareStatement("select * from tendermis_tender");
                      ResultSet r=p.executeQuery();
                      while(r.next()){
                      int tender_issueid = r.getInt(11);
                   
                      String query = "select name from tendermis_tender_issue where id='"+tender_issueid+"'";
                      PreparedStatement prep = conn.prepareStatement(query);
                      ResultSet rrr= prep.executeQuery();
                
                while(rrr.next()){
                    name = rrr.getString(1);
                }
            
            int id_client = r.getInt(9);    
            PreparedStatement preparement = conn.prepareStatement("select name from tendermis_client where id='"+id_client+"'");
            ResultSet rettt = preparement.executeQuery();
            
            while(rettt.next())
            {
                client = rettt.getString(1);
            }      
                  %> 
                  <tr class="even pointer"><td><%=r.getString(12) %></td><td><%=r.getString(2)%></td><td><%=r.getString(4) %></td><td><%=client%></td><td><%=r.getString(3) %></td><td><%=r.getDouble(13) %></td><td class=" last"><input id="submitonsdelete" onclick="del(<%=r.getInt(1)%>)" type="button" value="Delete" class="btn btn-success pull-right" /><input data-toggle="modal" data-target="#updateSTender_<%=r.getInt(1)%>" id="submitonsprepare" type="button" value="Update" class="btn btn-success pull-right" /></td></tr> 
                
  <div class="modal fade" id="updateSTender_<%=r.getInt(1)%>" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Update Tender</h4>
        </div>
        <div class="modal-body">
           <div class="panel-body">
                <form id="demo-form2" name="myform" data-parsley-validate class="form-horizontal form-label-left">
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">Name <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input type="text" id="nameid" required="required" value="<%=r.getString(12) %>" class="form-control col-md-7 col-xs-12">
                        </div>
                      </div><br/><br/>
                      
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="tender_issue">Tender Issue <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <select class="form-control" name="tender_issue" id="test3" >
                              <%
                                  String nameD = "";
                                  
                                  PreparedStatement tttt = conn.prepareStatement("select name from tendermis_tender_issue where id = '"+r.getInt(10)+"'");
                                  ResultSet rrrr = tttt.executeQuery();
                                  while(rrrr.next()){
                                      nameD = rrrr.getString(1);
                                      }
                                  
                              %>
                              <option  value="<%=r.getInt(10)%>"><%=nameD%></option>
                            <%
                                
                                PreparedStatement preso = conn.prepareStatement("select id,name from tendermis_tender_issue");
                                        ResultSet ytui=preso.executeQuery();
                                            while(ytui.next()){
                            
                            %>
                            <option value="<%=ytui.getInt(1) %>"><%=ytui.getString(2) %></option>
                            <%
                              }
                            %>
                          </select>
                        </div>
                      </div>
                     <div class="form-group" id="hidden_div3" style="display: none;" >
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">Web-Link <span class="required"></span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="text" id="web-link1" name="web_link"  class="form-control col-md-7 col-xs-12">
                        </div>
                      </div>
                     <div class="form-group" id="tnumber3" style="display: none;">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">Tender Number <span class="required"></span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input type="text" id="first-name" name="number"  class="form-control col-md-7 col-xs-12">
                        </div>
                      </div><br/><br/>
                     <div class="form-group" id="category" >
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="tender_category">Tender Category <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <select class="form-control" name="tender_category" id="tender_cat" >
                                <%
                                PreparedStatement afumba = conn.prepareStatement("select id,name from tendermis_tender_category where id='"+r.getInt(11)+"'");
                                        ResultSet prepa=afumba.executeQuery();
                                            while(prepa.next()){
                            
                            %>
                            <option value="<%=prepa.getInt(1) %>"><%=prepa.getString(2) %></option>
                                <%
                                    }
                                PreparedStatement faupa = conn.prepareStatement("select id,name from tendermis_tender_category");
                                        ResultSet pas=faupa.executeQuery();
                                            while(pas.next()){
                            
                            %>
                            <option value="<%=pas.getInt(1) %>"><%=pas.getString(2) %></option>
                            <%
                              }
                            %>
                            </select>  
                        </div>
                      </div><br/><br/>
                      <div class="form-group" id="companyname" style="display: none;">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">Company Name <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input type="text" id="company-name" name="company_name" required="required" class="form-control col-md-7 col-xs-12">
                        </div>
                      </div>
                    <!-- <div class="form-group" id="category" style="display: none;" >
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="company-name">Company Name <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <select class="form-control" name="tender_category">
                                <option selected disabled >[ Select ]</option>
                                <option >New Company</option>
                                <option>Company one</option>
                                <option>Company two</option>
                            </select>
                        </div>
                      </div> -->
                     <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="client_name">Client <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <select class="form-control" name="client" id="clientid">
                            <option value="<%=client%>" ><%=client%></option> 
                            <option value="" data-toggle="modal" data-target="#newClient"> New Client</option>
                           <%
                               
                                PreparedStatement decise = conn.prepareStatement("select id, name from tendermis_client");
                                        ResultSet julienne=decise.executeQuery();
                                            while(julienne.next()){
                            
                            %>
                            <option value="<%=julienne.getInt(1) %>"><%=julienne.getString(2) %></option>
                            <%
                              }
                            %>
                          </select>
                        </div>
                      </div><br/><br/>
                     <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="client_name">Contact staff <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <select class="form-control" name="contact_staff" id="contact_staffid">
                            <%
                               
                                PreparedStatement july = conn.prepareStatement("select id, names from tendermis_client_staff where id ='"+r.getInt(14)+"'");
                                        ResultSet josua=july.executeQuery();
                                            while(josua.next()){
                            
                            %>
                            <option value="<%=josua.getInt(1) %>"><%=josua.getString(2) %></option>
                            <%
                               }
                                PreparedStatement julien = conn.prepareStatement("select id, names from tendermis_client_staff");
                                        ResultSet josue=julien.executeQuery();
                                            while(josue.next()){
                            
                            %>
                            <option value="<%=josue.getInt(1) %>"><%=josue.getString(2) %></option>
                            <%
                              }
                            %>
                          </select>
                        </div>
                      </div><br/><br/>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="advertising_date">Advertising Date <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input type="date" id="advdate" name="advertising_date" value="<%=r.getString(4) %>" required="required" class="form-control col-md-7 col-xs-12">
                        </div>
                      </div><br/><br/>
                       
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="advertising_date">Dead Line <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input type="date" id="ddlineid" name="advertising_date" value="<%=r.getString(4) %>" required="required" class="form-control col-md-7 col-xs-12">
                        </div>
                      </div><br/><br/>
                       <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="visit_date">Visit Date <span class="required"></span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input type="date" id="visitdate" name="visit_date" value="<%=r.getString(16) %>"  class="form-control col-md-7 col-xs-12">
                        </div>
                      </div><br/><br/>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="visit_date">Amount Of Doc <span class="required"></span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input type="number" id="amountdoc" name="amount_of_doc" value="<%=r.getInt(14) %>" class="form-control col-md-7 col-xs-12">
                        </div>
                      </div><br/><br/>
                           <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="doc">Required Documents <span class="required"></span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <select class="form-control" name="doc" id="documents" multiple="multiple">
                            <option selected disabled value="">[ Select ]</option>
                            <option value="" data-toggle="modal" data-target="#newDoc" > New-Documents</option>
                            <%
                               
                                String idDocs = r.getString(17);
            String idDoc [] = idDocs.split(",");
            
            for(int i=0;i<idDoc.length;i++)
            {
                if(idDoc[i]!="")
                {
                    PreparedStatement nameDocs = conn.prepareStatement("select name from tendermis_document where id='"+idDoc[i]+"'");
                    ResultSet docDocs = nameDocs.executeQuery();
                    
                    while(docDocs.next())
                    {
                     %>
                            <option value="<%=docDocs.getString(1) %>"><%=docDocs.getString(1) %></option>
                            <%   
                    }
                
                
                }
            }
            
            
                            
                            
               
                            %>
                          </select>
                        </div>
                          </div><br/><br/><br/><br/>
                     <div class="form-group"  >
                        <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                          <button class="btn btn-danger" type="button">Cancel</button>
						       
                           <input id="submitons" onclick="ok()" type="button" value="Submit" class="btn btn-success pull-right"/>

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

    <div class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-hidden="true">
       <div class="modal-dialog modal-lg">
         <div class="modal-content">

           <div class="modal-header">
             <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span>
             </button>
             <h4 class="modal-title" id="myModalLabel">Modal title</h4>
           </div>
           <div class="modal-body">
           <form id="demo-form2" name="myform" data-parsley-validate class="form-horizontal form-label-left">
                <div class="form-group">
                 <label class="control-label col-md-3 col-sm-3 col-xs-12" for="tender_issue">Name <span class="required">*</span>
                 </label>
                 <div class="col-md-6 col-sm-6 col-xs-12">
                   <input type="text" id="last-name" name="tender_issue" required="required" class="form-control col-md-7 col-xs-12">
                 </div>
               </div>
           </form>
           </div>
           <div class="modal-footer">
             <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
             <button type="button" class="btn btn-primary">Save changes</button>
           </div>

         </div>
       </div>
     </div>


  <!-- Modal -->
  <div class="modal fade" id="newClient" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">New Client <small>Quick registration</small></h4>
        </div>
        <div class="modal-body">
           <form id="demo-form2" name="myform" data-parsley-validate class="form-horizontal form-label-left">
                <div class="form-group">
                   <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">Name <span class="required">*</span>
                   </label>
                   <div class="col-md-9 col-sm-9 col-xs-12">
                     <input type="text" id="first-name" name="name" required="required" class="form-control col-md-10">
                   </div>
                 </div>
                <div class="form-group">
                  <label class="control-label col-md-3 col-sm-3 col-xs-12" for="tin_number">TIN Number <span class="required">*</span>
                  </label>
                  <div class="col-md-9 col-sm-9 col-xs-12">
                    <input type="text" id="first-name" name="tin_number" required="required" class="form-control col-md-10">
                  </div>
                </div>
                <div class="form-group">
                   <label class="control-label col-md-3 col-sm-3 col-xs-12" for="tender_category">Category <span class="required">*</span>
                   </label>
                   <div class="col-md-9 col-sm-9 col-xs-12">
                     <select class="form-control" name="tender_issue" >
                       <option disabled selected>[ Select ]</option>
                       <option value="ngo">NGO</option>
                       <option value="private">Private</option>
                       <option value="individual">Individual</option>
                     </select>
                   </div>
                 </div>
           </form>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-danger pull-left" data-dismiss="modal">Close</button>
          <button type="submit" class="btn btn-success pull-right" >Save</button>
        </div>
      </div>
      
    </div>
  </div>
  
  
  
  
 <div class="modal fade" id="newDoc" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">New Document</h4>
        </div>
        <div class="modal-body">
           <div class="panel-body">
                 <form id="demo-form2" name="myform" data-parsley-validate class="form-horizontal form-label-left">
                
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="document_name">Name <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="text" id="namedoc" name="document_name" required="required" class="form-control col-md-7 col-xs-12">
                        </div>
                      </div>  
                     <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="validity">Validity <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <select class="form-control" name="document_validity" id="validity2" >
                            <option >[ Select ]</option>
                            <%
                               
                                PreparedStatement pos = conn.prepareStatement("select * from tendermis_document_validity");
                                        ResultSet ros=pos.executeQuery();
                                            while(ros.next()){
                            
                            %>
                            <option value="<%=ros.getInt(1) %>"><%=ros.getString(2) %></option>
                            <%
                              }
                            %>        
                          </select>
                        </div>
                      </div>
                          
                         
                          
                       <div class="form-group" id="hidden_div2" style="display: none;">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="validity_period">Issue - End Date <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">                            
                            <div class="input-prepend input-group">
                              <span class="add-on input-group-addon"><i class="glyphicon glyphicon-calendar fa fa-calendar"></i></span>
                              <input type="text"  name="validity_period" id="period_validity" class="form-control col-md-7 col-xs-12" value="01/01/2018 - 01/25/2018" />
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
                          <input id="submitonsdoc" onclick="submitDoc()" type="submit" value="Submit" class="btn btn-success pull-righ"/>

                        </div>
                      </div>

                    </form>
                    </div>
                </div>
        
      </div>
      
    </div>
  </div>
  

   <!-- Modal -->
  
    
      <!-- Modal content-->
      <div class="modal fade" id="newContactStaff" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">New Contact Staff</h4>
        </div>
        <div class="modal-body">
           <div class="panel-body">
          <form id="demo-form2" name="myform" data-parsley-validate class="form-horizontal form-label-left">                                       
                   <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="tender_category">Client<span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <select id="idclient" class="form-control" name="tender_issue" >
                            <option disabled selected>[ Select ]</option>
                            <%
                               
                                PreparedStatement popo = conn.prepareStatement("select * from tendermis_client");
                                        ResultSet roro=popo.executeQuery();
                                            while(roro.next()){
                            
                            %>
                            <option value="<%=roro.getInt(1) %>"><%=roro.getString(2) %></option>
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
 </div>
</div>

<script>
    document.getElementById('validity2').addEventListener('change', function () {
    var style = this.value == 1 ? 'block' : 'none';    
    document.getElementById('hidden_div2').style.display = style;        
});
    
   document.getElementById('test').addEventListener('change', function () {
    var style = this.value == 1 ? 'block' : 'none';    
    document.getElementById('hidden_div').style.display = style;        
});
 document.getElementById('test').addEventListener('change', function () {
    var style = this.value == 2 ? 'block' : 'none';    
    document.getElementById('tnumber').style.display = style;    
        
});

document.getElementById('tender_cat').addEventListener('change', function () {
    var style = this.value == 2 ? 'block' : 'none';    
    document.getElementById('companyname').style.display = style;        
});



document.getElementById('test1').addEventListener('change', function () {
    var style = this.value == 1 ? 'block' : 'none';    
    document.getElementById('hidden_div3').style.display = style;        
});

document.getElementById('test3').addEventListener('change', function () {
    var style = this.value == 1 ? 'block' : 'none';    
    document.getElementById('hidden_div3').style.display = style;        
});

document.getElementById('test3').addEventListener('change', function () {
    var style = this.value == 1 ? 'block' : 'none';    
    document.getElementById('tnumber3').style.display = style;        
});



//$('select[name=client]').change(function() {
//    if ($(this).val() == '')
//    {
//        var newThing = prompt('Enter a name for the new thing:');
//        var newValue = $('option', this).length;
//        $('<option>')
//            .text(newThing)
//            .attr('value', newValue)
//            .insertBefore($('option[value=]', this));
//        $(this).val(newValue);
//    }
//});

function ok()
{
    var boutonok = document.getElementById("submitons").value;
    var name = document.getElementById("nameid").value;
    var tenderissue = document.getElementById("test").value;
    var echange ="";
    
    var weblink = document.getElementById("web-link").value;
    var tendernumber = document.getElementById("first-name").value;
    
    var tendercat = document.getElementById("tender_cat").value;
    var companyname = document.getElementById("company-name").value;
    var client = document.getElementById("clientid").value;
    var contact_staff = document.getElementById("contact_staffid").value;
    var advertisingdate = document.getElementById("advdate").value;
    var visitDate = document.getElementById("visitdate").value;
    var amountofdoc = document.getElementById("amountdoc").value;
    var ddline = document.getElementById("ddlineid").value;
    
    
    if(tenderissue == 1)
    {
        echange =weblink ;
    }
    else if(tenderissue == 2)
        {
            echange=tendernumber;
        }
   
    if(tendercat==1)
    {
        companyname ="";
    }
    
    var multis = document.getElementById("documents");
    var result="";
    var separator = ",";
    for(i=0; i<multis.length; i++)
    {
        var currentOption= multis[i];
        
        if(currentOption.selected == true || currentOption.value != '')
        {
            result+=currentOption.value ;
            result+= separator;
            
        }   
    }
    
    
    var tenderDataString ='boutonok1='+ boutonok+ '&name1=' + name + '&tenderissue1=' + tenderissue + '&echange1=' + echange  + '&tendercat1=' + tendercat + '&companyname1=' + companyname + '&client1=' + client + '&contact_staff1=' + contact_staff+ '&advertisingdate1=' + advertisingdate + '&visitDate1='+visitDate  + '&amountofdoc1=' + amountofdoc  +  '&deadline1=' + ddline   +'&result1='+result ;

if (name == '' || tenderissue == '[ Select ]'|| tendercat=='[ Select ]'|| client =='[ Select ]'||contact_staff == '[ Select ]' ||ddline ==''|| echange=='' ) {
    alert("All the fields have to be filled");
} 
else
{   
$.ajax({
type: "post",
url: "class/tendercontrolor.jsp",
data: tenderDataString,
async:false,
success: function(e) {
alert("well saved");
document.forms[0].action="index.jsp?request=registration";
document.forms[0].method = "post";
document.forms[0].submit();
e.stopPropagation();

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
url: "class/tendercontrolor.jsp",
data: deleteCompoData,
async:false,
success: function(html) {
alert("well deleted");

document.forms[0].action="index.jsp?request=registration";
document.forms[0].method = "post";
document.forms[0].submit();

}
});
}
}
return false;
}

function submitDoc()
{
    var btsubdoc =document.getElementById("submitonsdoc").value;
var namedocument = document.getElementById("namedoc").value;
var validitydoc = document.getElementById("validity2").value;
var period = document.getElementById("period_validity").value;

var status = document.getElementsByTagName('input');
var statusLength = status.length;

for (var i = 0 ; i < statusLength ; i++) 
{
    if (status[i].type == 'radio' && status[i].checked) 
    {
        var statusfinal = status[i].value;
    }
    
}

//filling the variable acording to the choice done

if(validitydoc=="0")
    {
        period ="";
    }
// Returns successful data submission message when the entered information is stored in database.
var docDataString = 'submitDoc=' + btsubdoc + '&document_name=' + namedocument + '&document_validity=' + validitydoc + '&validity_period=' + period+"&statusfinal1="+statusfinal;



if (namedocument == '' || period == ''|| validitydoc=='[ Select ]') {
    alert("All the fields have to be filled");
// document.write(clientstaffDataString);
    //console.error(submitcomment);

}
else
{

$.ajax({
type: "post",
url: "class/documentcontrolor.jsp",
data: docDataString,
async:false,
success: function(html) {
alert("well saved");

document.forms[0].action="index.jsp?request=registration";
document.forms[0].method = "post";
document.forms[0].submit();

}
});
//console.error();
}
return false;
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
<%
conn.close();
%>
</body>
</html>
	

	