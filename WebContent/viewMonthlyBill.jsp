<%@page 	import="java.util.Hashtable"%>
<%@page import="beans.*"%>
<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>

<%@ page import ="java.util.ArrayList" %>
<%@ page import ="java.util.Arrays" %>

<!doctype html>
<html>
<head>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<style>

.billView
{

	position: absolute;
	height: 70%;
	width: 70%;
	top: 10%;
	bottom: 10%;
	left: 10%;
	right: 10%;

}

</style>


<script>
<%

String strDelimiter = "&";
String strSubDelimiter = "=";
%>



function onLoadFunc()
{
//$('#myDropdown').hide();
}
 </script>
 <script>
 
 
var mouseDownInLoc = false;

$(document).click(function() {
//alert(1);
	if (!mouseDownInLoc)
	{
	  $('#myDropdown').hide();
/*	  $("#myDropdown").removeClass("dropdown-content-hide");
	  $("#myDropdown").addClass("dropdown-content");
*/	}
	mouseDownInLoc = false;
});

function myCartManage()
{
    /*$("#myDropdown").removeClass("dropd	own-content");
    $("#myDropdown").addClass("dropdown-content-hide");
	*/$('#myDropdown').load("shoppingCart.jsp").show();
	mouseDownInLoc = true;

}


</script>
<script>

//var myDropDown = document.getElementById("myDropdown");
//myDropDown.className = "dropdown-content-hide";
//alert(myDropDown.id );


function addCart(val, text, buttonObj)
{
	try
	{
		var cartList = document.getElementById("selectedCart");
		
//		var addButton = buttonObj; // document.getElementById("button_" + val);
		// addButton.disabled = true;
		
		var strName = buttonObj.value;
		
		if (buttonObj.value == "add")
		{
			strName = "add";
			postPage(val, strName);
			buttonObj.value = "remove";
			buttonObj.className = "removeButton";
		}
		else if (buttonObj.value == "remove")
		{
			strName = "remove";
			postPage(val, strName);
			buttonObj.value = "add";
			buttonObj.className = "addButton";
		}
		else if (buttonObj.value == "subscribe")
		{
			strName = "subscribe";
			postPage2(val, "add");
			buttonObj.value = "unsubscribe";
			buttonObj.className = "unsubscribeButton";
		}
		else if (buttonObj.value == "unsubscribe")
		{
			strName = "unsubscribe";
			postPage2(val, "remove");
			buttonObj.value = "subscribe";
			buttonObj.className = "subscribeButton";
		}
		else if (buttonObj.value == "download")
		{
			strName = "download";
			buttonObj.value = "downloading..";
			downloadPage(val, strName);
			buttonObj.value = "download";
		}
	
	}
	catch (e)
	{
		alert(e.message);
	}
	
}

function postPage(val, strName)
{
	var dataString = 'item='+ val + "&submit=" + strName;
	
	var itemListOptionCtl = document.getElementById("itemListArray");
	
	for (var iList =0;iList < itemListOptionCtl.options.length; iList++)
	{
		if (itemListOptionCtl.options[iList].value == val)
		{
			dataString = dataString + "&" + itemListOptionCtl.options[iList].text;
			break;
					
		}
	}

	//var dataString = "submit=" + strName; 
//	alert(dataString);
		  
	$.post("carts.jsp",dataString,
			        function(data,status){
						//alert("1.1");
						//alert(data + "---" + status);
						if (parseInt(data.trim()) > 0)
						{
							document.getElementById("emptyCart").style.display = "none";
							document.getElementById("fullCart").style.display = "block";
						}
						else
						{
							document.getElementById("emptyCart").style.display = "block";
							document.getElementById("fullCart").style.display = "none";
						}
		   			   	$('#myDropdown').load("shoppingCart.jsp");
		   			    //alert("2.1");
		        });    	  
	
}

function checkIfExists(lElement)
{
	var flag = 0;
	var itemListOptionCtl = document.getElementById("itemListArray");
	
	for (var iList =0;iList < itemListOptionCtl.options.length; iList++)
	{
		if (itemListOptionCtl.options[iList].value == lElement)
		{
			flag = 1;
			break;
		}
	}
	return (flag==1);
	
}


