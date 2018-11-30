<%-- 
    Document   : display_table
    Created on : Oct 23, 2018, 11:36:55 AM
    Author     : zawadi
--%>
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
      
      
            <h4 class="panel-title" id="headingOne"class="panel-heading" role="tab" aria-expanded="true" aria-controls="collapseOne" > Documents</h4>
     
       
        
    <div class="table-responsive">
             <table id="datatable" class="table table-striped jambo_table bulk_action">
                <thead>
                  <tr class="headings">
                  
                    <th class="column-title">Name</th>
                    <th class="column-title">Authentification</th>
                    <th class="column-title">Validity</th>
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
    PreparedStatement p = conn.prepareStatement("select * from tendermis_document");
		ResultSet r=p.executeQuery();
		while(r.next()){
                    
                int idCon=r.getInt(5);
    PreparedStatement prepo = conn.prepareStatement("select name from tendermis_document_validity where id ='"+idCon+"'");
    ResultSet okok = prepo.executeQuery();
    while(okok.next())
    {
        nameV=okok.getString(1);
    }
                   
                  %>
                  
                  <tr class="even pointer"><td><%=r.getString(2) %></td><td><%=r.getString(4) %></td><td><%=nameV+" from "+r.getString(3) %></td><td class=" last"><input id="submitonsdelete" onclick="del(<%=r.getInt(1)%>)" type="button" value="Delete" class="btn btn-success pull-right" /><input id="submitonsprepare" onclick="update(<%=r.getInt(1)%>)" type="button" value="Update" class="btn btn-success pull-right" /></td></tr>
                  </tbody>
                  
        <%
    }
    %>
                    </table>
                      
              </div>
        </div>
        
                    <script>
                        function del(id)
{
    if(confirm("Do you really want to delete this component?")){
    var btndelete = document.getElementById("submitonsdelete").value;
    var deleteDataString = 'id1='+id+'&btdelete1='+btndelete;
    
    if(id=='')
    {
        alert("the component dosen't exist");
    }
    else
    {
       $.ajax({
        type: "post",
        url: "class/documentcontrolor.jsp",
        data: deleteDataString,
        async:false,
        success: function(html) {
        alert("well deleted");
        document.forms[0].action="index.jsp?request=display_doc";
        document.forms[0].method = "post";
        document.forms[0].submit();
        }
        }); 
    }
    }
}
                    </script>             
   



       </body>
</html>
<%
conn.close();
%>