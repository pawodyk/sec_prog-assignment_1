<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.SQLException"%>

<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.sql.ResultSet"%>
<%@ page import="java.util.*,java.io.*"%>
<%@ page import="dbconnection.DBConnect"%>

<% response.addHeader("X-Frame-Options", "DENY"); %>

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
                        }%>">Profile</a></li>
                    <li class="menuitem"><a href="forum.jsp">Members Forum</a></li>
                    <li class="menuitem"><a href="ValidateLogout">Logout</a></li>
                </ul>
            </div>

            <div id="content">
                <h1>Profile for <%=session.getAttribute("user")%></h1>
                <p>&nbsp;</p>
                <p>&nbsp;</p>
                <%
                    if (session.getAttribute("isLoggedIn") != null) {
                        Connection con = new DBConnect().connect(getServletContext().getRealPath("/WEB-INF/config.properties"));

                        String id = request.getParameter("id");
                        if (id != null && !id.equals("") && id.equals(session.getAttribute("userid"))) {
                            try {
                                Statement stmt = con.createStatement();
                                ResultSet rs = null;
                                rs = stmt.executeQuery("select * from users where id=" + id);
                                if (rs != null && rs.next()) {
                                    out.print("UserName : " + rs.getString("username") + "<br>");
                                    out.print("Email : " + rs.getString("email") + "<br>");
                                    out.print("About : " + rs.getString("about") + "<br>");

                                    //Getting Card Details:
                                    ResultSet rs1 = stmt.executeQuery("select * from carddetail where id=" + id);
                                    if (rs1 != null && rs1.next()) {
                                        out.print("<br/>-------------------<br/>Card Details:<br/>-------------------<br/>");
                                        String cardNo = rs1.getString("cardno");
                                        out.print("Card Number: xxx - " + cardNo.substring(cardNo.length()-4, cardNo.length()) + "<br/>");
                                        //out.print("CVV: " + rs1.getString("cvv") + "<br/>");
                                        out.print("Expiry Date: " + rs1.getString("expiry") + "<br/>");
                                    }

                                }

                            } catch (Exception e) {
                                response.sendRedirect("Error.jsp");
                            }
                            con.close();
                        } 
//                        else {
//                            //out.print("ID Parameter is Missing");
//                            response.sendRedirect("profile.jsp?id=" + session.getAttribute("userid")); // redirects user back to his page
//                        }

                    } else {
                        //out.print("Please login to see Your Profile");
                        response.sendRedirect("login.jsp"); // no access to profile area, sent back to the login page
                    }

                %>

                <div id="footer"><h3><a href="http://www.trump.com/">Trump Web Design</a></h3></div>
            </div>
        </div>



    </body>
</html>
