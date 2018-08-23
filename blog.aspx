<%@ Page language="C#" %>
<%
    string blogtxt = Request.Form["blogtxt"];
    string email = Request.Form["email"];
    string title = Request.Form["title"];
    DateTime localDate = DateTime.Now;
    Guid guid = Guid.NewGuid();
    string guidStr = guid.ToString();
    string ip = (HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"]);
    string confirmmsg = "";
    bool errflag = true;
    string errmsg = "";
    if (email == "")
    {
        errflag = true;
        errmsg = errmsg + "Please enter an email <br>";
    } else
    {
        errflag = false;
        confirmmsg = confirmmsg + "Email: " + email + "<br>";
    }
    if (blogtxt == "")
    {
        errflag = true;
        errmsg = errmsg + "Please enter a body";
    } else
    {
        errflag = false;
        confirmmsg = confirmmsg + "Body: " + blogtxt + "<br>";
    }
    if (errmsg != "")
    {
        Response.Write(errmsg);
        Response.Write("<br>");
        Response.Write("<br><button onclick='window.history.back();'>Return</button>");
    } else
    {
        using (System.IO.StreamWriter file =
        new System.IO.StreamWriter(@"C:\inetpub\wwwroot\mk2993\blog.html", true))
    {
        file.WriteLine("<div class='post' id='" + guidStr + "'>");
        file.WriteLine("<p>" +"Title: "+"<br>"+ title + "</p>");
        file.WriteLine("<p>" +"Message"+"<br>"+ blogtxt + "</p>");
        file.WriteLine("<p><small>" + "Posted by: " + email + "</small><br>");
        file.WriteLine("<small>" + localDate + "</small></p>");
        file.WriteLine("<small>" + "Posted from: " + ip + "</small></p>");
        file.WriteLine("</div>");
        Response.Redirect("http://157.160.104.106/mk2993/blog.html");
    };
    }
%>