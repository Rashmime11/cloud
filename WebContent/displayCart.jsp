<html>
<head>
	
	<script>
	
	</script>
	
</head>

welcome

<jsp:useBean id="cart" scope="session" class="beans.MyBean" />

<jsp:setProperty name="cart" property="*" />
<FONT size = 5 COLOR="#CC0000">
<ol>
<% 
	String[] items = cart.getItems();
	for (int i=0; i<items.length; i++) {
%>
<li> <% out.print(beans.HTMLFilter.filter(items[i])); %>  </li>
<%
	}
%>
</ol>

</FONT>


</html>
