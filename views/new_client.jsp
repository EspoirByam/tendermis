
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
//        db d = new db();
//        Connection conn = d.getcon();
    
    %>
   
           <div class="right_col" role="main">        
              <div class="x_panel">
                <div class="x_title">
                  <h2><i class="fa fa-user-plus"></i> New Client</h2>
                  <ul class="nav navbar-right panel_toolbox">
                    <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                    </li>
                    
                    <li><a class="close-link"><i class="fa fa-close"></i></a>
                    </li>
                  </ul>
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">            
              
                    <!-- Tabs -->
                   <div id="wizard_verticle" class="form_wizard wizard_verticle">
                      <ul class="list-unstyled wizard_steps">
                        <li>
                          <a href="#step-1">
                            <span class="step_no">1</span>
                          </a>
                        </li>
                        <li>
                          <a href="#step-2">
                            <span class="step_no">2</span>
                          </a>
                        </li>
                        <li>
                          <a href="#step-3">
                            <span class="step_no">3</span>
                          </a>
                        </li>
                       
                      </ul>

                      <div id="step-1">
                       
                        <form class="form-horizontal form-label-left" style="padding-top: 5px;">
                                <div class="form-group">
                                  <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">Name <span class="required">*</span>
                                  </label>
                                  <div class="col-md-9 col-sm-9 col-xs-12">
                                    <input type="text" id="nameid" name="name" required="required" class="form-control col-md-10">
                                  </div>
                                </div>
                                <div class="form-group">
                                  <label class="control-label col-md-3 col-sm-3 col-xs-12" for="tin_number">TIN Number <span class="required">*</span>
                                  </label>
                                  <div class="col-md-9 col-sm-9 col-xs-12">
                                    <input type="text" id="tinnumberid" name="tin_number" required="required" class="form-control col-md-10">
                                  </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="tender_category">Category <span class="required">*</span>
                                    </label>
                                    <div class="col-md-9 col-sm-9 col-xs-12">
                                        <select id="categoryid" class="form-control" name="tender_issue" >
                                          <option disabled selected>[ Select ]</option>
                                        <option data-toggle="modal" data-target="#newClientCategory">Add</option>
                                        <%
