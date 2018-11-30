<style>
    .btn-circle {
        width: 30px;
        height: 30px;
        padding: 6px 0px;
        border-radius: 15px;
        text-align: center;
        font-size: 12px;
        line-height: 1.42857;
    }
</style>



<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="core.*" %>
<%
//       db d = new db();
//       //Connection conn = d.getcon();
//       d.connection();
//       Connection conn = d.getcon();
%>
<!-- page content -->

<body>

<div class="right_col" role="main">

    <a class="panel-heading col-md-6" role="tab" id="headingOne" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
        <h4 class="panel-title"><span class="fa fa-plus-circle"/> New Preparation</h4>
    </a>
    <a class="panel-heading col-md-6" role="tab" id="headingTwo" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
        <h4 class="panel-title"><span class="fa fa-plus-circle"/> New Coasting</h4>
    </a>

    <div id="collapseOne" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOne" style="padding-top:5px;">
   
        <div class="panel-body">
            <form id="demo-form2" name="myform" data-parsley-validate class="form-horizontal form-label-left" action="./class/preparationcontrolor.jsp">
                <div class="form-group">
                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="tender">Tender <span class="required">*</span>
                    </label>
                    <div class="col-md-6 col-sm-6 col-xs-12">
 
                        <select   onchange="showDoc(this.value)" class="form-control" name="tender_id" id="tenderSelect">
                            <option disabled selected>[ Select ]</option>
                            <%
//                                String etat = "pending";
//                                PreparedStatement ps = conn.prepareStatement("select id,name,documents from tendermis_tender");
//                                ResultSet rs=ps.executeQuery();
//                                while(rs.next()){
                                                                         
                            %>
                            <option> Doc name</option>
                          <%
//                          }                 
                          %>
                        </select>
                            
                    </div>
                </div>
                <div class="form-group">
                <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3"  id="notifyStatus">

                </div>
                </div>
                <div class="form-group"  >
                    <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3" id="">
                                    <button class="btn btn-danger" data-dismiss="modal" type="button">Cancel</button>						       
                                    <button type="submit" name="subApp" class="btn btn-success pull-right">Submit</button>
                                </div>
                </div>
            </form>
                           
        </div>
