<%-- 
    Document   : search
    Created on : 14-Oct-2019, 09:45:30
    Author     : Stephen
--%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html> tag <%@ taglib uri="http://java.sun.com/jsp/jstl/core"prefix="c"%> 
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
                    <li class="menuitem"><a href="login.jsp">Login</a></li>
                    <li class="menuitem"><a href="sitemap.jsp">Site Map</a></li>
                    <li class="menuitem"><a href="search.jsp">Search</a></li>
                </ul>
            </div>
            <div id ="content">
                <form id="form1" name="form1" method="GET" action="search.jsp">
			    	<label>Please Enter Keyword:
					<input  type="text" name="keyword"/>
		        </label>
				<br>
				<input type="submit" name="action" value="Search"/>
			</form>
                <br/>
                    <%  
			String searchedName = request.getParameter("keyword");
			if (searchedName != null)
                            
			{
			//code for searching pages related to the given keyword goes here..
                    %>
                        Search Results for <c:out value="<%=searchedName%>" />
                               
                                <br/>...
                                <br/>...
                    <%
			//Show result pages
                        
			}
                    %>
            </div>
    </body>
</html>
