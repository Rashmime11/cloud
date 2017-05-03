<html>
<!--
 Licensed to the Apache Software Foundation (ASF) under one or more
  contributor license agreements.  See the NOTICE file distributed with
  this work for additional information regarding copyright ownership.
  The ASF licenses this file to You under the Apache License, Version 2.0
  (the "License"); you may not use this file except in compliance with
  the License.  You may obtain a copy of the License at

      http://www.apache.org/licenses/LICENSE-2.0

  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License.
-->

<head>
    <title>carts</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    
    <script>
	
    
    function submitAction(strName)
    {
	
    	try
    	{
    	  var dataString = $( "form" ).serialize();
    	  dataString = dataString + "&submit=" + strName;
    	  //var dataString = "submit=" + strName; 
    	  alert(dataString);
    	  
    	  $.post("carts.jsp",dataString,
    		        function(data,status){
						alert(1.1);
		   		        $('#contact_form').html("<div id='message'></div>");
		   			    $('#message').html("<h2>Contact Form Submitted!</h2>")
		   			    .append("<p>We will be in touch soon.</p>")
		   			    .hide()
		   			    .fadeIn(1500, function() {
		   			    	$('#message').load("displayCart.jsp");
		   			    	alert(2.1);
		   			    });
    		        });    	  
    	}
    	catch (e)
    	{
    		alert(e.message);
    	}
    }    
    
    </script>
    
</head>

 <body bgcolor="white">
<font size = 5 color="#CC0000">

<form>
<BR>
Please enter item to add or remove:
<br>
Add Item:

<SELECT NAME="item">
<OPTION>Beavis & Butt-head Video collection</option>
<OPTION>X-files movie</option>
<OPTION>Twin peaks tapes</option>
<OPTION>NIN CD</option>
<OPTION>JSP Book</option>
<OPTION>Concert tickets</option>
<OPTION>Love life</option>
<OPTION>Switch blade</option>
<OPTION>Rex, Rugs & Rock n' Roll</option>
</SELECT>


<%
 out.print("");

%>

<br> <br>
<input type="hidden" name="submitH">
<button name="submit" id="submit" value="add" onclick="submitAction('add')">add</button>
<button name="submit" id="submit" value="remove" onclick="submitAction('remove')">remove</button>

</form>
       
</FONT>

<div id="contact_form"></div>

</body>


</html>
