<%@ Page Language="C#" %>

<%
    System.IO.StreamWriter outfile=new System.IO.StreamWriter(@"c:\inetpub\wwwroot\mk2993\Newpizza.txt",true);

    string confirmmsg="";
    string errmsg="";
    bool errflag=false;

    /*
    var name=Request.getElementById("name").value;
    var phone=Request.getElementById("phone").value;
    var address=Request.getElementById("address").value;
    var city=Request.getElementById("city").value;
    var zip=Request.getElementById("zip").value;
    */

    //checks name
    if(Request.Form["txtname"]==""){
        errmsg = errmsg + "Enter a name<br/>";
        //name.style.borderColor="red";
        errflag=true;
    }else{
        confirmmsg=confirmmsg+"Name: "+Request.Form["txtname"]+"<br/>";
    }
    
    //checks phone
    if(Request.Form["txtphone"]==""){
        errmsg = errmsg + "Enter a phone number<br/>";
        //Request.getElementById("phone").style.borderColor="red";
        errflag=true;
    }else{
        confirmmsg=confirmmsg+"Phone: "+Request.Form["txtphone"]+"<br/>";
    }
    //checks address
    if(Request.Form["txtaddress"]==""){
        errmsg = errmsg + "Enter an address<br/>";
        errflag=true;
    }else{
        confirmmsg=confirmmsg+"Address: "+Request.Form["txtaddress"]+"<br/>";
    }
    //checks city
    if(Request.Form["txtcity"]==""){
        errmsg = errmsg + "Enter a city<br/>";
        errflag=true;
    }else{
        confirmmsg=confirmmsg+"City: "+Request.Form["txtcity"]+"<br/>";
    }
    //checks zip
    if(Request.Form["txtzip"]==""){
        errmsg = errmsg + "Enter a zip<br/>";
        errflag=true;
    }else{
        confirmmsg=confirmmsg+"Zip: "+Request.Form["txtzip"]+"<br/>";
    }
    

    //check if pizza size is selected
    
    if(Request.Form["radio"]=="small"){
        confirmmsg=confirmmsg+"You chose a small sized pizza"+"<br/>";
        var total=5.00;
        if(Request.Form["cheese"]=="cheese"){
            total=total+1.00;
            confirmmsg=confirmmsg+"You selected the topping: Extra Cheese"+"<br/>";
        }
        if(Request.Form["sausage"]=="sausage"){
            total=total+1.00;
            confirmmsg=confirmmsg+"You selected the topping: Sausage"+"<br/>";
        }
        if(Request.Form["pepperoni"]=="pepperoni"){
            total=total+1.00;
            confirmmsg=confirmmsg+"You selected the topping: Pepperoni"+"<br/>";
        }
        if(Request.Form["mushroom"]=="mushroom"){
            total=total+1.00;
            confirmmsg=confirmmsg+"You selected the topping: Mushroom"+"<br/>";
        }
        string ctotal = total.ToString("N2");
        confirmmsg = confirmmsg + "Total: $" + ctotal;
    }else
    if(Request.Form["radio"]=="medium"){
            confirmmsg=confirmmsg+"You chose a medium sized pizza"+"<br/>";
            var total=7.50;
        if(Request.Form["cheese"]=="cheese"){
            total=total+1.00;
            confirmmsg=confirmmsg+"You selected the topping: Extra Cheese"+"<br/>";
        }
        if(Request.Form["sausage"]=="sausage"){
            total=total+1.00;
            confirmmsg=confirmmsg+"You selected the topping: Sausage"+"<br/>";
        }
        if(Request.Form["pepperoni"]=="pepperoni"){
            total=total+1.00;
            confirmmsg=confirmmsg+"You selected the topping: Pepperoni"+"<br/>";
        }
        if(Request.Form["mushroom"]=="mushroom"){
            total=total+1.00;
            confirmmsg=confirmmsg+"You selected the topping: Mushroom"+"<br/>";
        }
        string ctotal = total.ToString("N2");
        confirmmsg = confirmmsg + "Total: $" + ctotal;
                            }else
     if(Request.Form["radio"]=="large"){
            confirmmsg=confirmmsg+"You chose a large sized pizza"+"<br/>";
            var total=10.00;
        if(Request.Form["cheese"]=="cheese"){
            total=total+1.00;
            confirmmsg=confirmmsg+"You selected the topping: Extra Cheese"+"<br/>";
        }
        if(Request.Form["sausage"]=="sausage"){
            total=total+1.00;
            confirmmsg=confirmmsg+"You selected the topping: Sausage"+"<br/>";
        }
        if(Request.Form["pepperoni"]=="pepperoni"){
            total=total+1.00;
            confirmmsg=confirmmsg+"You selected the topping: Pepperoni"+"<br/>";
        }
        if(Request.Form["mushroom"]=="mushroom"){
            total=total+1.00;
            confirmmsg=confirmmsg+"You selected the topping: Mushroom"+"<br/>";
        }
        string ctotal = total.ToString("N2");
        confirmmsg = confirmmsg + "Total: $" + ctotal;
        
      }else{
        errmsg=errmsg+"You forgot to select a pizza size";
        //MessageBox.Show("Select a pizza size");
        errflag=true;
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
        outfile.WriteLine("City: " + Request.Form["txtcity"]);
        outfile.WriteLine("Zip: " + Request.Form["txtzip"]);
        outfile.WriteLine("Pizza Size: " + Request.Form["radio"]);
        outfile.WriteLine("Toppings: " + Request.Form["pepperoni"]+" "+Request.Form["cheese"]+" "+Request.Form["mushroom"]+" "+Request.Form["sausage"]);
        outfile.Close();
        }
%>