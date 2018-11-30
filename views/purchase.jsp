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
            <h4 class="panel-title"><span class="fa fa-plus-circle"/> New Purchase</h4>
        </a>
        <div id="collapseOne" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOne">
              <div class="panel-body">
                  
                    <table class="table1">
                      <thead>
                        <tr>
                          <th>Tender</th>
                          <th>Delivery</th> 
                          <th>Number</th>
                          <th>Receiving</th>
                          <th>Purchase</th>
                          <th>Item</th>
                          <th>Serial</th>
                          <th>Quantity</th>
                          <th>Description</th>
                        </tr>
                      </thead>
                      <tbody id="corps">
                       <%
                       String stt ="0";
                       int count=0;
                       int tender_id=0;// variable to get the tender id     
                       String tender_name="";// the variable to get the tender name
                       int purchase_id=0; // the variable to get the pruchase_id 
                       String purchase_number="";// the variable to get the purchase number 
                       PreparedStatement prea = conn.prepareStatement("select id,number, tender_id from tendermis_purchase_order where status='"+stt+"'");
                       ResultSet rea=prea.executeQuery();
                       if (rea.next())
                        {  
                            tender_id = rea.getInt(3);
                            purchase_id=rea.getInt(1);
                            purchase_number=rea.getString(2);
                        %>
    
                                <%
                                    PreparedStatement popo = conn.prepareStatement("select id,name from tendermis_tender where id='"+rea.getInt(3)+"'");
                                    ResultSet france=popo.executeQuery();
                                    if(france.next())
                                     {
                                         tender_name= france.getString(2);
                                     }             
                                %> 
                                
                                 <%
                                    PreparedStatement getitem = conn.prepareStatement("select * from tendermis_item where purchas_id='"+rea.getInt(1)+"'");
                                    ResultSet items =getitem.executeQuery();
                                    while(items.next())
                                     {
                                 if (count<=0)
                                 
                                 {
                                 %>
                                <tr> 
                                     <td>
                                         <input style="width: 95px; height: 29px; margin-right: 6px;" value="<%=tender_name%>"  type="text" name="item_name" id="intem_nameid">
                              </td>
                                <td>
                                         <input style="width: 95px; height: 29px; margin-right: 6px;" value="<%=purchase_number%>"  type="text" name="item_name" id="intem_nameid">
                              </td>
                               <td>
                                         <input style="width: 95px; height: 29px; margin-right: 6px;" value="<%=purchase_number%>"  type="text" name="item_name" id="intem_nameid">
                              </td>
<!--                               <td>
                                <input style="width: 95px; height: 29px; margin-right: 6px;" value="<%=purchase_id%>"  type="text" name="serial_number" id="serial_numberid">
                               </td>-->
                           
                              <td>
                                <input style="width: 95px; height: 29px; margin-right: 6px;"  disabled="true"   type="date" name="delivery_date" id="delivery_dateid" >
                               </td> <td>
                                <input style="width: 95px; height: 29px; margin-right: 6px;" disabled="true"   type="date" name="delivery_date" id="delivery_dateid" >
                               </td>
                             
                               <td>
                                <input style="width: 95px; height: 29px; margin-right: 6px;" value="<%=items.getString(5)%>" disabled="true"   type="text" name="delivery_date" id="delivery_dateid" >
                               </td>
                               <td>
                                <input style="width: 95px; height: 29px; margin-right: 6px;" value="<%=items.getString(2)%>" disabled="true"    type="text" name="order_number" id="order_numberid">
                               </td>
                               <td>
                                 <input style="width: 95px; height: 29px; margin-right: 6px;" value="<%=items.getDouble(3)%>" disabled="true" type="text" name="receiving_date" id="receiving_dateid">
                              </td>
                              <td>
                                <input style="width: 95px; height: 29px; margin-right: 6px;" value="<%=items.getString(6)%>" disabled="true" type="text" name="pursuchorder_date" id="pursuchorder_dateid">
                              </td>
                             
                                 </tr>     
                                    <% 
                                        } else 

 
{%>

 <tr> 
                                     <td>
                                         <input  hidden=""style="width: 95px; height: 29px; margin-right: 6px;" 
                                 <input style="width: 95px; height: 29px; margin-right: 6px;" disabled="true" value="<%=tender_name%>"  type="text" name="item_name" id="intem_nameid">
                              </td>
                                <td>
                                         <input hidden="" style="width: 95px; height: 29px; margin-right: 6px;" 
                                 <input style="width: 95px; height: 29px; margin-right: 6px;" disabled="true" value="<%=purchase_number%>"  type="text" name="item_name" id="intem_nameid">
                              </td>
                               <td>
                                         <input hidden="" style="width: 95px; height: 29px; margin-right: 6px;" 
                                 <input style="width: 95px; height: 29px; margin-right: 6px;" disabled="true" value="<%=purchase_number%>"  type="text" name="item_name" id="intem_nameid">
                              </td>
<!--                               <td>
                                <input style="width: 95px; height: 29px; margin-right: 6px;" value="<%=purchase_id%>"  type="text" name="serial_number" id="serial_numberid">
                               </td>-->
                           
                              <td>
                                <input hidden="" style="width: 95px; height: 29px; margin-right: 6px;"  disabled="true"   type="date" name="delivery_date" id="delivery_dateid" >
                               </td> <td>
                                <input hidden="" style="width: 95px; height: 29px; margin-right: 6px;" disabled="true"   type="date" name="delivery_date" id="delivery_dateid" >
                               </td>
                             
                               <td>
                                <input style="width: 95px; height: 29px; margin-right: 6px;" value="<%=items.getString(5)%>" disabled="true"   type="text" name="delivery_date" id="delivery_dateid" >
                               </td>
                               <td>
                                <input style="width: 95px; height: 29px; margin-right: 6px;" value="<%=items.getString(2)%>" disabled="true"    type="text" name="order_number" id="order_numberid">
                               </td>
                               <td>
                                 <input style="width: 95px; height: 29px; margin-right: 6px;" value="<%=items.getDouble(3)%>" disabled="true" type="text" name="receiving_date" id="receiving_dateid">
                              </td>
                              <td>
                                <input style="width: 95px; height: 29px; margin-right: 6px;" value="<%=items.getString(6)%>" disabled="true" type="text" name="pursuchorder_date" id="pursuchorder_dateid">
                              </td>
                             
                                 </tr> 

<%}

                                   count++; }             
                                     
                                    %> 
                   
                        </tbody>
                        <form action="./class/itemcontrolor.jsp" method="post">
                                <tbody id="corps">
                                    
                             <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                             </tr>
                             <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                             </tr>
                            <tr>
                            <td>
                                <select style="width: 95px; height: 29px; margin-right: 6px; display: none;"  class="form-control" name="tender_name1" id="tender_id"> 
                                    <option value="<%=tender_id%>" selected="true" ><%=tender_name%></option>
                                </select>
                            </td>
                            
                            <td>
                                <input style="width: 95px; height: 29px; margin-right: 6px;display: none;" disabled="true"  type="date" name="delivery_date" id="delivery_dateid" >
                            </td>
                            <td>
                                <input style="width: 95px; height: 29px; margin-right: 6px;display: none;" type="text" value="<%=purchase_number%>"  type="text" name="purchase_number1" id="intem_nameid">
                              </td> 
                            </td>
                             <td>
                                 <input style="width: 95px; height: 29px; margin-right: 6px;display: none;" disabled="true" type="date" name="receiving_date" id="receiving_dateid">
                            </td>
                            <td>
                                <input style="width: 95px; height: 29px; margin-right: 6px;display: none;"  type="date" value="<%=purchase_number%>" name="pursuchorder_date" id="pursuchorder_dateid">
                            </td>
                            <td>
                                <input style="width: 95px; height: 29px; margin-right: 6px;"  type="text" name="item_name1" id="intem_nameid">
                            </td>
                            <td>
                                <input style="width: 95px; height: 29px; margin-right: 6px;"  type="text" name="serial_number1" id="serial_numberid">
                            </td>
                           
                            <td>
                                <input style="width: 95px; height: 29px; margin-right: 6px;"  type="number" name="quantity1" id="quantityid">
                            </td>
                             <td>
                                <textarea style="width: 120px; height: 50px; margin-right: 6px;" id="upcommentid" name="comment1" placeholder="Add some commment" required="required" class="form-control col-md-7 col-xs-12"></textarea>
                            </td>
                           
                             <td>
                            
                              <div>
                                  <input style="width: 90px; height: 29px;" class="btn btn-md btn-success" type="submit" name="btnaddpuchurse1" value="Add Item" id="btnpuchurseid">
                              </div>
                                 
                            </td> 
                            
                            
                        </tr>
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td>
                                <div>
                                    <a class="btn btn-success pull-right" href="./class/purchasecontrolor.jsp?purchase=<%=purchase_number%>">Send</a>
                                </div>
                            </td>
                        </tr>
                        
                      </tbody>
                    </table>
                  </form>   
                        
                        
                        <%
                        }else
                            {
                            
                            
                            %>
                            
                            <form action="./class/purchasecontrolor.jsp" method="post">
                                <tbody id="corps">
                            <tr>
                            <td>
                                <select style="width: 95px; height: 29px; margin-right: 6px;"  class="form-control" name="tender_name" id="tender_id">
                                    <option value="" selected="true">[Select]</option>
                          <%
                            PreparedStatement prepareIdTender = conn.prepareStatement("select tender_id from tendermis_contract");
                            ResultSet responseIdTender=prepareIdTender.executeQuery();
                            while(responseIdTender.next()){
                                
                                    PreparedStatement prepareNameTender = conn.prepareStatement("select id,name from tendermis_tender where id='"+responseIdTender.getInt(1)+"'");
                                    ResultSet resultNameTender=prepareNameTender.executeQuery();
                                    
                                    while(resultNameTender.next()){
                                    
                                                                         
                          %>
                          <option value="<%=resultNameTender.getInt(1) %>" selected="true" >  <%=resultNameTender.getString(2) %></option>
                                    <%
                          
                        }     }    
                          %>                          
                                </select>
                            </td>
                            
                            <td>
                                <input style="width: 95px; height: 29px; margin-right: 6px;"  type="date" name="delivery_date" id="delivery_dateid" >
                            </td>
                            <td>
                                <input style="width: 95px; height: 29px; margin-right: 6px;"  type="text" name="order_number" id="order_numberid">
                            </td>
                             <td>
                                 <input style="width: 95px; height: 29px; margin-right: 6px;" type="date" name="receiving_date" id="receiving_dateid">
                            </td>
                            <td>
                                <input style="width: 95px; height: 29px; margin-right: 6px;"  type="date" name="pursuchorder_date" id="pursuchorder_dateid">
                            </td>
                            <td>
                                <input style="width: 95px; height: 29px; margin-right: 6px;"  type="text" name="item_name" id="intem_nameid">
                            </td>
                            <td>
                                <input style="width: 95px; height: 29px; margin-right: 6px;"  type="text" name="serial_number" id="serial_numberid">
                            </td>
                           
                            <td>
                                <input style="width: 95px; height: 29px; margin-right: 6px;"  type="number" name="quantity" id="quantityid">
                            </td>
                             <td>
                                <textarea style="width: 120px; height: 50px; margin-right: 6px;" id="upcommentid" name="comment" placeholder="Add some commment" required="required" class="form-control col-md-7 col-xs-12"></textarea>
                            </td>
                           
                              <td>
                            
                              <div>
                                  <input style="width: 90px; height: 29px;" type="submit" name="btnaddpuchurse" value="Add" id="btnpuchurseid">
                              </div>
                            </td>    
                        <%
                            }
                        %>
                             
                         
                        </tr>
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                      </tbody>
                    </table>
                  </form>

              </div>
            </div>
    
        
           <div class="table-responsive">
             <table id="datatable" class="table table-striped jambo_table bulk_action">
                <thead>
                  <tr class="headings">
                  
                    <th class="column-title">Name</th>
                    <th class="column-title">Number</th>
                    <th class="column-title">Delivery Date </th>
                    <th class="column-title">Contract</th>
                    <th class="column-title">Receiving Date </th>
                    <th class="column-title">Purchase Date </th>
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
                  String name_tender="";
    
                  PreparedStatement preparedGetPurchaseOrder = conn.prepareStatement("select * from tendermis_purchase_order");
                  ResultSet responseGetPurchaseOrder=preparedGetPurchaseOrder.executeQuery();
                  while(responseGetPurchaseOrder.next()){
                      
                      int id_tender = responseGetPurchaseOrder.getInt(8);
                   
                      String query = "select name from tendermis_tender where id='"+id_tender+"'";
                      PreparedStatement prepareGetNameTender = conn.prepareStatement(query);
                      ResultSet responseGetNameTender= prepareGetNameTender.executeQuery();
                
                while(responseGetNameTender.next()){
                    name_tender = responseGetNameTender.getString(1);
                }
                double amount_contract = 0;
                String query2 = "select amount from tendermis_contract where id='"+responseGetPurchaseOrder.getInt(4)+"'";
                      PreparedStatement prepareGetAmountContract = conn.prepareStatement(query2);
                      ResultSet responseGetAmountContract= prepareGetAmountContract.executeQuery();
                
                while(responseGetAmountContract.next()){
                    amount_contract = responseGetAmountContract.getDouble(1);
                }
                %> 
                  <tr class="even pointer"><td><%=name_tender %></td><td><%=responseGetPurchaseOrder.getString(2)%></td><td><%=responseGetPurchaseOrder.getString(3)%></td><td><%=amount_contract%></td><td><%=responseGetPurchaseOrder.getString(5)%></td><td><%=responseGetPurchaseOrder.getString(6)%></td><td class=" last"><input id="submitonsdelete" onclick="del(<%=responseGetPurchaseOrder.getInt(1)%>)" type="button" value="Delete" class="btn btn-success pull-right" /><input data-toggle="modal" data-target="#updatePurchase_<%=responseGetPurchaseOrder.getInt(1)%>" name="" type="button" value="Update" class="btn btn-success pull-right" /></td></tr> 
                    

<div class="modal fade" id="updatePurchase_<%=responseGetPurchaseOrder.getInt(1)%>" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Update Purchase</h4>
        </div>
        <div class="modal-body">
           <div class="panel-body">
               
                 <form id="demo-form2" name="myform" data-parsley-validate class="form-horizontal form-label-left">

                   <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="tender">Tender <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <select style="width: 95px; height: 29px; margin-right: 6px;"  class="form-control" name="tender_name" id="tender_p">
                                    <option value="" selected="true">[Select]</option>
                          <%
                            PreparedStatement prepareIdTenderUp = conn.prepareStatement("select tender_id from tendermis_contract");
                            ResultSet responseIdTenderUp=prepareIdTenderUp.executeQuery();
                            while(responseIdTenderUp.next()){
                                
                                    PreparedStatement prepareNameTenderUp = conn.prepareStatement("select id,name from tendermis_tender where id='"+responseIdTenderUp.getInt(1)+"'");
                                    ResultSet resultNameTenderUp=prepareNameTenderUp.executeQuery();
                                    
                                    while(resultNameTenderUp.next()){
                                    
                                                                         
                          %>
                          <option value="<%=resultNameTenderUp.getInt(1) %>" selected="true" >  <%=resultNameTenderUp.getString(2) %></option>
                                    <%
                          
                        }     }    
                          %>                          
                                </select>
                          
                        </div><br/><br/> 
                        
                        <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="client_name">Number
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <input type="text" id="number_p" name="tender_number" class="form-control col-md-7 col-xs-12" value="<%=responseGetPurchaseOrder.getString(2)%>">
                            </div>
                      </div>
                      
                     <br/><br/> 
                        
                        <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="client_name">Delivery
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <input type="date" id="delivery_date" class="form-control col-md-7 col-xs-12" value="<%=responseGetPurchaseOrder.getString(3)%>">
                            </div>
                      </div>
                      
                      <br/><br/> 
                        
                        <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="client_name">Receiving
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <input type="date" id="receiving_date" class="form-control col-md-7 col-xs-12" value="<%=responseGetPurchaseOrder.getString(5)%>">
                            </div>
                      </div>
                            
                            <br/><br/> 
                        
                        <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="client_name">Purchase Date
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <input type="date" id="purchase_date" class="form-control col-md-7 col-xs-12" value="<%=responseGetPurchaseOrder.getString(6)%>">
                            </div>
                      </div>
                        <br/><br/>    
                     <div class="form-group"  >
                        <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                          <button class="btn btn-danger" type="button">Cancel</button>
						       
                          <input  onclick="updatePurchase(<%=responseGetPurchaseOrder.getInt(1)%>)" type="button" value="Submit" id="subUpPurch" class="btn btn-success pull-right"/>

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
    
    
     function del(id){
       if(confirm("Do you really want to delete this component?")){
           
           var submitonsdelete = document.getElementById("submitonsdelete").value;
         var deleteCompoData = 'id1='+id + '&submitonsdelete1='+submitonsdelete;
         
         if(id=='')
          {
              alert("the component doesn't exist");
          }
     else
     {
        $.ajax({
        type: "post",
        url: "class/purchasecontrolor.jsp",
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
 
 function updatePurchase(id)
 {
     var number = document.getElementById("number_p").value;
     var tender = document.getElementById("tender_p").value;
     var delivery = document.getElementById("delivery_date").value;
     var receiving = document.getElementById("receiving_date").value;
     var purchase = document.getElementById("purchase_date").value;
     var btnsubUpPurch = document.getElementById("subUpPurch").value;
     
     
     var updateCompoData = 'btnsubUpPurch1='+btnsubUpPurch + '&number1='+number+'&tender1='+tender+'&delivery1='+delivery+'&receiving1='+receiving+'&purchase1='+purchase+'&idPurchas1='+id;
         
     $.ajax({
        type: "post",
        url: "class/purchasecontrolor.jsp",
        data: updateCompoData,
        async:false,
        success: function(html) {
        alert("well deleted");
        document.forms[0].action = "index.jsp?request=purchase";
        document.forms[0].method = "post";
        document.forms[0].submit();
        }
        });
 }
    
</script>

	