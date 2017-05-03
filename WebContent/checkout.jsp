<%@page import="java.util.Enumeration"%>
<%@page import="beans.ShoppingList"%>
<%@page import="java.util.Hashtable"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <link rel="stylesheet" href="css/eCommerceStyle.css">

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title></title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script>

    
    function CheckLogOff()
    {
    	if (confirm("Do you want you logoff?")== true)
    	{
    		window.location = "logoff.jsp";
    	}
    	
    }
    
    
    function checkOut(sURL)
    {
    	
    	window.location = (sURL);
    	
    }
    function submitAction(itemName,strName)
    {
	
    	try
    	{
      	  var dataString = "item=" + itemName + "&submit=remove";
    	  if (strName == "ALL")
   		  {
    		  dataString = dataString + "All";
        	  $.post("carts.jsp",dataString,
      		        function(data,status){
  		   		        $('#li'+strName).remove();
  		   		     	location.reload(); 
      		        });    	  
   		  }
    	  else
   		  {
        	  $.post("carts.jsp",dataString,
      		        function(data,status){
  		   		     	location.reload(); 
      		        });    	  
   		  
   		  }
    	  //var dataString = "submit=" + strName; 
//    	  alert(dataString);
    	  
    	}
    	catch (e)
    	{
    		alert(e.message);
    	}
    }    
    
    </script>  
<script>



function CheckLogOff()
{
	if (confirm("Do you want you logoff?")== true)
	{
		window.location = "logoff.jsp";
	}
	
}



	function openPage()
	{
	window.location.href= http://localhost:7080/AntPOC/trial.jsp;
	}



</script>


<meta charset="utf-8">
<title>MyAccount Home Page</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="css/eCommerceStyle.css" rel="stylesheet" type="text/css">
<!--The following script tag downloads a font from the Adobe Edge Web Fonts server for use within the web page. We recommend that you do not modify it.-->

</head>

<body onLoad="onLoadFunc()">

    <div class="lefttop_logo"> <img src="images/Vodafone-2.png">

    </div>
<%

String userid = (String)session.getAttribute("userid"); 
String customerid = (String)session.getAttribute("customerid");
		
		%>

</head>
<jsp:useBean id="cart" scope="session" class="beans.MyBean" />

<jsp:setProperty name="cart" property="*" />


<body>
<form action="trial.jsp">
<div id="mainWrapper" class="mainWrapper">


  <header> 
    <!-- This is the header content. It contains Logo and links -->
    <div id="headerLinks"><a href="#" title="Log off" onClick="CheckLogOff()">Logoff as <% out.println(userid); %></a>

    <div id="myDropdownArea" class="dropdown">
		<!--  <button onclick="myCartManage()" class="dropbtn">Dropdown</button> -->
		<div id="fullCart" class="fullCart"><a href="#" title="Cart" onclick="myCartManage()"></a></div> 		
		<div id="emptyCart" class="emptyCart"><a href="#" title="Cart" onclick="myCartManage()"></a></div> 		
  		<div id="myDropdown" class="dropdown-content-hide" onclick="myCartManage()" >
  		</div>
	</div></div>
  </header>
  
  <div class="body_section">
  
	  <section id="offer" class="offer"> 
	    <!-- The offer section displays a banner text for promotions -->
	    <h2>myVodafone
	          <input type="text"  id="search" value="search">
	    </h2>
	  </section>
<center>

<fieldset class="checkoutSummaryFS">
<table class="checkoutSummary">

<% 
	Enumeration names;
	String key;
	ShoppingList slist = null; 

	Hashtable<String,ShoppingList> items = cart.getItems();
	
	int i = 0;
	names = items.keys();
	int myTotal = 0;
	
	
	while(names.hasMoreElements()) {
	  i++;
	  key = (String) names.nextElement();
	  slist = items.get(key);
	  
	  myTotal = myTotal + Integer.parseInt(slist.PRODUCT_PRICE);
		
 %>     
      <tr>
      		<td>
      			<center>
	      			<table width="100%" height="50pt">
	      					<tr width="100%" height="20pt" class="checkoutItem" id="li<% out.print(i);%>">
	      						<td style="font-size:10pt;width:20%">
	      							<img src="images/<% out.print(slist.PRODUCT_IMAGE_LOCATION); %>" height="80pt" width="80pt" >
	      						</td>
	      						<td align="left" width="60%" colspan="4">
	      							<h3><% out.print(slist.PRODUCT_NAME); %></h3>
	      						</td>
	      						<td style="font-size:10pt;white-space: nowrap;vertical-align:middle; width:10%;">
	      							<% out.print(slist.PRODUCT_CURRENCY + " " + slist.PRODUCT_PRICE); %>/-
	      						</td>
	      						<td align="right">
	      							<a href="#" onclick="submitAction('<% out.print(slist.PRODUCT_ID); %>','<% out.print(i); %>')" class="cancel_task"><img src="images\remove-icon.png" class="icon-remove"></a>
	      						</td>
	      					</tr>
	      					
	      			</table>
	      		</center>
      		</td>
      
      </tr>
      
 
<%
	}
	
	if (i==0)
	{
		%>

		<tr class="download download-inactive" >
			<td><center><h3> Your shopping cart is empty!</h3> </center></td>
	 	</tr>
		
<%
	}


%>
</table>
</center>
<%

if (i > 0)
{

	%>
	<fieldset class="total_sectionFS">
		<center>
		<table width="60%" style="align:center;">
			<tr>
				<td>Total amount :</td> 
				<td><% out.print(myTotal); %></td>R
						
	      			</tr>
	      			
	      			
		</table>

		 <a href="trial.jsp">
<input type="button" value="pay now" name="SecondPage" id="PAYNOW"/>
</a>
		</center>
	</fieldset>
	
	<%
}

%>


</fieldset>
</form>
</body>
</html>