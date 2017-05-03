<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Postpaid mobile bill payment</title>
</head>
<body>
<form action = "login.jsp" method="get">

	<table>
		<tr>
			
			<td>
				<table>
					<tr>
						<td>
							<h1 style="color:Red">Pay your postpaid mobile anytime anywhere!  </h1>
						</td>
					</tr>
					<tr>
						<td>
							<h3>You have logged in as <% out.print(session.getAttribute("userid")); %>  </h3>
						</td>
					</tr>
					<tr>
						<td>
							Enter your username/mobile number
						</td>
					</tr>
					<tr>
						<td>
							<input type="text" id="strUName" name="strUName">
						</td>
					</tr>
					<tr>
						<td>
							Enter your Email address:
						</td>
					</tr>
					<tr>
						<td>
							<input type="text" id="stradd" name="stradd">
						</td>
					</tr>
					<tr>
						<td>
							Enter your bill amount :
						</td>
					</tr>
					</tr>
					<tr>
						<td>
							<input type="text" id="stradd" name="stradd">
						</td>
					</tr>
			
					<tr>
					     <td>
					        <input type="Submit" id="chkRememberMe" name="Proceed" value="Proceed"> 
					       </td>
					  </tr>
					        
				</table>
			</td>

			<td>
				
				
			</td>

			<td>
				
				
			</td>

		
		</tr>
		
		
	
	
	</table>
</form>





</body>
</html>