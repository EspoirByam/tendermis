<%-- 
    Document   : essaie
    Created on : Oct 14, 2018, 3:09:49 PM
    Author     : zawadi
--%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="core.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>zawadi</title>
    </head>
    <body>
        
        <%
            String J = "News Letter";
            String NJ = "Umucyo";
            
            db con= new db();
            
            Map Data=null;
            String table = "tendermis_tender_issue";

            Data =  new HashMap();
            
                
             Data.put("name",J);
           
       

if (con.insert(table, Data))
{
    out.print("well done ");
}
else out.print(" Operation Failed  ");
            
        
        %>    </body>
</html>