function postPage2(val, strName)
{
	var dataString = 'item='+ val + "&submit=" + strName;
	
	var itemListOptionCtl = document.getElementById("itemListArray");
	
	for (var iList =0;iList < itemListOptionCtl.options.length; iList++)
	{
		if (itemListOptionCtl.options[iList].value == val)
		{
			dataString = dataString + "&" + itemListOptionCtl.options[iList].text;
			break;
					
		}
	}

	//var dataString = "submit=" + strName; 
	//alert(dataString);
		  
	$.post("carts.jsp",dataString,
	        function(data,status){
				//alert("1.1");
				//alert(data + "---" + status);
				if (parseInt(data.trim()) > 0)
				{
					document.getElementById("emptyCart").style.display = "none";
					document.getElementById("fullCart").style.display = "block";
				}
				else
				{
					document.getElementById("emptyCart").style.display = "block";
					document.getElementById("fullCart").style.display = "none";
				}
   			   	$('#myDropdown').load("shoppingCart.jsp");
   			    //alert("2.1");
        });  	  
	
}
	
function downloadPage(val, strName)
{
	var dataString = 'item='+ val + "&submit=" + strName;
	
	var itemListOptionCtl = document.getElementById("itemListArray");
	
	for (var iList =0;iList < itemListOptionCtl.options.length; iList++)
	{
		if (itemListOptionCtl.options[iList].value == val)
		{
			dataString = dataString + "&" + itemListOptionCtl.options[iList].text;
			break;
					
		}
	}

	//var dataString = "submit=" + strName; 
	//alert(dataString);
		  
	$.post("downloadMediaFile.jsp",dataString,
			        function(data,status){
						//alert("1.1");
						alert(data + "---" + status);
		   			    //alert("2.1");
		        });    	  
}
	
function CheckLogOff()
{
	if (confirm("Do you want you logoff?")== true)
	{
		window.location = "logoff.jsp";
	}
	
}





</script>


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
		
String pgNo = (String)request.getParameter("pageNo");
ArrayList<String> itemListArray = new ArrayList<String>();
int pageNo;
		
String option = request.getParameter("option");

if (pgNo == null)
{
	pageNo = 0;
}
else
{
	pageNo = Integer.parseInt(pgNo)-1;
}

if (option == null)
{
	option = "VAS";
}

if (option.equalsIgnoreCase("VAS")  
		|| option.equalsIgnoreCase("TV") 
		|| option.equalsIgnoreCase("MOVIES")
		|| option.equalsIgnoreCase("GAMES")
		|| option.equalsIgnoreCase("MUSIC"))
{
	
}
else if (option.equalsIgnoreCase("ALLMEDIA"))
{
	option = "GAMES','MOVIES','MUSIC','TV";
}
else
{
	option = "VAS";
}

String strProductList = "PRODUCT_TOOL_TIP IN ('" + option + "')";


Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test_db","DEVOPS","DEVOPS"); 
Statement st= con.createStatement();
String flag = "failed";

