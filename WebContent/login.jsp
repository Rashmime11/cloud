
<!doctype html>
<html>
<head>

<meta charset="utf-8">
<title></title>
<style>
	
 body
	{
		background: #E9E9E9;
		width: 270px;
	}
.textbox {
    width: 250px;
    padding: 5px 5px;
    font-family: "HelveticaNeue-Light", "Helvetica Neue Light", "Helvetica Neue", Helvetica, Arial, "Lucida Grande", sans-serif;
    font-weight: 400;
    font-size: 14px;
    color: #9D9E9E;
    text-shadow: 1px 1px 0 #FFF;
    background: #FFF;
    border: 1px solid #FFF;
    border-radius: 5px;
    box-shadow: inset 0 1px 3px rgba(0, 0, 0, 0.50);
    -moz-box-shadow: inset 0 1px 3px rgba(0,0,0,0.50);
    -webkit-box-shadow: inset 0 1px 3px rgba(0, 0, 0, 0.50);
}
  .textbox:focus {
    background: #DFE9EC;
    color: #414848;
    box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.25);
    -moz-box-shadow: inset 0 1px 2px rgba(0,0,0,0.25);
    -webkit-box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.25);
    outline: 0;
}
  .textbox:hover {
    background: #DFE9EC;
    color: #414848;
}
	
	td{
	
		font: normal;
		font-family: Gotham, Helvetica Neue, Helvetica, Arial," sans-serif";
		font-size: 14;
		
	}	
	
	</style>
    
            <script>
//		alert(2);

    </script>


</head>

<body>
<form action = "Loading.jsp" method="get" target="_main">
<table width="200" border="0">
<caption><h3 style="color:red">

	<% 
	
	String errMessage=(String)request.getAttribute("errorMessage");
	System.out.println("Before if in login.jsp");
	if (errMessage != null)
	{
		System.out.println("Within first if in login.jsp");
		if (errMessage.length() > 0)
		{
			System.out.println("Within Second if in login.jsp");
			out.println(errMessage);
		}
	}
	System.out.println("After if in login.jsp");
	
	
	
	
	
	%>
	
	
</h3></caption>
  <tbody>
    <tr align="center">
      <td colspan="2"><h2>Login myVodafone</h2></td>
    </tr>
    <tr>
      <td colspan="2" width="50">Username:</td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td><input type="text" class="textbox" name="strUName" id="strUName"></td>
    </tr>
    <tr>
      <td colspan="2" width="50">Password:</td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td><input type="password" class="textbox" name="strPass" id="strPass"></td>
    </tr>
    <tr>
      <td></td>
      <td><input type="submit" name="submit" id="submit" value="Login"></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td><a href="forgot_password.html">Forgot Password</a></td>
    </tr>
  </tbody>
  
</table>
<br>
<br>



</form>
</body>
<%

//request.setAttribute("errorMessage", "Invalid user or password");

%>


</html>
