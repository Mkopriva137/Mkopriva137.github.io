<%@ Page Language="C#" %>
<% 
    System.IO.StreamWriter outfile=new System.IO.StreamWriter(@"c:\inetpub\wwwroot\mk2993\Regdata.txt",true);

    bool errflag=false;
    string errmsg="";
    string confirmmsg="";

    //checks first name
    if(Request.Form["txtfirstname"]=="")
    {
        errflag=true;
        errmsg=errmsg+"Missing First Name<br/>";
    }
    else
    {
        confirmmsg=confirmmsg+"First Name:"+Request.Form["txtfirstname"]+"<br/>";
    }

    //checks last name
    if(Request.Form["txtlastname"]=="")
    {
        errflag=true;
        errmsg=errmsg+"Missing Last Name<br/>";
    }
    else
    {
        confirmmsg=confirmmsg+"Last Name:"+Request.Form["txtlastname"]+"<br/>";
    }

    //checks address
    if(Request.Form["txtaddress"]=="")
    {
        errflag=true;
        errmsg=errmsg+"Missing Address<br/>";
    }
    else
    {
        confirmmsg=confirmmsg+"Address:"+Request.Form["txtaddress"]+"<br/>";
    }

    //checks city
    if(Request.Form["txtcity"]=="")
    {
        errflag=true;
        errmsg=errmsg+"Missing City<br/>";
    }
    else
    {
        confirmmsg=confirmmsg+"City:"+Request.Form["txtcity"]+"<br/>";
    }

    //checks state
    if(Request.Form["txtstate"]=="")
    {
        errflag=true;
        errmsg=errmsg+"Missing State<br/>";
    }
    else
    {
        confirmmsg=confirmmsg+"State:"+Request.Form["txtstate"]+"<br/>";
    }

    //checks zip
    if(Request.Form["txtzip"]=="")
    {
        errflag=true;
        errmsg=errmsg+"Missing Zip<br/>";
    }
    else
    {
        confirmmsg=confirmmsg+"Zip:"+Request.Form["txtzip"]+"<br/>";
    }

    //checks country
    if(Request.Form["txtcountry"]=="")
    {
        errflag=true;
        errmsg=errmsg+"Missing Country<br/>";
    }
    else
    {
        confirmmsg=confirmmsg+"Country:"+Request.Form["txtcountry"]+"<br/>";
    }

    //checks date
    if(Request.Form["txtdate"]==""){
        errflag=true;
        errmsg=errmsg+"Missing Date<br/>";
    }
    else{
        confirmmsg=confirmmsg+"Date:"+Request.Form["txtdate"]+"<br/>";
    }
    //checks radio buttons
    
    if(Request.Form["rdrate"]=="1" || Request.Form["rdrate"]=="2" || Request.Form["rdrate"]=="3" ||
       Request.Form["rdrate"]=="4" || Request.Form["rdrate"]=="5" ){

        confirmmsg=confirmmsg+"You gave us a rating of: "+Request.Form["rdrate"]+"<br/>";
    }
    else{
        errflag=true;
        errmsg=errmsg+"Please rate us<br/>";
    }
    
    //checks check boxes
    if(Request.Form["chkjet"]=="jet" || Request.Form["chkairplane"]=="airplane" || Request.Form["chkhelicopter"]=="helicopter")
    {
    }else
    {
        errflag = true;
        errmsg = errmsg + "Select your favorite type(s) of aircraft";
    }
    

    if (errflag == true)
    {
        Response.Write("<b>Error</b><br/><br/>");
        Response.Write(errmsg);
        outfile.WriteLine("Error: Invalid Input");
        outfile.WriteLine("Date:" + DateTime.Now);
        outfile.Close();
    }
    else
    {
        Response.Write("<b>Registration Complete</b><br/><br/>Thank You!<br/><br/>" + confirmmsg);
        outfile.WriteLine("----------------------------");
        outfile.WriteLine("Date:" + DateTime.Now);
        outfile.WriteLine("First Name: " + Request.Form["txtfirstname"]);
        outfile.WriteLine("Last Name: " + Request.Form["txtlastname"]);
        outfile.WriteLine("Address: " + Request.Form["txtaddress"]);
        outfile.WriteLine("City: " + Request.Form["txtcity"]);
        outfile.WriteLine("State: " + Request.Form["txtstate"]);
        outfile.WriteLine("Zip: " + Request.Form["txtzip"]);
        outfile.WriteLine("Country: " + Request.Form["txtcountry"]);
        outfile.WriteLine("Date: " + Request.Form["txtdate"]);
        outfile.WriteLine("Rating: " + Request.Form["rdrate"]);
        outfile.Close();
    }
%>