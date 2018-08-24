<%@ Page Language="C#" %>
<%
    System.IO.StreamWriter outfile=new System.IO.StreamWriter(@"c:\inetpub\wwwroot\mk2993\Neworder.txt",true);
    string confirmmsg="";
    string errmsg="";
    bool errflag=false;
    //checks name
    if(Request.Form["txtname"]==""){
        errmsg = errmsg + "Enter a name<br/>";
        //name.style.borderColor="red";
        errflag=true;
    }else{
        confirmmsg=confirmmsg+"Name: "+Request.Form["txtname"]+"<br/>";
    }
    //checks address
    if(Request.Form["txtaddress"]==""){
        errmsg = errmsg + "Enter an address<br/>";
        errflag=true;
    }else{
        confirmmsg=confirmmsg+"Address: "+Request.Form["txtaddress"]+"<br/>";
    }
      if(errflag==true){
        Response.Write("<b>Error</b><br/><br/>");
        Response.Write(errmsg);
        outfile.WriteLine("Error: Invalid Input");
        outfile.WriteLine("Date:" + DateTime.Now);
        outfile.Close();
        //alert("Missing inFormation");
      }else{
        Response.Write("<center><b>Order Placed!</b><br/><br/>"+confirmmsg+"</center>");
        outfile.WriteLine("----------------------------");
        outfile.WriteLine("Date:" + DateTime.Now);
        outfile.WriteLine("Name: " + Request.Form["txtname"]);
        outfile.WriteLine("Address: " + Request.Form["txtaddress"]);
        outfile.WriteLine("Total: " + Convert.ToString(Session["totalPrice"]));
        outfile.Close();
        }
%>