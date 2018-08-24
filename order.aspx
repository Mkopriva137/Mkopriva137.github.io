<%@ Page Language="C#" Debug="true"%>
<%
    Response.Write("<html><head><title>Your Order Information</title></head><body>");
    Response.Write("<b><center><font size='28'>Your Order</font></center></b><br>");
    Response.Write("<center>");
    Response.Write("<Table>");
    Response.Write("<tr><th>Item Name</th> <th>Quantity Ordered</th> <th>Price</th> <th>Total Price</th></tr>");
    double total = 0;
    double tax = 0;
    int subtotal = 0;
    int delivCost = 1000;
    //List<string> qty = (List<string>)Session["sessionqty"];
    //List<int> qtyint = qty.ConvertAll(int.Parse);
    Response.Write("<form action=Neworder.aspx method=post>");
    for(int i=0; i<Convert.ToInt32(Session["counter"]); i++)
    {
        if ((Request.Form["textbox" + i]) == "")
        {
        }

        else { if (Convert.ToInt32(Request.Form["textbox" + i]) < 0)
            {
                Response.Write("Enter a quantity greater than 0 for: "+Session["ItemName" + i]+"<br>");
            }
            else
            {
                int qty = Convert.ToInt32(Request.Form["textbox" + i]);
                int price = Convert.ToInt32(Session["ItemPrice" + i]);
                int totalPrice = qty * price;
                Response.Write("<tr>");
                Response.Write("<td>" + Session["ItemName" + i] + "</td>");
                Response.Write("<td>" + (Request.Form["textbox" + i].Trim()) + "</td>");
                Response.Write("<td>" + price + "</td>");
                Response.Write("<td>" + totalPrice + "</td>");
                Response.Write("</tr>");
                subtotal = subtotal + totalPrice;
            }
        }
        }
        tax = Convert.ToDouble(subtotal) * .06;
        total = subtotal + tax + 1000;
        Session["totalPrice"] = Convert.ToString(total);

        Response.Write("<tr>");
        Response.Write("<td colspan=3 align=right>");
        Response.Write("SubTotal");
        Response.Write("</td>");
        Response.Write("<td>");
        Response.Write(subtotal);
        Response.Write("</td>");
        Response.Write("</tr>");

        Response.Write("<tr>");
        Response.Write("<td colspan=3 align=right>");
        Response.Write("Tax");
        Response.Write("</td>");
        Response.Write("<td>");
        Response.Write(tax);
        Response.Write("</td>");
        Response.Write("</tr>");

        Response.Write("<tr>");
        Response.Write("<td colspan=3 align=right>");
        Response.Write("Flat Shipping Rate");
        Response.Write("</td>");
        Response.Write("<td>");
        Response.Write("$" + delivCost);
        Response.Write("</td>");
        Response.Write("</tr>");

        Response.Write("<tr>");
        Response.Write("<td colspan=3 align=right>");
        Response.Write("Order Total");
        Response.Write("</td>");
        Response.Write("<td>");
        Response.Write("$" + total);
        Response.Write("</td>");
        Response.Write("</tr>");
    Response.Write("<center>"+"Name: "+"<input type='text' name='txtname'>"+"</center>"+"<br>");
    Response.Write("<center>"+"Address: "+"<input type='text' name='txtaddress'>"+"</center>"+"<br>");
    Response.Write("<center>"+"<input type='submit' name='submit'>"+"</center>");
    Response.Write("</form>");
%>















<Style>
    table{
        border: 2px solid;
        display: inline-block;
        width: auto;
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
    title{
        margin-top: 50px;
    }
</Style>
</Table>
</center>
</body>
</html>