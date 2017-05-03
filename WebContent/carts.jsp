<jsp:useBean id="cart" scope="session" class="beans.MyBean" /> 
<jsp:setProperty name="cart" property="*" />
<%
	
	out.print(cart.processRequest());
%>
