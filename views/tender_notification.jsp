 <!-- page content -->
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.*"%>
<%@page import="core.*" %>

<%
        db d = new db();
        d.connection();
        Connection conn = d.getcon();
    
    %>
    <div class="right_col" role="main">
      
        <a class="panel-heading" role="tab" id="headingOne" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
            <h4 class="panel-title"><span class="fa fa-plus-circle"/> New Notification</h4>
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
                               
                                PreparedStatement ps = conn.prepareStatement("select id, name from tendermis_tender");
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
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="competitor">Competitor <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <select class="form-control" name="competitor_name" id="competitorid">
                              <option disabled>[ Select ]</option>
                              <option data-toggle="modal" data-target="#newCompetitor">New Competitor</option>
                              <%
                               
                                PreparedStatement pt = conn.prepareStatement("select id, name from tendermis_bidder");
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
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="price_tax">Price & Tax <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="number" id="pricetaxid" name="price_tax" required="required" class="form-control col-md-7 col-xs-12">
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
                     
                     <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="score">Score <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input id="scoreid" type="number" name="score" class="form-control col-md-7 col-xs-12">    
                        </div>                       
                      </div>  
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="rank">Rank <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input id="rankid" type="number" name="rank" class="form-control col-md-7 col-xs-12">    
                        </div>                       
                      </div> 
                     <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="notification_date">Notification Date <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input id="notifid" type="date" name="notification_date" class="form-control col-md-7 col-xs-12">    
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
                  
                    <th class="column-title">Tender</th>
                    <th class="column-title">Bidder</th>
                    <th class="column-title">Price With Tax </th>
                    <th class="column-title">Rank</th>
                    <th class="column-title">Score</th>
                    <th class="column-title">Notification date</th>
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
                      String tender_name="";
    
                      PreparedStatement p = conn.prepareStatement("select * from tendermis_not_award_info");
                      ResultSet r=p.executeQuery();
                      while(r.next()){
                      int id = r.getInt(2);
                   
                      String query = "select name from tendermis_bidder where id='"+id+"'";
                      PreparedStatement prep = conn.prepareStatement(query);
                      ResultSet rrr= prep.executeQuery();
                
                while(rrr.next()){
                    name = rrr.getString(1);
                }
                 
                int tender_id = r.getInt(3);
                String req = "select name from tendermis_tender where id='"+tender_id+"'";
                PreparedStatement pp = conn.prepareStatement(req);
                ResultSet resu= pp.executeQuery();
                
                while(resu.next()){
                    tender_name = resu.getString(1);
                }
                  %> 
                  <tr class="even pointer"><td><%=tender_name %></td><td><%=name%></td><td><%=r.getInt(8) %></td><td><%=r.getInt(6) %></td><td><%=r.getInt(5) %></td><td><%=r.getString(4) %></td><td class=" last"><input id="submitonsdelete" onclick="del(<%=r.getInt(1)%>)" type="button" value="Delete" class="btn btn-success pull-right" /><input data-toggle="modal" data-target="#updateNotification_<%=r.getInt(1) %>" name="essaiedoc" type="button" value="Update" class="btn btn-success pull-right" /></td></tr> 
                    

<div class="modal fade" id="updateNotification_<%=r.getInt(1)%>" role="dialog">
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
                              <option value="<%=tender_id %>"><%=tender_name %></option>
                                <%
                               
                                PreparedStatement pour = conn.prepareStatement("select id, name from tendermis_tender");
                                        ResultSet rous=pour.executeQuery();
                                            while(rous.next()){
                            
                                %>
                                <option value="<%=rous.getInt(1) %>"><%=rous.getString(2) %></option>
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
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="competitor">Competitor <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <select class="form-control" name="competitor_name" id="upcompetitorid">
                              <option value="<%=id %>"><%=name %></option>
                              <option data-toggle="modal" data-target="#newCompetitor">New Competitor</option>
                              <%
                               
                                PreparedStatement pett = conn.prepareStatement("select id, name from tendermis_bidder");
                                        ResultSet rett=pett.executeQuery();
                                            while(rett.next()){
                            
                            %>
                            <option value="<%=rett.getInt(1) %>"><%=rett.getString(2) %></option>
                            <%
                              }
                            %>         
                            </select>
                        </div>
                      </div><br/><br/>
                     <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="price_tax">Price & Tax <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input type="number" id="uppricetaxid" name="price_tax" required="required" value="<%=r.getInt(8) %>" class="form-control col-md-7 col-xs-12">
                        </div>
                      </div><br/><br/>
                    <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="tender_name">Award Status <span class="required">*</span>
                        </label>
                        <div class="col-md-3 col-sm-3 col-xs-12">
                            <label><input type="radio" name="upaward_status" required="required" value="yes" checked="true">Yes</label>
                        </div>  
                         <div class="col-md-3 col-sm-3 col-xs-12">
                             <label><input type="radio" name="upaward_status" required="required" value="no">No</label>
                        </div>  
                      </div><br/><br/>
                     
                     <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="score">Score <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input id="upscoreid" type="number" name="score" value="<%=r.getInt(5) %>" class="form-control col-md-7 col-xs-12">    
                        </div>                       
                      </div><br/><br/>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="rank">Rank <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input id="uprankid" type="number" name="rank" value="<%=r.getInt(6) %>" class="form-control col-md-7 col-xs-12">    
                        </div>                       
                      </div><br/><br/>
                     <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="notification_date">Notification Date <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input id="upnotifid" type="date" name="notification_date" value="<%=r.getString(4) %>" class="form-control col-md-7 col-xs-12">    
                        </div>                       
                      </div><br/><br/><br/> 
                 
                     <div class="form-group"  >
                        <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                          <button class="btn btn-danger" type="button">Cancel</button>
						       
                          <input id="upsubmitons" onclick="updateNotif(<%=r.getInt(1) %>)" type="button" value="Submit" class="btn btn-success pull-right"/>

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


 
 <!-- Modal -->
  <div class="modal fade" id="newCompetitor" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">New Competitor</h4>
        </div>
        <div class="modal-body">
           <div class="panel-body">
                 <form id="demo-form2" name="myform" data-parsley-validate class="form-horizontal form-label-left" method="post" action="./class/biddercontrolor.jsp">
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="competitor_name">Name <span class="required">*</span>
                        </label>
                        <div class="col-md-9 col-sm-9 col-xs-12">
                          <input type="text" id="last-name" name="competitor_name" required="required" class="form-control col-md-7 col-xs-12">
                        </div>
                      </div> 
                     <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="tin_number">TIN Number <span class="required">*</span>
                        </label>
                        <div class="col-md-9 col-sm-9 col-xs-12">
                          <input type="text" id="last-name" name="competitor_number" required="required" class="form-control col-md-7 col-xs-12">
                        </div>
                      </div> 
                      <div class="form-group">
                       <label class="control-label col-md-3 col-sm-3 col-xs-12" for="product">Product <span class="required">*</span>
                        </label>
                        <div class="col-md-9 col-sm-9 col-xs-12">
                          <input type="text" id="first-name" name="product" required="required" class="form-control col-md-10">
                        </div>
                      </div> 
                    <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">HQ Country</label>
                        <div class="col-md-9 col-sm-9 col-xs-12">
                            <select class="form-control" name="country">
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
                          <input type="text" id="first-name" name="city" required="required" class="form-control col-md-10">
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="address">Address <span class="required">*</span>
                        </label>
                        <div class="col-md-9 col-sm-9 col-xs-12">
                          <input type="text" id="first-name" name="address" required="required" class="form-control col-md-10">
                        </div>
                      </div>
                      <div class="form-group">
                       <label class="control-label col-md-3 col-sm-3 col-xs-12" for="po_box">Po.Box <span class="required">*</span>
                        </label>
                        <div class="col-md-9 col-sm-9 col-xs-12">
                          <input type="text" id="first-name" name="po_box" required="required" class="form-control col-md-10">
                        </div>
                      </div>
                      <div class="form-group">
                       <label class="control-label col-md-3 col-sm-3 col-xs-12" for="contact">Contact <span class="required">*</span>
                        </label>
                        <div class="col-md-9 col-sm-9 col-xs-12">                                                                    
                            <input type="text" id="first-name" name="contact" required="required" class="form-control col-md-10">                          
                        </div>
                      </div>
                      <div class="form-group">
                       <label class="control-label col-md-3 col-sm-3 col-xs-12" for="email">Email <span class="required">*</span>
                        </label>
                        <div class="col-md-9 col-sm-9 col-xs-12">                           
                            <input type="text" id="first-name" name="email" required="required" class="form-control col-md-10">                                                        
                        </div>
                      </div>
                      <div class="form-group">
                       <label class="control-label col-md-3 col-sm-3 col-xs-12" for="website">Website <span class="required">*</span>
                        </label>
                        <div class="col-md-9 col-sm-9 col-xs-12">
                          <input type="text" id="first-name" name="website" required="required" class="form-control col-md-10">
                        </div>
                      </div>                                  
                     <div class="form-group"  >
                        <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-3">
                          <button class="btn btn-danger" type="button" data-dismiss="modal">Cancel</button>
						       
                          <input id="submitonsbid" name="btnsubBidder" type="submit" value="Save" class="btn btn-success pull-right"/>

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

   

function ok(){ 
    var tender_id = document.getElementById("tenderSelect").value;
    var bidder = document.getElementById('competitorid').value;
    var priceTax = document.getElementById("pricetaxid").value;
    //var product = document.getElementById("productid").value;
    var score = document.getElementById("scoreid").value;
    var rank = document.getElementById("rankid").value;
    var notif = document.getElementById("notifid").value;
    var btn = document.getElementById("submitons").value;
    
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
var notifDataString ='btn1='+btn+'&tender_id1='+ tender_id+ '&bidder1=' + bidder + '&priceTax1=' + priceTax + '&score1=' + score + '&rank1=' + rank + '&notif1=' + notif+ '&statusfinal1=' + statusfinal;

if (tender_id == '[ Select ]' || priceTax == ''|| bidder =='[ Select ]' || score == '' ||rank==''||notif=='' ||statusfinal==undefined ) {
    
}
else
{
    
// AJAX code to submit form.
$.ajax({
type: "post",
url: "class/notifcontrolor.jsp",
data: notifDataString,
async:false,
success: function(html) {
alert("well saved");
document.forms[0].action = "index.jsp?request=notification";
document.forms[0].method = "post";
document.forms[0].submit();
}
});
//console.error();
}
return false;
}

/* start of tender suppress*/

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
        url: "class/notifcontrolor.jsp",
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

/*start of updating*/
function updateNotif(id)
{
   var id_tender = document.getElementById("uptenderSelect").value;
    var id_bidder = document.getElementById('upcompetitorid').value;
    var upprice = document.getElementById("uppricetaxid").value;
    //var product = document.getElementById("productid").value;
    var upscore = document.getElementById("upscoreid").value;
    var uprank = document.getElementById("uprankid").value;
    var upnotif = document.getElementById("upnotifid").value;
    var upbtn = document.getElementById("upsubmitons").value;
    
    var status = document.getElementsByName('upaward_status');
    var statusLength = status.length;

    for (var i = 0 ; i < statusLength ; i++) 
    {
        if (status[i].type == 'radio' && status[i].checked) 
        {
            var upstatusfinal = status[i].value;
        }

    }
    var updateNotifData ='upbtn1='+upbtn+'&id_tender1='+ id_tender+ '&id_bidder1=' + id_bidder + '&upprice1=' + upprice + '&upscore1=' + upscore + '&uprank1=' + uprank + '&upnotif1=' + upnotif+ '&upstatusfinal1=' + upstatusfinal+'&upid='+id;

    if (id_tender == '[ Select ]' || upprice == ''|| id_bidder =='' || upscore == '' ||uprank==''||upnotif=='' ||upstatusfinal=='undefined' ) {
    alert("All the fields have to be filled");
    }
    
    else
    {
        alert(upstatusfinal);
        $.ajax({
        type: "post",
        url: "class/notifcontrolor.jsp",
        data: updateNotifData,
        async:false,
        success: function(html) {
        alert("well saved");
        }
        }); 
    }
}

</script>
	