</div>

  <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo" style="padding-top:5px;">
   
        <div class="panel-body">
            <form id="demo-form2" name="coasting" data-parsley-validate class="form-horizontal form-label-left" action="#">
                <table class="table1">
                    <thead>
                        <tr>                            
                             <th>Tender</th>
                             <th>Expenses Type</th>                            
                             <th style="display: none;" id="normal_exp_name_th"> Expenses Name</th> 
                              <th> </th>
                             <th style="display: none;" id="normal_exp_amount_th"> Exp Amount</th>                            
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>
                                <select name="tender_id" id="tenderSelect" style="width: 95px; height: 29px; margin-right: 6px;" onchange="showDoc(this.value)" >
                                    <option disabled selected>[ Select ]</option>
                                    <option value=""> Tender 1</option>
                                    <option value=""> Tender 2</option>
                                </select> 
                            </td>  
                            <td>
                                <select  name="expensive_type" id="expensiveType" style="width: 95px; height: 29px; margin-right: 6px;"  onchange="showDoc(this.value)"  >
                                    <option disabled selected>[ Select ]</option>
                                    <option value="0"> Normal </option>
                                    <option value="1"> Inventory</option>
                                </select> 
                            </td>
                            <td id="normal_exp_name" style="display: none;">
                                <input type="text" name="expensive_type" id="ExpensiveType" style="width: 95px; height: 29px; margin-right: 6px;"  onchange="showDoc(this.value)" >
                                     
                            </td>
                            <td >                              
                               
                            </td>
                            <td id="normal_exp_amount" style="display: none;">                                                                                                 
                                <input type="text" id="exp_amount" name="expense_amount"  style="width: 95px; height: 29px; margin-right: 6px;"  >                                 
                            </td>
                        </tr>
                    </tbody>
                </table>
                
                
                
                
                <table class="table1" id="inv_expenses" style="display: none;">
                      <thead>
                        <tr>
                          <th>Quantity</th>
                          <th>Sale Price</th> 
                          <th>Total Price</th>
                          <th>Hors Tax 1</th>
                          <th>Total Hors Tax</th>
                          <th>Purchase PU</th>
                          <th>Purchase PT</th>
                          <th>Benefit U.</th>
                          <th>Benefit Tot.</th>
                          <th>Income Tax</th>
                          <th>Benefit</th>
                        </tr>
                      </thead>
                      <tbody id="corps">
                       
                                <tr> 
                              <td>
                                   <input style="width: 95px; height: 29px; margin-right: 6px;"  value="" type="text" name="quantity" id="quantity" onkeyup="getValues();">
                              </td>
                               <td>
                                    <input style="width: 95px; height: 29px; margin-right: 6px;"  value="" type="text" name="sale_price" id="saleprice" onkeyup="getValues();">
                              </td>
                               <td>
                                    <input style="width: 95px; height: 29px; margin-right: 6px;" value="" type="text" disabled="true" name="total_price" id="totalprice">
                              </td>

                              <td>
                                <input style="width: 95px; height: 29px; margin-right: 6px;" disabled="true" type="text" name="hors_tax_1" id="hors_tax_1" >
                               </td> <td>
                                <input style="width: 95px; height: 29px; margin-right: 6px;" disabled="true"  type="text" name="hors_tax_total" id="hors_tax_total" >
                               </td>
                             
                               <td>
                                <input style="width: 95px; height: 29px; margin-right: 6px;" type="text" name="purchase_PU" id="purchase_PU" >
                               </td>
                               <td>
                                <input style="width: 95px; height: 29px; margin-right: 6px;" type="text" name="purchase_PT" id="purchase_PT">
                               </td>
                               <td>
                                 <input style="width: 95px; height: 29px; margin-right: 6px;" disabled="true" type="text" name="benefit_U" id="benefit_U">
                              </td>
                              <td>
                                <input style="width: 95px; height: 29px; margin-right: 6px;" disabled="true" type="text" name="benefit_Total" id="benefit_Total">
                              </td>
                               <td>
                                <input style="width: 95px; height: 29px; margin-right: 6px;" type="text" name="income_tax" id="income_tax">
                              </td>
                               <td>
                                <input style="width: 95px; height: 29px; margin-right: 6px;" type="text" name="benefit" id="benefit">
                              </td>
                             
                                 </tr>     
                           
                        
                      </tbody>
                    </table>

                
                <div class="form-group" style="padding-top: 5px;">
                    <div class="col-md-3 col-sm-3 col-xs-12" >
                        <button class="btn btn-danger" data-dismiss="modal" type="button">Cancel</button>						       
                        <button type="submit" name="subApp" class="btn btn-success pull-right">Submit</button>
                    </div>
                </div>
            </form>
                           
        </div>
</div>
    <!-- /page content -->

    <!-- modal-->

    <div class="modal fade" id="newDocument" role="dialog">
        <div class="modal-dialog">
            <!-- modal content-->
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
                                    <input type="text" id="last-name" name="document_name" required="required" class="form-control col-md-7 col-xs-12">
                                </div>
                            </div>  
                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="validity">Validity <span class="required">*</span>
                                </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <select class="form-control" name="document_validity" id="validity" >
                                        <option >[ Select ]</option>
                                        <option value="0">Perpetual</option>
                                        <option value="1">Permanent</option>  
                                    </select>
                                </div>
                            </div>
                            <div class="form-group" id="hidden_div" style="display: none;">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="validity_period">Issue - End Date <span class="required">*</span>
                                </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">                            
                                    <div class="input-prepend input-group">
                                        <span class="add-on input-group-addon"><i class="glyphicon glyphicon-calendar fa fa-calendar"></i></span>
                                        <input type="text"  name="validity_period" id="validity_period" class="form-control col-md-7 col-xs-12" value="01/01/2018 - 01/25/2018" />
                                    </div>
                                </div>
                            </div>

                            <div class="form-group"  >
                                <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                                    <button class="btn btn-danger" data-dismiss="modal" type="button">Cancel</button>						       
                                    <button type="submit" class="btn btn-success pull-right">Submit</button>
                                </div>
                            </div>

                        </form>
                    </div>
                </div>

            </div>

        </div>
    </div>
</div>

<!--<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>-->
<script src="../js/jquery-2.1.3.min.js" type="text/javascript"></script>
<script src="../js/Script1.js" type="text/javascript"></script>
</body>

<script type="text/javascript">
    //hidding text-field on expensive type select
    document.getElementById('expensiveType').addEventListener('change', function () {
    var style = this.value == 0 ? 'block' : 'none';    
    document.getElementById('normal_exp_name').style.display = style;
    document.getElementById('normal_exp_amount').style.display = style;
    document.getElementById('normal_exp_name_th').style.display = style;
    document.getElementById('normal_exp_amount_th').style.display = style;
});
document.getElementById('expensiveType').addEventListener('change', function () {
    var style = this.value == 1 ? 'block' : 'none';    
    document.getElementById('inv_expenses').style.display = style;
});
</script>