//                                PreparedStatement prst = conn.prepareStatement("select * from tendermis_client_category");
//                                        ResultSet res=prst.executeQuery();
//                                            while(res.next()){
//                            
                            %>
                         <option value="<%//=res.getInt(1) %>"><%//=res.getString(2) %></option> -->
                            <%
                             // }
                            %>
                                      </select>
                                    </div>
                                  </div>                    
                      </div>
                      <div id="step-2">
                         <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">HQ Country</label>
                        <div class="col-md-9 col-sm-9 col-xs-12">
                            <select id="countryid" class="form-control" name="country">
                                    <option >[ Select ]</option>
                                    <option value="United States">United States</option> 
                                    <option value="United Kingdom">United Kingdom</option> 
                                    <option value="Afghanistan">Afghanistan</option> 
                                    <option value="Albania">Albania</option> 
                                    <option value="Algeria">Algeria</option> 
                                    <option value="American Samoa">American Samoa</option> 
                                    <option value="Andorra">Andorra</option> 
                                    <option value="Angola">Angola</option> 
                                    <option value="Anguilla">Anguilla</option> 
                                    <option value="Antarctica">Antarctica</option> 
                                    <option value="Antigua and Barbuda">Antigua and Barbuda</option> 
                                    <option value="Argentina">Argentina</option> 
                                    <option value="Armenia">Armenia</option> 
                                    <option value="Aruba">Aruba</option> 
                                    <option value="Australia">Australia</option> 
                                    <option value="Austria">Austria</option> 
                                    <option value="Azerbaijan">Azerbaijan</option> 
                                    <option value="Bahamas">Bahamas</option> 
                                    <option value="Bahrain">Bahrain</option> 
                                    <option value="Bangladesh">Bangladesh</option> 
                                    <option value="Barbados">Barbados</option> 
                                    <option value="Belarus">Belarus</option> 
                                    <option value="Belgium">Belgium</option> 
                                    <option value="Belize">Belize</option> 
                                    <option value="Benin">Benin</option> 
                                    <option value="Bermuda">Bermuda</option> 
                                    <option value="Bhutan">Bhutan</option> 
                                    <option value="Bolivia">Bolivia</option> 
                                    <option value="Bosnia and Herzegovina">Bosnia and Herzegovina</option> 
                                    <option value="Botswana">Botswana</option> 
                                    <option value="Bouvet Island">Bouvet Island</option> 
                                    <option value="Brazil">Brazil</option> 
                                    <option value="British Indian Ocean Territory">British Indian Ocean Territory</option> 
                                    <option value="Brunei Darussalam">Brunei Darussalam</option> 
                                    <option value="Bulgaria">Bulgaria</option> 
                                    <option value="Burkina Faso">Burkina Faso</option> 
                                    <option value="Burundi">Burundi</option> 
                                    <option value="Cambodia">Cambodia</option> 
                                    <option value="Cameroon">Cameroon</option> 
                                    <option value="Canada">Canada</option> 
                                    <option value="Cape Verde">Cape Verde</option> 
                                    <option value="Cayman Islands">Cayman Islands</option> 
                                    <option value="Central African Republic">Central African Republic</option> 
                                    <option value="Chad">Chad</option> 
                                    <option value="Chile">Chile</option> 
                                    <option value="China">China</option> 
                                    <option value="Christmas Island">Christmas Island</option> 
                                    <option value="Cocos (Keeling) Islands">Cocos (Keeling) Islands</option> 
                                    <option value="Colombia">Colombia</option> 
                                    <option value="Comoros">Comoros</option> 
                                    <option value="Congo">Congo</option> 
                                    <option value="Congo, The Democratic Republic of The">Congo, The Democratic Republic of The</option> 
                                    <option value="Cook Islands">Cook Islands</option> 
                                    <option value="Costa Rica">Costa Rica</option> 
                                    <option value="Cote D'ivoire">Cote D'ivoire</option> 
                                    <option value="Croatia">Croatia</option> 
                                    <option value="Cuba">Cuba</option> 
                                    <option value="Cyprus">Cyprus</option> 
                                    <option value="Czech Republic">Czech Republic</option> 
                                    <option value="Denmark">Denmark</option> 
                                    <option value="Djibouti">Djibouti</option> 
                                    <option value="Dominica">Dominica</option> 
                                    <option value="Dominican Republic">Dominican Republic</option> 
                                    <option value="Ecuador">Ecuador</option> 
                                    <option value="Egypt">Egypt</option> 
                                    <option value="El Salvador">El Salvador</option> 
                                    <option value="Equatorial Guinea">Equatorial Guinea</option> 
                                    <option value="Eritrea">Eritrea</option> 
                                    <option value="Estonia">Estonia</option> 
                                    <option value="Ethiopia">Ethiopia</option> 
                                    <option value="Falkland Islands (Malvinas)">Falkland Islands (Malvinas)</option> 
                                    <option value="Faroe Islands">Faroe Islands</option> 
                                    <option value="Fiji">Fiji</option> 
                                    <option value="Finland">Finland</option> 
                                    <option value="France">France</option> 
                                    <option value="French Guiana">French Guiana</option> 
                                    <option value="French Polynesia">French Polynesia</option> 
                                    <option value="French Southern Territories">French Southern Territories</option> 
                                    <option value="Gabon">Gabon</option> 
                                    <option value="Gambia">Gambia</option> 
                                    <option value="Georgia">Georgia</option> 
                                    <option value="Germany">Germany</option> 
                                    <option value="Ghana">Ghana</option> 
                                    <option value="Gibraltar">Gibraltar</option> 
                                    <option value="Greece">Greece</option> 
                                    <option value="Greenland">Greenland</option> 
                                    <option value="Grenada">Grenada</option> 
                                    <option value="Guadeloupe">Guadeloupe</option> 
                                    <option value="Guam">Guam</option> 
                                    <option value="Guatemala">Guatemala</option> 
                                    <option value="Guinea">Guinea</option> 
                                    <option value="Guinea-bissau">Guinea-bissau</option> 
                                    <option value="Guyana">Guyana</option> 
                                    <option value="Haiti">Haiti</option> 
                                    <option value="Heard Island and Mcdonald Islands">Heard Island and Mcdonald Islands</option> 
                                    <option value="Holy See (Vatican City State)">Holy See (Vatican City State)</option> 
                                    <option value="Honduras">Honduras</option> 
                                    <option value="Hong Kong">Hong Kong</option> 
                                    <option value="Hungary">Hungary</option> 
                                    <option value="Iceland">Iceland</option> 
                                    <option value="India">India</option> 
                                    <option value="Indonesia">Indonesia</option> 
                                    <option value="Iran, Islamic Republic of">Iran, Islamic Republic of</option> 
                                    <option value="Iraq">Iraq</option> 
                                    <option value="Ireland">Ireland</option> 
                                    <option value="Israel">Israel</option> 
                                    <option value="Italy">Italy</option> 
                                    <option value="Jamaica">Jamaica</option> 
                                    <option value="Japan">Japan</option> 
                                    <option value="Jordan">Jordan</option> 
                                    <option value="Kazakhstan">Kazakhstan</option> 
                                    <option value="Kenya">Kenya</option> 
                                    <option value="Kiribati">Kiribati</option> 
                                    <option value="Korea, Democratic People's Republic of">Korea, Democratic People's Republic of</option> 
                                    <option value="Korea, Republic of">Korea, Republic of</option> 
                                    <option value="Kuwait">Kuwait</option> 
                                    <option value="Kyrgyzstan">Kyrgyzstan</option> 
                                    <option value="Lao People's Democratic Republic">Lao People's Democratic Republic</option> 
                                    <option value="Latvia">Latvia</option> 
                                    <option value="Lebanon">Lebanon</option> 
                                    <option value="Lesotho">Lesotho</option> 
                                    <option value="Liberia">Liberia</option> 
                                    <option value="Libyan Arab Jamahiriya">Libyan Arab Jamahiriya</option> 
                                    <option value="Liechtenstein">Liechtenstein</option> 
                                    <option value="Lithuania">Lithuania</option> 
                                    <option value="Luxembourg">Luxembourg</option> 
                                    <option value="Macao">Macao</option> 
                                    <option value="Macedonia, The Former Yugoslav Republic of">Macedonia, The Former Yugoslav Republic of</option> 
                                    <option value="Madagascar">Madagascar</option> 
                                    <option value="Malawi">Malawi</option> 
                                    <option value="Malaysia">Malaysia</option> 
                                    <option value="Maldives">Maldives</option> 
                                    <option value="Mali">Mali</option> 
                                    <option value="Malta">Malta</option> 
                                    <option value="Marshall Islands">Marshall Islands</option> 
                                    <option value="Martinique">Martinique</option> 
                                    <option value="Mauritania">Mauritania</option> 
                                    <option value="Mauritius">Mauritius</option> 
                                    <option value="Mayotte">Mayotte</option> 
                                    <option value="Mexico">Mexico</option> 
                                    <option value="Micronesia, Federated States of">Micronesia, Federated States of</option> 
                                    <option value="Moldova, Republic of">Moldova, Republic of</option> 
                                    <option value="Monaco">Monaco</option> 
                                    <option value="Mongolia">Mongolia</option> 
                                    <option value="Montserrat">Montserrat</option> 
                                    <option value="Morocco">Morocco</option> 
                                    <option value="Mozambique">Mozambique</option> 
                                    <option value="Myanmar">Myanmar</option> 
                                    <option value="Namibia">Namibia</option> 
                                    <option value="Nauru">Nauru</option> 
                                    <option value="Nepal">Nepal</option> 
                                    <option value="Netherlands">Netherlands</option> 
                                    <option value="Netherlands Antilles">Netherlands Antilles</option> 
                                    <option value="New Caledonia">New Caledonia</option> 
                                    <option value="New Zealand">New Zealand</option> 
                                    <option value="Nicaragua">Nicaragua</option> 
                                    <option value="Niger">Niger</option> 
                                    <option value="Nigeria">Nigeria</option> 
                                    <option value="Niue">Niue</option> 
                                    <option value="Norfolk Island">Norfolk Island</option> 
                                    <option value="Northern Mariana Islands">Northern Mariana Islands</option> 
                                    <option value="Norway">Norway</option> 
                                    <option value="Oman">Oman</option> 
                                    <option value="Pakistan">Pakistan</option> 
                                    <option value="Palau">Palau</option> 
                                    <option value="Palestinian Territory, Occupied">Palestinian Territory, Occupied</option> 
                                    <option value="Panama">Panama</option> 
                                    <option value="Papua New Guinea">Papua New Guinea</option> 
                                    <option value="Paraguay">Paraguay</option> 
                                    <option value="Peru">Peru</option> 
                                    <option value="Philippines">Philippines</option> 
                                    <option value="Pitcairn">Pitcairn</option> 
                                    <option value="Poland">Poland</option> 
                                    <option value="Portugal">Portugal</option> 
                                    <option value="Puerto Rico">Puerto Rico</option> 
                                    <option value="Qatar">Qatar</option> 
                                    <option value="Reunion">Reunion</option> 
                                    <option value="Romania">Romania</option> 
                                    <option value="Russian Federation">Russian Federation</option> 
                                    <option value="Rwanda">Rwanda</option> 
                                    <option value="Saint Helena">Saint Helena</option> 
                                    <option value="Saint Kitts and Nevis">Saint Kitts and Nevis</option> 
                                    <option value="Saint Lucia">Saint Lucia</option> 
                                    <option value="Saint Pierre and Miquelon">Saint Pierre and Miquelon</option> 
                                    <option value="Saint Vincent and The Grenadines">Saint Vincent and The Grenadines</option> 
                                    <option value="Samoa">Samoa</option> 
                                    <option value="San Marino">San Marino</option> 
                                    <option value="Sao Tome and Principe">Sao Tome and Principe</option> 
                                    <option value="Saudi Arabia">Saudi Arabia</option> 
                                    <option value="Senegal">Senegal</option> 
                                    <option value="Serbia and Montenegro">Serbia and Montenegro</option> 
                                    <option value="Seychelles">Seychelles</option> 
                                    <option value="Sierra Leone">Sierra Leone</option> 
                                    <option value="Singapore">Singapore</option> 
                                    <option value="Slovakia">Slovakia</option> 
                                    <option value="Slovenia">Slovenia</option> 
                                    <option value="Solomon Islands">Solomon Islands</option> 
                                    <option value="Somalia">Somalia</option> 
                                    <option value="South Africa">South Africa</option> 
                                    <option value="South Georgia and The South Sandwich Islands">South Georgia and The South Sandwich Islands</option> 
                                    <option value="Spain">Spain</option> 
                                    <option value="Sri Lanka">Sri Lanka</option> 
                                    <option value="Sudan">Sudan</option> 
                                    <option value="Suriname">Suriname</option> 
                                    <option value="Svalbard and Jan Mayen">Svalbard and Jan Mayen</option> 
                                    <option value="Swaziland">Swaziland</option> 
                                    <option value="Sweden">Sweden</option> 
                                    <option value="Switzerland">Switzerland</option> 
                                    <option value="Syrian Arab Republic">Syrian Arab Republic</option> 
                                    <option value="Taiwan, Province of China">Taiwan, Province of China</option> 
                                    <option value="Tajikistan">Tajikistan</option> 
                                    <option value="Tanzania, United Republic of">Tanzania, United Republic of</option> 
                                    <option value="Thailand">Thailand</option> 
                                    <option value="Timor-leste">Timor-leste</option> 
                                    <option value="Togo">Togo</option> 
                                    <option value="Tokelau">Tokelau</option> 
                                    <option value="Tonga">Tonga</option> 
                                    <option value="Trinidad and Tobago">Trinidad and Tobago</option> 
                                    <option value="Tunisia">Tunisia</option> 
                                    <option value="Turkey">Turkey</option> 
                                    <option value="Turkmenistan">Turkmenistan</option> 
                                    <option value="Turks and Caicos Islands">Turks and Caicos Islands</option> 
                                    <option value="Tuvalu">Tuvalu</option> 
                                    <option value="Uganda">Uganda</option> 
                                    <option value="Ukraine">Ukraine</option> 
                                    <option value="United Arab Emirates">United Arab Emirates</option> 
                                    <option value="United Kingdom">United Kingdom</option> 
                                    <option value="United States">United States</option> 
                                    <option value="United States Minor Outlying Islands">United States Minor Outlying Islands</option> 
                                    <option value="Uruguay">Uruguay</option> 
                                    <option value="Uzbekistan">Uzbekistan</option> 
                                    <option value="Vanuatu">Vanuatu</option> 
                                    <option value="Venezuela">Venezuela</option> 
                                    <option value="Viet Nam">Viet Nam</option> 
                                    <option value="Virgin Islands, British">Virgin Islands, British</option> 
                                    <option value="Virgin Islands, U.S.">Virgin Islands, U.S.</option> 
                                    <option value="Wallis and Futuna">Wallis and Futuna</option> 
                                    <option value="Western Sahara">Western Sahara</option> 
                                    <option value="Yemen">Yemen</option> 
                                    <option value="Zambia">Zambia</option> 
                                    <option value="Zimbabwe">Zimbabwe</option>
                            </select>
                        </div>
                        
                      </div> 
                          
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="city">City <span class="required">*</span>
                        </label>
                        <div class="col-md-9 col-sm-9 col-xs-12">
                          <input type="text" id="cityid" name="city" required="required" class="form-control col-md-10">
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="address">Address <span class="required">*</span>
                        </label>
                        <div class="col-md-9 col-sm-9 col-xs-12">
                          <input type="text" id="adresseid" name="address" required="required" class="form-control col-md-10">
                        </div>
                      </div>
                      <div class="form-group">
                       <label class="control-label col-md-3 col-sm-3 col-xs-12" for="po_box">Po.Box <span class="required">*</span>
                        </label>
                        <div class="col-md-9 col-sm-9 col-xs-12">
                          <input type="text" id="poboxid" name="po_box" required="required" class="form-control col-md-10">
                        </div>
                      </div>
                      <div class="form-group">
                       <label class="control-label col-md-3 col-sm-3 col-xs-12" for="contact">Contact <span class="required">*</span>
                        </label>
                        <div class="col-md-9 col-sm-9 col-xs-12 input_fields_wrap">                                               
                           <div class="input-group">
                            <input type="text" id="contactid" name="contact" required="required" class="form-control col-md-10">
                                <span class="input-group-btn">
                                     <button type="button" class="btn btn-primary add_field_button">Add</button>
                                 </span>
                          </div> 
                        </div>
                      </div>
                      <div class="form-group">
                       <label class="control-label col-md-3 col-sm-3 col-xs-12" for="email">Email <span class="required">*</span>
                        </label>
                        <div class="col-md-9 col-sm-9 col-xs-12 input_fields_wrap1">
                           <div class="input-group "> 
                            <input type="email" id="emailid" name="email" required="required" class="form-control col-md-10">
                                <span class="input-group-btn">
                                    <button type="button" class="btn btn-primary add_field_button1">Add</button>
                                </span>
                           </div>
                        </div>                     
                          
                      </div>
                      <div class="form-group">
                       <label class="control-label col-md-3 col-sm-3 col-xs-12" for="website">Website <span class="required">*</span>
                        </label>
                        <div class="col-md-9 col-sm-9 col-xs-12">
                          <input type="text" id="websiteid" name="website" required="required" class="form-control col-md-10">
                        </div>
                      </div>
                      </div>
                        
                      <div id="step-3">
                        <div class="form-group">
                       <label class="control-label col-md-3 col-sm-3 col-xs-12" for="bank_name">Bank Name <span class="required">*</span>
                        </label>
                        <div class="col-md-9 col-sm-9 col-xs-12">
                          <input type="text" id="banknameid" name="bank_name" required="required" class="form-control col-md-10">
                        </div>
                      </div>
                       <div class="form-group">
                       <label class="control-label col-md-3 col-sm-3 col-xs-12" for="bank_acc_no">Bank Acc No. <span class="required">*</span>
                        </label>
                        <div class="col-md-9 col-sm-9 col-xs-12">
                          <input type="text" id="bankaccountid" name="bank_acc_no" required="required" class="form-control col-md-10">
                        </div>
                      </div>
                      <div class="form-group">
                       <label class="control-label col-md-3 col-sm-3 col-xs-12" for="bank_acc_holder">Bank Acc Holder <span class="required">*</span>
                        </label>
                        <div class="col-md-9 col-sm-9 col-xs-12">
                          <input type="text" id="bankaccountholderid" name="bank_acc_holder" required="required" class="form-control col-md-10">
                        </div>
                      </div>
                          
                       <div class="form-group" style="padding-top: 10px;" >
                        <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                            <input id="cancelten" onclick="cancelt()" class="btn btn-danger" type="button" value="Cancel"/>
						       
                          <!--<button id="submit_tender" type="submit" class="btn btn-success pull-right" onclick="insertTender()">Submit</button>-->
                          <!--<input id="submit_tender" onclick="insertTender()" type="button" class="btn btn-success pull-right" value="Submit">-->
                          <input id="submitonscl" onclick="saveClient()" type="button" value="Submit" class="btn btn-success pull-right"/>

                        </div>
                      </div>   
                          
                      </form>
                      </div>
                      
                    </div>
                </div>                 
                 <!-- End SmartWizard Content -->
                    
                    
                    
                      
  
 <div class="modal fade" id="newClientCategory" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">New Client Category</h4>
        </div>
        <div class="modal-body">
           <div class="panel-body">
                 <form id="demo-form2" name="myform" data-parsley-validate class="form-horizontal form-label-left">
                
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="document_name">Name <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="text" id="namecategory" name="document_name" required="required" class="form-control col-md-7 col-xs-12">
                        </div>
                      </div>  
                    
          
                                                                           
                     <div class="form-group"  >
                        <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                          <button class="btn btn-danger" type="button">Cancel</button>
                          <input id="btncat" onclick="submitClientCategory()" type="button" value="Submit" class="btn btn-success pull-righ"/>

                        </div>
                      </div>

                    </form>
                    </div>
                </div>
        
      </div>
      
    </div>
  </div>
  
          </div>
        </div>
       
     
    </div>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
 <script>
    $(document).ready(function() {
    var max_fields      = 4; //maximum input boxes allowed
    var wrapper         = $(".input_fields_wrap"); //Fields wrapper
    var add_button      = $(".add_field_button"); //Add button ID   
    var x = 1; //initlal text box count
    $(add_button).click(function(e){ //on add input button click
        e.preventDefault();
        if(x < max_fields){ //max input box allowed
            x++; //text box increment
            $(wrapper).append('<div><input name="contact" type="text" onkeyup="update()" class="form-control col-md-10" required="required"/>\
			 <input type="hidden">\
		<a href="#" class="remove_field">Remove</a></div>'); //add form
        }
    });
   
    $(wrapper).on("click",".remove_field", function(e){ //user click on remove text
        e.preventDefault(); $(this).parent('div').remove(); x--;
        $(document).ready(function() {update();});
    })
    
});

 </script>
 <script>
    $(document).ready(function() {
    var max_field      = 2; //maximum input boxes allowed
    var wrapper1         = $(".input_fields_wrap1"); //Fields wrapper
    var add_button1      = $(".add_field_button1"); //Add button ID
   
    var x = 1; //initlal text box count
    $(add_button1).click(function(e){ //on add input button click
        e.preventDefault();
        if(x < max_field){ //max input box allowed
            x++; //text box increment
            $(wrapper1).append('<div><input name="contact" type="text" onkeyup="update()" class="form-control col-md-10" required="required"/>\
			 <input type="hidden">\
		<a href="#" class="remove_field">Remove</a></div>'); //add form
        }
    });
   
    $(wrapper1).on("click",".remove_field", function(e){ //user click on remove text
        e.preventDefault(); $(this).parent('div').remove(); x--;
        $(document).ready(function() {update();});
    })
    
});

 </script>
 
 <!-- Google Analytics -->
