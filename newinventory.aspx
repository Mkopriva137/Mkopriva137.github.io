<%@ Page Language="C#" Debug="true"%>
<%@ Import Namespace="System.Data.Odbc"%>
<%
    Response.Write("<html><head><title>Company Inventory in C#</title></head><body>");
    //step1: CREATE ODBC DATABASE CONNECTION, COMMAND, and DATAREADER OBJECTS
    OdbcConnection myconn;
    OdbcCommand mycmd;
    OdbcDataReader myreader;
    //step2: connecting to a physical database using ODBC drivers for .mbd and .accdb files
    myconn = new OdbcConnection(@"DRIVER={Microsoft Access Driver (*.mdb, *.accdb)};DBQ=c:\inetpub\wwwroot\mk2993\inventory.accdb");
    mycmd = new OdbcCommand("Select * from inventory", myconn);

    Response.Write("<b>Data from the Company's Inventory in the Inventory Database: C# Program</b><br>");

    //step3 opening connection object and reader object (cursor in oracle)
    myconn.Open();
    myreader = mycmd.ExecuteReader();

    Response.Write("<center><h1>MK Aviation</h1><br>");
    Response.Write("<a href='company.html'>Back to our Home Page</a>");
    //step4 using a loop to go through the records in the reader (going through the cursor in oracle)
    Response.Write("<Table>");
    Response.Write("<tr><th>Item Number</th> <th>Item Name</th> <th>Item Description</th> <th>Available Quantity</th> <th>Item Price</th> <th>Item Picture</th> <th>Input Quantity</th></tr>");
    Response.Write("<form action=order.aspx method=post>");
    int i = 0;
    //List<string> qty = new List<string>();
    Session["counter"] = i;
    while ((myreader.Read()))
    {
        Response.Write("<tr>");
        Response.Write("<td>");
        Response.Write("#" + myreader["ItemNum"]);
        Response.Write("</td>");
        Session["ItemNum"+i] = myreader["ItemNum"];

        Response.Write("<td>");
        Response.Write(myreader["ItemName"]);
        Response.Write("</td>");
        Session["ItemName"+i] = myreader["ItemName"];

        Response.Write("<td>");
        Response.Write(myreader["ItemDescription"]);
        Response.Write("</td>");
        Session["ItemDescription"+i] = myreader["ItemDescription"];

        Response.Write("<td>");
        Response.Write(myreader["ItemQuantity"]);
        Response.Write("</td>");
        Session["ItemQuantity" + i] = myreader["ItemQuantity"];

        Response.Write("<td>");
        Response.Write("$" + myreader["ItemPrice"]);
        Response.Write("</td>");
        Session["ItemPrice"+i] = myreader["ItemPrice"];

        Response.Write("<td><img src= '" + myreader["ItemPic"] + "' height=200 width=300></img></td>");

        Response.Write("<td>");
        Response.Write("<input type=text id=textbox name=textbox"+i);
        Response.Write(">");
        Response.Write("</td>");
        //int q=Convert.ToInt32(Request.Form["textbox" + i]);
        //qty.Add(qty.ToString());
        //Session["sessionqty"] = qty;
        Response.Write("</tr>");
        Response.Write("<br>");
        i++;
        Session["counter"] = i;
    }
    Response.Write("<td colspan=7>");
    Response.Write("<center>"+"<input type='submit' name='submit'>"+"</center>");
    Response.Write("</td>");
    //step5 closing the reader and connection objects
    myreader.Close();
    myconn.Close();
    Response.Write("</form>");
%>
<Style>
    table{
        border: 2px solid;
        display: inline-block;
        margin-top: -50px;
        width: 940px;
    }
    table td{
        border: 2px solid;
        background-color: #ccc;
    }
    th{
        padding-right: 10px;
        border: 2px solid;
    }
    td{
        padding: 5px;
    }
</Style>
</Table>
</center>
</body>
</html>