<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://www.w3schools.com/lib/w3.css">
	<title>The Trial2</title>
		<script>
		function openCity(evt, cityName) 
		{
    	var i, tabcontent, tablinks;
    	tabcontent = document.getElementsByClassName("w3-container");
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
<script>

<% 

%>

	
	</script>
	<style>li a.active {
    background-color: red;
    color: white;
}
	
	</style> 
 </head>
<body>
<div class="w3-row">
<div class= "w3-col w3-container m4 l3">
<ul> 
  <li><a href="javascript:void(0)" class="tablinks" onclick="openCity(event, 'Debit' )">Debit</a></li>
  <li><a href="javascript:void(0)" class="tablinks" onclick="openCity(event, 'Credit')">Credit</a></li>
  <li><a href="javascript:void(0)" class="tablinks" onclick="openCity(event, 'Net Banking')">Net Banking</a></li>
  
</ul>
</div>

<form action="NewFile.jsp" >



<div id="Debit" class="w3-col w3-container m8 l9">
  <h3>Debit Details</h3>
  	<table>
		<tr>
			<td>
				<h1 style="color:Red"> Enter Card details </h1>
				
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
				   	    <input type="Submit" id="submit" name="submit" value="Pay now" onClick="resetFunction();"  > 
				</td>
		 	</tr> 	
		</table>
</div>	

</form>

<form action="NewFile.jsp" >
				
<div id="Credit" class="w3-col w3-container m8 l9" > <h3>Credit Details</h3>
	  	
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
<div id="Net Banking" class="w3-col w3-container m8 l9" >
  <h3> Bank Details </h3>
  	   <form action="vodafonepayment.jsp" method="get"  >
  <table>

   <input type="radio" id="bank" name="bank" onclick="check(this.value)" value="HDFC">HDFC<br>
   <input type="radio" id="bank" name="bank" onclick="check(this.value)" value="ICICI">ICICI<br>
   <input type="radio" id="bank" name="bank" onclick="check(this.value)" value="Axis">Axis<br>
   <input type="radio" id="bank" name="bank" onclick="check(this.value)" value="PNB">PNB<br>
   <input type="radio" id="bank" name="bank" onclick="check(this.value)" value="SBI">SBI<br>
   <input type="radio" id="bank" name="bank" onclick="check(this.value)" value="Others">Others<br>
 	Your selection is: <input type="hidden" id="answer" name="answer" size="20">
 	
 	<tr>
		<td>
<input type="submit"  value="Submit">			
		</td>
	</tr>		
			        
	</table>	    
	</form>				
</div>			


	</form>

</div>

</body>
</html>