if (userid == null)
{
	response.sendRedirect("home.html");
}
else
{
	String sqlQuery = "SELECT a.*, CASE WHEN B.PRODUCT_ID IS NULL THEN 'add' ELSE 'remove' END as BUTTON_ACTION FROM item_product_ref a LEFT OUTER JOIN product_inventory_master b ON a.product_id = b.PRODUCT_ID  AND b.CUSTOMER_ID = ? AND IFNULL(b.END_DATE,CURRENT_DATE) >= CURRENT_DATE WHERE " + strProductList;
	String sqlCountQuery = "SELECT COUNT(1) FROM item_product_ref a LEFT OUTER JOIN product_inventory_master b ON a.product_id = b.PRODUCT_ID  AND b.CUSTOMER_ID = ? AND IFNULL(b.END_DATE,CURRENT_DATE) >= CURRENT_DATE WHERE " + strProductList;
	String type = request.getParameter("type");
	
	if (type != null)
	{
		if (type.equalsIgnoreCase("subscribed"))
		{
			sqlQuery = sqlQuery.replace("add", "subscribe");
			sqlQuery = sqlQuery.replace("remove", "unsubscribe");
			sqlQuery = sqlQuery + " and B.PRODUCT_ID IS NOT NULL ";
			sqlCountQuery = sqlCountQuery + " and B.PRODUCT_ID IS NOT NULL ";
		}
		else if (type.equalsIgnoreCase("download"))
		{
			sqlQuery = sqlQuery.replace("add", "download");
			sqlQuery = sqlQuery.replace("remove", "download");
			sqlQuery = sqlQuery + " and B.PRODUCT_ID IS NOT NULL ";
			sqlCountQuery = sqlCountQuery + " and B.PRODUCT_ID IS NOT NULL ";
		}
		else
		{
			sqlQuery = sqlQuery.replace("add", "subscribe");
			sqlQuery = sqlQuery.replace("remove", "unsubscribe");
			sqlQuery = sqlQuery + " and B.PRODUCT_ID IS  NULL ";
			sqlCountQuery = sqlCountQuery + " and B.PRODUCT_ID IS  NULL ";
		}
	}
	else
	{
		sqlQuery = sqlQuery + " and B.PRODUCT_ID IS  NULL ";
		sqlCountQuery = sqlCountQuery + " and B.PRODUCT_ID IS  NULL ";
	}
	sqlQuery = sqlQuery + "LIMIT " + (pageNo*9)+ ", 9 ";
	
	PreparedStatement pstmt1 = con.prepareStatement(sqlQuery);
	PreparedStatement pstmt2 = con.prepareStatement(sqlCountQuery);
	pstmt1.setString(1,customerid);
	pstmt2.setString(1,customerid);
	System.out.println(pstmt1.toString());
	System.out.println(pstmt2.toString());
	ResultSet rs =  pstmt1.executeQuery();
	ResultSet rs2 =  pstmt2.executeQuery();
	rs2.next();
	int totRecs = rs2.getInt(1);
	int iCount = 0, iCount2 = 0;
	
%>
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
	  
	  <form action="myAccountPage.jsp" method="POST">
  
  		<select id="selectedCart" name="selectedCart" style="display:none;">
  		</select>
  
  </form>
  
	  <div id="content" class="content">
	    <section class="sidebar"> 
	      <!-- This adds a sidebar with 1 searchbox,2 menusets, each with 4 links -->
	      <div id="menubar">
	        <nav class="menu">
	          	<table>
	          		<caption border="1">
						<center><h1><!-- Title for menuset 1 -->My Account</h1></center>
	          			<hr>
	          		</caption>
	          		<tbody>
	          		<tr>
	          			<td>
	          				<a href="myAccountPage.jsp?option=VAS&type=subscribed">My Subscriptions</a>
	          			</td>
	       		  </tr>
	          		<tr>
	          			<td>
	       				  <a href="myAccountPage.jsp?option=ALLMEDIA&type=download">My Collections</a>
	          			</td>
	       		  </tr>
	          		<tr>
	          			<td>
	       				  <a href="viewMonthlyBill.jsp">View My Bill</a>
	          			</td>
	       		  </tr>
	       		  </tbody>
	          	</table>
	        </nav>
	      </div>
	
	      <div id="menubar">
	        <nav class="menu">
	          <center>
	          	<table>
	          		<caption>
						<center><h1><!-- Title for menuset 1 --> Monthly Subscriptions</h1></center>
	          			<hr>
	          		</caption>
	          		<tbody>
	          		<tr>
	          			<td>
	       				  <a href="myAccountPage.jsp?option=VAS&type=unsubscribed">Value Added Services</a>
	          			</td>
	       		  </tr>
	       		  </tbody>
	          	</table>
	          </center>
	        </nav>
	      </div>
	      
	      <div id="menubar">
	        <nav class="menu">
	          <center>
	          	<table>
	          		<caption>
						<center><h1><!-- Title for menuset 1 --> Media Store</h1></center>
	          			<hr>
	          		</caption>
	          		<tbody>
	          		<tr>
	          			<td>
	       				  <a href="myAccountPage.jsp?option=GAMES">Games & Apps</a>
	          			</td>
	       		  </tr>
	          		<tr>
	          			<td>
	       				  <a href="myAccountPage.jsp?option=MOVIES">Movies</a>
	          			</td>
	       		  </tr>
	          		<tr>
	          			<td>
	       				  <a href="myAccountPage.jsp?option=MUSIC">Music</a>
	          			</td>
	       		  </tr>
	          		<tr>
	          			<td>
	          				<a href="myAccountPage.jsp?option=TV">TV Shows</a>
	          			</td>
	       		  </tr>
	       		  </tbody>
	          	</table>
	          </center>
	        </nav>
	      </div>	      
	
	    </section>
		<jsp:useBean id="cart" scope="session" class="beans.MyBean" />
	
		<jsp:setProperty name="cart" property="*" />
	
	
	    <section class="mainContent">
	
	<%
	
		itemListArray = new ArrayList<String>();
		String strItem = "";
		String[] strItemName = {"PRODUCT_ID","PRODUCT_NAME", "PRODUCT_IMAGE_LOCATION","PRODUCT_PRICE","PRODUCT_CURRENCY","BUTTON_ACTION","PRODUCT_TOOL_TIP"}; 
		String buttonStatus = "add", buttonAction = "add";
		String productId = "";
		Hashtable<String,ShoppingList> items = cart.getItems();
		
		
		
		while (rs.next())
		{
			iCount++;
			strItem = "";
			for (int iItem = 0;iItem < strItemName.length;iItem++)
				strItem = strItem + strItemName[iItem] + strSubDelimiter + rs.getString(strItemName[iItem]) + strDelimiter; 
			
			//strItem = "PRODUCT_ID" + rs.getString("PRODUCT_ID") + "," + rs.getString("PRODUCT_NAME") + "," +  rs.getString("PRODUCT_IMAGE_LOCATION") + "," + rs.getString("PRODUCT_CURRENCY") + "," + rs.getString("BUTTON_ACTION");
					
			
			itemListArray.add(strItem);
			
			buttonStatus = rs.getString("BUTTON_ACTION");
			buttonAction = rs.getString("BUTTON_ACTION");
			productId = rs.getString("PRODUCT_ID");
	
	//		Enumeration names;
	//		String key;
	//		ShoppingList slist = null;
			
	//		slist = items.get(productId);
			
	//		System.out.println(slist);
			
			
			ShoppingList sList = cart.getHashTable(productId);
			
	
	
			if (sList != null)
			{
				if (sList.PRODUCT_TOOL_TIP.equalsIgnoreCase("VAS"))
				{
					buttonStatus = "unsubscribe";
					buttonAction = "unsubscribe";
				}
				else
				{
					buttonStatus = "remove";
					buttonAction = "remove";
				}
			}
			
			//<% out.print(rs.getString("PRODUCT_DESCRIPTION"));
			if (iCount%3==1)
	      	{
				
			  	
		      %>
	
	    		  <div class="productRow"><!-- Each product row contains info of 3 elements -->
			<% } %>      
	      
	        <article class="productInfo"><!-- Each individual product description -->
	          <div>
	           <p class="productContent"><% out.print(rs.getString("PRODUCT_NAME")); %></p>
	          
	          <img alt="<% out.print(rs.getString("PRODUCT_NAME")); %>" src="images/<% out.print(rs.getString("PRODUCT_IMAGE_LOCATION")); %>"></div>
	          <p class="price"><% out.print(rs.getString("PRODUCT_CURRENCY")); %> <% out.print(rs.getString("PRODUCT_PRICE")); %>/-</p>
	          <input type="button" id="button_<% out.print(rs.getString("PRODUCT_ID")); %>" value="<% out.print(buttonAction); %>" onClick="addCart('<% out.print(rs.getString("PRODUCT_ID")); %>',' <% out.print(rs.getString("PRODUCT_NAME")); %>', this)" class="<% out.print(buttonStatus); %>Button">
	        </article>
	      <% if (iCount%3==0)
	      	 {
	      %>
	      </div>
			<% } %>      
	
	<%
		}
	
	%>
	
	
	    </section>
	    
	
		<section class="navigation">
		
			<article>
				
				<div>
						<%
							
	//					System.out.println(totRecs + " " + pageNo + " " + iCount);
						
							if (totRecs > ((pageNo * 9) + iCount))
							{
								out.println("<a href='myAccountPage.jsp?option=" + option + "&pageNo=" + (pageNo+2) + "'><input type='button' class='navButton' value='Next' name='navButton' id='navButton'></a>");
								
							}
	
							if (pageNo != 0)
							{
								out.println("<a href='myAccountPage.jsp?option=" + option + "&pageNo=" + (pageNo) + "'><input type='button' class='navButton' value='Previous' name='navButton' id='navButton'></a>");
								
							}
						
						
	}
						%>
				</div>
			
			</article>
		
		</section>
	    
	  </div>
  </div>
