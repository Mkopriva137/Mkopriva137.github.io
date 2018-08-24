<%@ Page Language="C#" Debug="true"%>
<%@ Import Namespace="System.Data.Odbc"%>
<%
    Response.Write("<html><head><title>EMPLOYEE ASP in C#</title></head><body>");

    //step1: CREATE ODBC DATABASE CONNECTION, COMMAND, and DATAREADER OBJECTS
    OdbcConnection myconn;
    OdbcCommand mycmd;
    OdbcDataReader myreader;

    //step2: connecting to a physical database using ODBC drivers for .mbd and .accdb files
    myconn = new OdbcConnection(@"DRIVER={Microsoft Access Driver (*.mdb, *.accdb)};DBQ=c:\inetpub\wwwroot\northwind.accdb");
    mycmd = new OdbcCommand("Select * from employees", myconn);

    Response.Write("<b>Data from the Names table in the EMPLOYEES ACCESS Database: C# Program</b><br><br>");
	Response.Write("<a href='company.html'>Back to our Home Page</a><br>");

    //step3 opening connection object and reader object (cursor in oracle)
    myconn.Open();
    myreader = mycmd.ExecuteReader();

    //step4 using a loop to go through the records in the reader (going through the cursor in oracle)
    Response.Write("<Table>");
    Response.Write("<tr><th>ID</th> <th>First Name</th> <th>Last Name</th></tr>");
    while ((myreader.Read()))
    {
        Response.Write("<tr>");
        Response.Write("<td>");
        Response.Write(myreader["ID"]+" ");
        Response.Write("</td>");
        Response.Write("<td>");
        Response.Write(myreader["First Name"]+",");
        Response.Write("</td>");
        Response.Write("<td>");
        Response.Write(myreader["Last Name"]);
        Response.Write("</td>");
        Response.Write("</tr>");
        Response.Write("<br>");
    }

    //step5 closing the reader and connection objects
    myreader.Close();
    myconn.Close();
%>
    <Style>
        table{
            border: 2px solid;
            margin-left: 50px;
            display: inline-block;
            margin-top: -120px;
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
</body>
</html>