<script type="text/javascript"> 
//Disply the product of Qty and Sale Price in Total price txt field
function getValues(){
var quantity=document.getElementById("quantity").value;
var sprice=document.getElementById("saleprice").value;
var total=parseInt(quantity) * parseInt(sprice);
document.getElementById("totalprice").value = total;
}
</script>

<script type="text/javascript">    
$(document).ready(function () {
    var max_fields = 4; //maximum input boxes allowed
    var wrapper = $(".input_fields_wrap"); //Fields wrapper
    var add_button = $(".add_field_button"); //Add button ID

    var x = 1; //initlal text box count
    $(add_button).click(function (e) { //on add input button click
        e.preventDefault();
        if (x < max_fields) { //max input box allowed
            x++; //text box increment
            $(wrapper).append('<div><select class="form-control" name="doc"><option>[ Select ]</option><option> New Doc</option><option> RSSB</option><option> Bid Security</option><option> Trading License(RDB)</option></select><div class="col-md-6 col-sm-6 col-xs-12" > <span>Certification Status</span><input type="radio" name="auth_status" required="required">Yes<input type="radio" name="auth_status"required="required">No <input type="radio" name="auth_status"required="required">N/A</div>\
<input type="hidden">\
<a href="#" class="remove_field">Remove</a></div>'); //add form
        }
    });

    $(wrapper).on("click", ".remove_field", function (e) { //user click on remove text
        e.preventDefault();
        $(this).parent('div').remove();
        x--;
        $(document).ready(function () {
            update();
        });
    });

});


</script>
<script>
    
    document.getElementById('validity').addEventListener('change', function () {
        var style = this.value == 1 ? 'block' : 'none';
        document.getElementById('hidden_div').style.display = style;
    });

 
    function chargeTable()
    {
        try {

            var item = document.getElementById("tenderSelect").value;
//            document.forms[0].action = "class/ajaxcontrolor.jsp?item1=" + item;
//            document.forms[0].method = "post";
//            document.forms[0].submit();



        } catch (err) {
            alert('Error selcting the tender preparation ' + err)
        }
    }



    function del(id) {
        var bt = document.getElementById("submitonsdelete");
        if (confirm("Do you really want to delete this component?")) {

            var deleteCompoData = 'id1=' + id + '&btn1=' + bt;

            if (id == '')
            {
                alert("the component doesn't exist");
            } else
            {
                $.ajax({
                    type: "post",
                    url: "class/preparationcontrolor.jsp",
                    data: deleteCompoData,
                    async: false,
                    success: function (html) {
                        alert("well deleted");
//response.sendRedirect("error.jsp");
                        document.forms[0].action = "index.jsp?request=preparation";
                        document.forms[0].method = "post";
                        document.forms[0].submit();

                    }
                });
            }
        }
        return false;
    }

    function updatePreparation(id)
    {
        var multis = document.getElementById("updocsid");
        var uptender = document.getElementById("uptenderid").value;
        var upsubmitonspr = document.getElementById("upsubmitonsprepare").value;



        var upresult = "";
        var separator = ",";
        for (i = 0; i < multis.length; i++)
        {
            var currentOption = multis[i];

            if (currentOption.selected == true || currentOption.value != '')
            {
                upresult += currentOption.value;
                upresult += separator;

            }
        }

        var status = document.getElementsByTagName('input');
        var statusLength = status.length;

        for (var i = 0; i < statusLength; i++)
        {
            if (status[i].type == 'radio' && status[i].checked)
            {
                var upstatusfinal = status[i].value;
            }

        }
        var UppreparationDataString = 'upsubmitonspr1=' + upsubmitonspr + '&uptender1=' + uptender + '&upresult1=' + upresult + '&statusfinal1=' + upstatusfinal + '&id1=' + id;

        if (uptender == '' || upresult == '[ Select ]' || upstatusfinal == '') {
            alert("All the fields have to be filled");
        } else
        {
            $.ajax({
                type: "post",
                url: "class/preparationcontrolor.jsp",
                data: UppreparationDataString,
                async: false,
                success: function (html) {
                    alert("well Updated");
                    document.forms[0].action = "index.jsp?request=preparation";
                    document.forms[0].method = "post";
                    document.forms[0].submit();
                }
            });

        }

    }

</script>