</div>

<select name="itemListArray" id="itemListArray" style="display:none;">
<%

for(String strItem:itemListArray)
{
	
	String[] itemsVals = strItem.split(strDelimiter);
	String[] keyValuePair = itemsVals[0].split(strSubDelimiter);
	out.println("<option value="+ keyValuePair[1] + ">" + strItem + "</option>");	
}


%>
</select>



  <footer> 
    <!-- This is the footer with default 3 divs -->
    <div>
      <p></p>
    </div>
    <div>
      <p></p>
    </div>
    <div class="footerlinks">
      <p><a href="#" title="Link">Link 1 </a></p>
      <p><a href="#" title="Link">Link 2</a></p>
      <p><a href="#" title="Link">Link 3</a></p>
    </div>
  </footer>


</body>
</html>





<%@page import="java.util.Enumeration"%>
<%@page import="beans.ShoppingList"%>
<%@page import="java.util.Hashtable"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="css/eCommerceStyle.css" rel="stylesheet" type="text/css">

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title></title>

<script>



function CheckLogOff()
{
	if (confirm("Do you want you logoff?")== true)
	{
		window.location = "logoff.jsp";
	}
	
}



	function openPage()
	{
	window.location.href= http://localhost:7080/AntPOC/trial.jsp;
	}



