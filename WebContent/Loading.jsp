<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Intermediate</title>
</head>
<body>


<%
String userid=request.getParameter("strUName"); 
session.setAttribute("userid",userid); 
String pwd1=request.getParameter("strPass");
System.out.println("password : " + pwd1);

Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test_db","DEVOPS","DEVOPS"); 
Statement st= con.createStatement();
String flag = "failed";
if (userid != null)
{

	ResultSet rs=st.executeQuery("select * from login_myvodafone where upper(Username)='"+userid.toUpperCase()+"'"); 
	if(rs.next()) 
	{ 
		System.out.println("Inside second if");
		if(rs.getString(2).equals(pwd1)) 
		{ 
			System.out.println("Inside third if");
			out.println(" Welcome " +userid); 
			flag = "Success";
			session.setAttribute("customerid",rs.getString(3));
			session.setAttribute("profileImageLoc",rs.getString(4));
			response.sendRedirect("myAccountPage.jsp");
			System.out.println("Redirect over");
		} 
	} 
}

if (flag.equalsIgnoreCase("failed"))
{

	session.invalidate();
	request.setAttribute("errorMessage", "Invalid user or password");
	RequestDispatcher rd = request.getRequestDispatcher("/home.html");
	rd.forward(request, response);
	String errMessage=(String)request.getAttribute("errorMessage");
	out.println(errMessage);
	
}



%>

</body>
</html>