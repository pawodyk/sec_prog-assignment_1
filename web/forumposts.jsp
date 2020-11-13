<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="dbconnection.DBConnect"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="stylesheet" type="text/css" href="style.css" />
        <title>We Love Trump!</title>
    </head>

    <body>
        <div id="container">
            <div id="mainpic">         
            </div>   

            <div id="menu">
                <ul>
                    <li class="menuitem"><a href="index.jsp">Home</a></li>
                    <li class="menuitem"><a href="quotes.jsp">Quotes</a></li>
                    <li class="menuitem"><a href="news.jsp">News</a></li>
                    <li class="menuitem"><a href="profile.jsp?id=<% if (session.getAttribute("userid") != null) {
                            out.print(session.getAttribute("userid"));
                        } %>">Profile</a></li>
                    <li class="menuitem"><a href="forum.jsp">Members Forum</a></li>
                    <li class="menuitem"><a href="ValidateLogout">Logout</a></li>
                </ul>
            </div>

            <div id="content">
                <%
                    try {
                        Connection con = new DBConnect().connect(getServletContext().getRealPath("/WEB-INF/config.properties"));

                        String postid = request.getParameter("postid");
                        if (postid != null) {
                            Statement stmt = con.createStatement();
                            ResultSet rs = null;
                            rs = stmt.executeQuery("select * from posts where id=" + postid);
                            if (rs != null && rs.next()) {
                                out.print("<b style='font-size:22px'>Title:" + rs.getString("title") + "</b>");
                                out.print("<br/>-  Posted By " + rs.getString("user"));
                                String postContent = rs.getString("content");
                                out.print("<br/><br/>Content:<br/>" + postContent.replaceAll("<", "&lt;").replaceAll(">", "&gt;"));

                            }
                        } else {
                            out.print("ID Parameter is Missing");
                        }
                    } catch (SQLException ex) {
                        // loges the message in the server console and redirects user to Error Page
                        System.out.println("An error occured in the forumpost.jsp" + ex.toString()); 
                        response.sendRedirect("Error.jsp");
                    }

                    out.print("<br/><br/><a href='forum.jsp'>Return to Forum &gt;&gt;</a>");
                %>
                <p>&nbsp;</p>
                <p>&nbsp;</p>
                <p>&nbsp;</p>
                <div id="footer"><h3><a href="http://www.trump.com/">Trump Web Design</a></h3></div>
            </div>
        </div>



    </body>
</html>