<script>
(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
})(window,document,'script','../../../www.google-analytics.com/analytics.js','ga');

ga('create', 'UA-23581568-13', 'auto');
ga('send', 'pageview');


function saveClient()
{
var submitcl = document.getElementById("submitonscl");
var namecl = document.getElementById("nameid").value;
var tinnumbercl = document.getElementById("tinnumberid").value;
var categorycl = document.getElementById("categoryid").value;
var countrycl = document.getElementById("countryid").value;
var citycl = document.getElementById("cityid").value;
var adressecl=document.getElementById("adresseid").value;
var poboxcl = document.getElementById("poboxid").value;
var contactcl=document.getElementById("contactid").value;
var emailcl = document.getElementById("emailid").value;
var websitecl=document.getElementById("websiteid").value;
var banknacl = document.getElementById("banknameid").value;
var bankaccountcl = document.getElementById("bankaccountid").value;
var bankaccountholdercl = document.getElementById("bankaccountholderid").value;


// Returns successful data submission message when the entered information is stored in database.
var clientDataString = 'submitcl1='+submitcl + '&namecl1='+ namecl+ '&tinnumbercl1=' + tinnumbercl + '&categorycl1=' + categorycl + '&countrycl1=' + countrycl + '&citycl1=' + citycl + '&adressecl1=' + adressecl + '&poboxcl1=' + poboxcl + '&contactcl1=' + contactcl + '&emailcl1=' + emailcl+ '&websitecl1=' + websitecl  + '&banknacl1=' + banknacl + '&bankaccountcl1=' + bankaccountcl + '&bankaccountholdercl1=' + bankaccountholdercl;
 
if (namecl == '' || tinnumbercl == ''|| categorycl=='[ Select ]'|| countrycl =='[ Select ]'||citycl == '' ||adressecl  =='' ||poboxcl =='' || contactcl == '' || emailcl == '' || websitecl ==''||banknacl ==''||bankaccountcl ==''||bankaccountholdercl =='' ) {
    alert("All the fields have to be filled");
    //document.write(tenderDataString);
    //console.error(submitcomment);

}
else
{
// AJAX code to submit form.
$.ajax({
type: "post",
url: "class/clientcontrolor.jsp",
data: clientDataString,
async:false,
success: function(html) {
alert("well saved");
}
});
//console.error();
}
return false;
}

function submitClientCategory()
{
    var name = document.getElementById("namecategory").value;
    var btnclient = document.getElementById("btncat").value;
    var clientCategoryData = 'name1='+name + '&btnclientcat1='+ btnclient;
 
    if(name == '')
    {
        alert("All the fields have to be filled");
    }
    else
    {
        
        $.ajax({
        type: "post",
        url: "class/clientcontrolor.jsp",
        data: clientCategoryData,
        async:false,
        success: function(html) {
        alert("well saved");
        }
        });
        
    }
    
}

</script>
</body>
</html>

 