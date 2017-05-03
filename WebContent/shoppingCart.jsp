<!DOCTYPE html>
<!--[if lt IE 7]> <html class="lt-ie9 lt-ie8 lt-ie7" lang="en"> <![endif]-->
<!--[if IE 7]> <html class="lt-ie9 lt-ie8" lang="en"> <![endif]-->
<!--[if IE 8]> <html class="lt-ie9" lang="en"> <![endif]-->
<!--[if gt IE 8]><!--> 
<%@page import="java.util.Enumeration"%>
<%@page import="beans.ShoppingList"%>
<%@page import="java.util.Hashtable"%>
<html lang="en"> <!--<![endif]-->
<head>
  <link rel="stylesheet" href="css/shoppingCart.css">
  <!--[if lt IE 9]><script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
  
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script>
	
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
  
</head>
<body>

  <section class="widget">
    <div class="widget-heading">
      <h3 class="widget-title">Shopping Cart</h3>
<!--       <a href="#" class="widget-close"><span class="icon-close">Close</span></a>  -->
    </div>

	<table class="widget-toolbar"><tr>
	  <td class="leftWidget" align="left"> <input id="REMOVEALL" class="leftWidgetButton" type="Button" value="Remove All" onclick="submitAction('ALL','ALL')" > </td>
	  <td class="rightWidget" align="right"> <input id="PROCEEDCHECKOUT" class="rightWidgetButton" type="Button" value="Proceed to Checkout" onclick="checkOut('checkout.jsp')"></td></tr>
    </table>
    
    <div class="scrollList">

<jsp:useBean id="cart" scope="session" class="beans.MyBean" />

<jsp:setProperty name="cart" property="*" />

<!--
<FONT size = 5 COLOR="#CC0000">
<br><ol>
      <ul class="downloads">
-->


<table width="100%">

<% 
	Enumeration names;
	String key;
	ShoppingList slist = null; 

	Hashtable<String,ShoppingList> items = cart.getItems();
	
	int i = 0;
	System.out.println("1");
	names = items.keys();
	System.out.println("2");
	while(names.hasMoreElements()) {
	  i++;
	  key = (String) names.nextElement();
	  System.out.println(key);
	  slist = items.get(key);
		
 %>     
      <tr>
      		<td>
      			<table width="100%" height="50pt">
      					<tr id="li<% out.print(i);%>">
      						<td style="font-size:10pt;width:20%">
      							<img src="images/<% out.print(slist.PRODUCT_IMAGE_LOCATION); %>" height="80pt" width="80pt" >
      						</td>
      						<td align="left" width="60%" colspan="4">
      							<h3><% out.print(slist.PRODUCT_NAME); %></h3>
      						</td>
      						<td style="font-size:10pt;white-space: nowrap;vertical-align:bottom; width:10%">
      							<% out.print(slist.PRODUCT_CURRENCY + " " + slist.PRODUCT_PRICE); %>/-
      						</td>
      						<td align="right">
      							<a href="#" onclick="submitAction('<% out.print(slist.PRODUCT_ID); %>','<% out.print(i); %>')" class="cancel_task"><img src="images\remove-icon.png" class="icon-remove"></a>
      						</td>
      					</tr>
      			
      			</table>
      		</td>
      
      </tr>
      
 
<%
	}
	
	if (i==0)
	{
		%>
		<li class="download download-inactive" >
			<center><h3> Your shopping cart is empty!</h3> </center>
	 	</li>
		
		<%
	}
	else
	{

/*		names = items.keys();
	
	  while(names.hasMoreElements()) {
	  i++;
	  key = (String) names.nextElement();	
	  slist = items.get(key);
	*/	
	}
			

%>

</table>

<!-- </ol>  


</FONT>
-->
    </ul>

</div>

  </section>
</body>
</html>
