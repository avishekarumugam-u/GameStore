<%-- 
    Document   : process
    Created on : Jan 1, 2026, 9:47:42 PM
    Author     : avish
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            try {
            /* TODO output your page here. You may use following sample code. */
        String username=(String)request.getParameter("username");
        String userpassword=(String)request.getParameter("password");
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/userdb","root","avi@2004");
        String query="select * from userlogin where username='"+username+"' and userpassword='"+userpassword+"';";
        Statement stmt=conn.createStatement();
        ResultSet rs=stmt.executeQuery(query);
        if(rs.next())
        {
            conn.close();
            response.sendRedirect("admin.jsp"); 
        }
        else
        {
            out.println("INVALID USER <a href='index.jsp'>Click to Back");
        }
        }
        catch(ClassNotFoundException ex)
                {
                    out.println(ex.getMessage());
                }
        catch(SQLException ex)
        {
            out.println(ex.getMessage());
        
        }
                    %>
    </body>
</html>

