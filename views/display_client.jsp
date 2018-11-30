<%-- 
    Document   : display_client
    Created on : Nov 1, 2018, 10:18:01 PM
    Author     : zawadi
--%>
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
      
      
            <h4 class="panel-title" id="headingOne"class="panel-heading" role="tab" aria-expanded="true" aria-controls="collapseOne" > Clients</h4>
     
       
        
    <div class="table-responsive">
             <table id="datatable" class="table table-striped jambo_table bulk_action">
                <thead>
                  <tr class="headings">
                  
                    <th class="column-title">Name</th>
                    <th class="column-title">Number</th>
                    <th class="column-title">Country</th>
                    <th class="column-title">City</th>
                    <th class="column-title">Adress</th>
                    <th class="column-title">PoBox</th>
                    <th class="column-title">Contact</th>
                    <th class="column-title">Email</th>
                    <th class="column-title no-link last"><span class="nobr">Action</span>
                    </th>
                    <th class="bulk-actions" colspan="7">
                      <a class="antoo" style="color:#fff; font-weight:500;">Bulk Actions ( <span class="action-cnt"> </span> ) <i class="fa fa-chevron-down"></i></a>
                    </th>
                  </tr>
                </thead>

                <tbody>
                    <%
    
                        String nameV = "";
    PreparedStatement p = conn.prepareStatement("select * from tendermis_client");
		ResultSet r=p.executeQuery();
		while(r.next()){
                    
                
                   
                  %>
                  
                  <tr class="even pointer"><td><%=r.getString(2) %></td><td><%=r.getString(3) %></td><td><%=r.getString(5) %></td><td><%=r.getString(6) %></td><td><%=r.getString(7) %></td><td><%=r.getString(8) %></td><td><%=r.getString(9) %></td><td><%=r.getString(10) %></td><td class=" last"><input id="submitonsprepare" onclick="del(<%=r.getInt(1)%>)" type="button" value="Delete" class="btn btn-success pull-right" /><input id="submitonsprepare" onclick="update(<%=r.getInt(1)%>)" type="button" value="Update" class="btn btn-success pull-right" /></td></tr>
                  </tbody>
                  
        <%
    }
    %>
                    </table>
                      
              </div>
        </div>
        
                 
   



       </body>
</html>
</script>
<%
conn.close();
%>