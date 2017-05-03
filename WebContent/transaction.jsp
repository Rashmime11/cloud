<!DOCTYPE html>
<html>
<head>
<script>

<% 

%>


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
body {font-family: "Lato", sans-serif;}

/* Style the tab */
div.tab {
    overflow: hidden;
    border: 1px solid #ccc;
    background-color: #f1f1f1;
}

/* Style the links inside the tab */
div.tab a {
    float: left;
    display: block;
    color: black;
    text-align: center;
    padding: 14px 16px;
    text-decoration: none;
    transition: 0.3s;
    font-size: 17px;
}

/* Change background color of links on hover */
div.tab a:hover {
    background-color: #ddd;
}

/* Create an active/current tablink class */
div.tab a:focus, .active {
    background-color: #ccc;
}

/* Style the tab content */
.tabcontent {
    display: none;
    padding: 6px 12px;
    border: 1px solid #ccc;
    border-top: none;
}
</style>
</head>
<body onLoad="resetFunction()">
<form action="vodafonepayment.jsp" >
<p>Click on the links inside the tabbed menu:</p>

<div class="tab">
  <a href="javascript:void(0)" class="tablinks" onclick="openCity(event, 'Debit')">Debit</a>
  <a href="javascript:void(0)" class="tablinks" onclick="openCity(event, 'Credit')">Credit</a>
  <a href="javascript:void(0)" class="tablinks" onclick="openCity(event, 'Net Banking')">Net Banking</a>
</div>

<div id="Debit" class="tabcontent">
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
		</tr> 	
		</table>
</div>	

</form>

<form action="NewFile.jsp" >
				
<div id="Credit" class="tabcontent"> <h3>Credit Details</h3>
	  	
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
<div id="Net Banking" class="tabcontent">
  <h3> Bank Details </h3>
  	
  <table>
   <form action="vodafonepayment.jsp" method="get"  >
   <input type="radio" id="bank" name="bank" onclick="check(this.value)" value="HDFC">HDFC<br>
   <input type="radio" id="bank" name="bank" onclick="check(this.value)" value="ICICI">ICICI<br>
   <input type="radio" id="bank" name="bank" onclick="check(this.value)" value="Axis">Axis<br>
   <input type="radio" id="bank" name="bank" onclick="check(this.value)" value="PNB">PNB<br>
   <input type="radio" id="bank" name="bank" onclick="check(this.value)" value="SBI">SBI<br>
   <input type="radio" id="bank" name="bank" onclick="check(this.value)" value="Others">Others<br>
 	Your selection is: <input type="text" id="answer" name="answer" size="20">
 	<tr>
		<td>
<input type="submit"  values="Submit">			
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
