<!DOCTYPE html>
<html>
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins">
<head>
<title>vodafone payment gateway</title>
</head>
<body>
<form>
<% String Bank= request.getParameter("bank") ;
 out.println("Welcome to   " + Bank);
 %>
<br> <br> <br>
<tr>
						<td>
							Enter your username 
						</td>
</tr>				
					
					<tr>
						<td>
							<input type="text" id="strUName" name="strUName"><br>
						</td>
</tr>				
					<tr>
						<td>
							Enter your password
						</td>
					</tr>
					<tr>
						<td>
							<input type="password" id="strPass" name="strPass">
						</td>
					</tr>
					<br>
					<br>
		<tr>
				<td>
				        <input type="Submit" id="loginButton" name="loginButton" value="Submit" > 
					       </td>
	   </tr>	
					    
		<tr>
				<td>
				        <input type="Submit" id="loginButton" name="loginButton" value="Reset" > 
		       </td>
					
					
	    </tr>				
</form>
</body>
</html>