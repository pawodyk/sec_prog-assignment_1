<% response.addHeader("X-Frame-Options", "DENY"); %>
<% response.addHeader("X-XSS-Protection", "1"); %>

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
                    <li class="menuitem"><a href="login.jsp">Login</a></li>
                    <li class="menuitem"><a href="sitemap.jsp">Site Map</a></li>
                    <li class="menuitem"><a href="search.jsp">Search</a></li>
                </ul>
            </div>

            <div id="content">

                <h1>Login Error!</h1>
                <p>Incorrect login or password</p>
                <p><a href="login.jsp"  type="button" >TRY AGAIN</a></p>
                <br>

                <div id="footer"><h3><a href="http://www.trump.com/">Trump Web Design</a></h3></div>
            </div>
        </div>
    </body>
</html>


