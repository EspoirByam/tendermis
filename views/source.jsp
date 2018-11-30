<%-- 
    Document   : source
    Created on : Nov 1, 2018, 4:03:12 PM
    Author     : zawadi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <script src="../js/jquery-2.1.3.min.js" type="text/javascript"></script>
        <script src="../js/Script1.js" type="text/javascript"></script>
        <script>
//              var itemid = $(this, 'option:selected').val();
                try {
                    $.post('jsp_handler.jsp', function (data) {
                        alert('Returned: ' + data);
                    });
                } catch (err) {
                    alert(err);
                }
         </script>
    </body>
</html>