</script>

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


<body>
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
	  
	  <form action="myAccountPage.jsp" method="POST">
  
  		<select id="selectedCart" name="selectedCart" style="display:none;">
  		</select>
  
  </form>
    
  <div class="body_section">
  
	  <section id="offer" class="offer"> 
	    <!-- The offer section displays a banner text for promotions -->
	    <h2>myVodafone
	          <input type="text"  id="search" value="search">
	    </h2>
	  </section>
	  
	  
	  
	  
	  </div></div>
	  
	  <div id="content" class="content">
	    <section class="sidebar"> 
	      <!-- This adds a sidebar with 1 searchbox,2 menusets, each with 4 links -->
	      <div id="menubar">
	        <nav class="menu">
	          	<table>
	          		<caption border="1">
						<center><h1><!-- Title for menuset 1 -->My Account</h1></center>
	          			<hr>
	          		</caption>
	          		<tbody>
	          		<tr>
	          			<td>
	          				<a href="myAccountPage.jsp?option=VAS&type=subscribed">My Subscriptions</a>
	          			</td>
	       		  </tr>
	          		<tr>
	          			<td>
	       				  <a href="myAccountPage.jsp?option=ALLMEDIA&type=download">My Collections</a>
	          			</td>
	       		  </tr>
	          		<tr>
	          			<td>
	       				  <a href="viewMonthlyBill.jsp">View My Bill</a>
	          			</td>
	       		  </tr>
	       		  </tbody>
	          	</table>
	        </nav>
	      </div>
	
	      <div id="menubar">
	        <nav class="menu">
	          <center>
	          	<table>
	          		<caption>
						<center><h1><!-- Title for menuset 1 --> Monthly Subscriptions</h1></center>
	          			<hr>
	          		</caption>
	          		<tbody>
	          		<tr>
	          			<td>
	       				  <a href="myAccountPage.jsp?option=VAS&type=unsubscribed">Value Added Services</a>
	          			</td>
	       		  </tr>
	       		  </tbody>
	          	</table>
	          </center>
	        </nav>
	      </div>
	      
	      <div id="menubar">
	        <nav class="menu">
	          <center>
	          	<table>
	          		<caption>
						<center><h1><!-- Title for menuset 1 --> Media Store</h1></center>
	          			<hr>
	          		</caption>
	          		<tbody>
	          		<tr>
	          			<td>
	       				  <a href="myAccountPage.jsp?option=GAMES">Games & Apps</a>
	          			</td>
	       		  </tr>
	          		<tr>
	          			<td>
	       				  <a href="myAccountPage.jsp?option=MOVIES">Movies</a>
	          			</td>
	       		  </tr>
	          		<tr>
	          			<td>
	       				  <a href="myAccountPage.jsp?option=MUSIC">Music</a>
	          			</td>
	       		  </tr>
	          		<tr>
	          			<td>
	          				<a href="myAccountPage.jsp?option=TV">TV Shows</a>
	          			</td>
	       		  </tr>
	       		  </tbody>
	          	</table>
	          </center>
	        </nav>
	      </div>	      
	
	    </section>
	    </div>	  
	  
	  
	  <div>
	  
	  <section class="mainContent">
	  
	  
	  
	  	<iframe class="billView" src="myBill.html"></iframe>
	  		
	  
	  
	  
	  </section>
	  
	  </div>
	  
	  </div>
	  
	  </form>
	  
	  </body></html>
	  
	  