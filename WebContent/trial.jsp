<!DOCTYPE html>
<html>
<head>
 <head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">


<script>

<% 

%>

function CheckLogOff()
{
	if (confirm("Do you want you logoff?")== true)
	{
		window.location = "logoff.jsp";
	}
	
}


function startFunction() 
{
	
var i, tabcontent;
tabcontent = document.getElementsByClassName("tabcontent");
for (i = 0; i < tabcontent.length; i++)
	{
	    		tabcontent[i].style.display = "none";
	}
}
function check(browser) {
    document.getElementById("answer").value=browser;
}

function resetFunction()
{
	alert(1);
	 document.getElementById("answer").value=null;
	 
	
}
	
	</script>

<style>


ul {
	list-style-type: none;
    list-style-position: none;
    margin-top: 100px;
    padding: 0;
    width: 15%;
    top:0px;
    left:200px;
    background-color: #f1f1f1;
    position: fixed;
    height: 50%;
    
}

li a {
    display: block;
    color: #000;
    padding: 8px 16px;
    text-decoration: none;
}

li a.active {
    background-color: red;
    color: white;
}

li a:hover:not(.active) {
    background-color: #555;
    color: white;
}
</style>

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

<body onLoad="startFunction()">
<div id="mainWrapper" class="mainWrapper">


  <header> 
    <!-- This is the header content. It contains Logo and links -->
    <div id="headerLinks"><a href="#" title="Log off" onClick="CheckLogOff()">Logoff as <% out.println(userid); %></a>

    <div id="myDropdownArea" class="dropdown">
		<!--  <button onclick="myCartManage()" class="dropbtn">Dropdown</button> -->
		<div id="fullCart" class="fullCart"><a href="#" title="Cart" onclick="myCartManage()"><img src="images/cart.jpg" width="20" height="20"></a></div> 		
		<div id="emptyCart" class="emptyCart"><a href="#" title="Cart" onclick="myCartManage()"><img src="images/empty_cart.png" width="20" height="20"></a></div> 		
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
	  </div></div>
	  
<div class= "leftPane">
<ul> 
  <li><a href="javascript:void(0)" class="tablinks" onclick="openCity(event, 'Debit')">Debit</a></li>
  <li><a href="javascript:void(0)" class="tablinks" onclick="openCity(event, 'Credit')">Credit</a></li>
  <li><a href="javascript:void(0)" class="tablinks" onclick="openCity(event, 'Net Banking')">Net Banking</a></li>
  
</ul>
</div>

<form action="NewFile.jsp" >



<div id="Debit" class="tabcontent" style="margin-left:35%;padding:1px 16px;height:1000px;">
  <h3>Debit Details</h3>
  	<table>
		<tr>
			<td>
				<h1 style="color:Red"> Enter Card details </h1>
			</td>
		</tr>
		
		
		<tr>
			<td align="left">
				 Card number<input type="text" id="strCardNumber" name="strCardNumber">
			</td>
		
			<td align="right">
					Expiry date   <input type="date" value="" name="strexpiryDate" id="strexpiryDate"/>
			</td>
		</tr>
		
		
		<tr>			
			<td align="left">
						CVV number <input type="text" id="strCVVNumber" name="strCVVNumber">
			</td>
			<tr>
				<td>
				   	    <input type="Submit" id="submit" name="submit" value="Pay now" onClick="resetFunction();"  > 
				</td>
		 	</tr> 	
		</table>
</div>	

</form>

<form action="NewFile.jsp" >
				
<div id="Credit" class="tabcontent" style="margin-left:35%;padding:1px 16px;height:1000px;"> <h3>Credit Details</h3>
	  	
<table>
		
		<tr>
			<td>
				<h1 style="color:Red">Enter card details </h1>
			</td>
		</tr>
	
		<tr>
			<td align="left">
				  Card number<input type="text" id="strUName" name="strUName">
			</td>
			
			<td align="right">
				Expiry date   <input type="date" value="" name="date"/>
			</td>
		</tr>
		
		<tr>
			<td align="left">
				CVV number <input type="text" id="strUName" name="strUName">
			</td>
		
		<tr>
			<td>
				<input type="Submit" id="loginButton" name="loginButton"  value="Pay now"  onClick="resetFunction();"  > 
			</td>
         </tr>
</table>
</div>
<div id="Net Banking" class="tabcontent" style="margin-left:35%;padding:1px 16px;height:1000px;">
  <h3> Bank Details </h3>
  	
  <table>
   <form action="NewFile.jsp" method="get"  >
   <input type="radio" id="bank" name="bank" onclick="check(this.value)" value="HDFC">HDFC<br>
   <input type="radio" id="bank" name="bank" onclick="check(this.value)" value="ICICI">ICICI<br>
   <input type="radio" id="bank" name="bank" onclick="check(this.value)" value="Axis">Axis<br>
   <input type="radio" id="bank" name="bank" onclick="check(this.value)" value="PNB">PNB<br>
   <input type="radio" id="bank" name="bank" onclick="check(this.value)" value="SBI">SBI<br>
   <input type="radio" id="bank" name="bank" onclick="check(this.value)" value="Others">Others<br>
  	Your selection is: <input type="text" id="answer" name="answer" size="20">
 	
 	<tr>
		<td>
<input type="submit"  value="Submit">			
		</td>
	</tr>		
    </form>				        
	</table>				
</div>			

	<script>
		function openCity(evt, cityName) 
		{
    	var i, tabcontent, tablinks;
    	tabcontent = document.getElementsByClassName("tabcontent");
    	for (i = 0; i < tabcontent.length; i++)
    		{
        	    		tabcontent[i].style.display = "none";
    		}
    	tablinks = document.getElementsByClassName("tablinks");
    	for (i = 0; i < tablinks.length; i++)
    		{
        				tablinks[i].className = tablinks[i].className.replace(" active", "");
    		}
    	document.getElementById(cityName).style.display = "block";
    	evt.currentTarget.className += " active";
		}
	</script>
	</form>

</body>
</html>
