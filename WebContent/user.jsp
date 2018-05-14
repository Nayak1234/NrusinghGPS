<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%  
    String email=session.getAttribute("email").toString();  
    String password=session.getAttribute("password").toString();  
%>
<title>Nrusingh GPS</title>
<link href="css/main.css" rel="stylesheet" />
<link href="css/topmenu.css" rel="stylesheet" />
<script src="js/jquery.min.js"></script>
<script type="text/javascript">
	
	
</script>

</head>
<body>
	<div class="container">
		<!-- top panel -->
		<header>
		<div><img src="images/logo1.png" style="width: 100px;"></div>
		<div style="margin-top: -95px; margin-left: 180px;"><h1><a href="login" style="text-decoration: none;color: white;">NRUSiNGH GPS TRACKER</a></h1></div>
		
		<div style="float: right; margin-top: -40px;">
			<form action="logout" id="frm_logout" name="frm_logout">
				<span style="font-weight: 900; text-transform:  uppercase;"><%= session.getAttribute("email") %></span>
				<input type="submit" value="Logout" style="border: none;background-color: transparent;text-decoration: underline;cursor: pointer; font-size: 11px;" />
			</form>
		</div>
		<jsp:include page="menu.jsp" />
		</header><br>
		<!-- top panel ends -->








<!-- user table -->


<table style="width: 100%">
 <tbody><tr>
 <td> 
 <table style="width: 100%;">
 <tbody>
 <tr>
 <td style="width: 20Px; padding-left: 5px;">
 <input type="checkbox" id="chkAllItems" onclick="CheckAll()">
 </td>
 <td>Admin Id</td>
 <td>User Id</td>
 <td >Email Id</td>
 <td>Refresh Time</td>
 </tr>
<tr>
 <td style="width: 20Px; padding-left: 5px";>
 <input  type="checkbox"  onclick="return validatecheck();">
</td>
 <td style="width: 150Px" >Asset</td>
 <td ><a href="user_details.jsp">demo</a></td>
<td>demo@gmail.com</td>
<td>60</td>
</tr>
</tbody></table>
</td> </tr>
<tr>
<td style="width: 100%;">
 <div>
<table style="width: 100%; height: 28px;">
 <tbody><tr>
 <td style="width: 40%; font-family: Arial; font-size: 12px;font-weight:normal;">
 <table>
 <tbody><tr>
  <td style="padding-left: 5px;">
 <span>Records per page</span>
  &nbsp;
 </td>
 <td>
 <select name="">
		<option selected="selected" value="10">10</option>
		<option value="20">20</option>
		<option value="30">30</option>
		<option value="40">40</option>
		<option value="50">50</option>
		<option value="60">60</option>
		<option value="70">70</option>
		<option value="80">80</option>
		<option value="90">90</option>
		<option value="100">100</option>

	</select>
 </td>
 </tr>
  </tbody></table>
  </td>
 <td style="width: 60%"></td>
<td>
<table  style="font-family: Arial; font-size: 11px;">
 <tbody><tr>
 <td style="padding-left: 5px; padding-right: 5px;color:#353535;font-family:Arial;font-size:12px;font-weight:normal;">
  Pages
 </td>
 <td style="padding-left: 5px; padding-right: 5px;">
 <input type="image" name="" id="" disabled="disabled" src="images/backward_arrow.png" style="width:17px;border-width:0px;">
 </td>
 <td>
 <table style="border-collapse:collapse;">
<tbody><tr>
<td align="center">
  <table cellpadding="0" cellspacing="0" style="border: solid 1px #B3B3B3;text-align:center;">
 <tbody><tr>
<td>
  <a  style="display:inline-block;background-color:#D8D8D8;width:20px;height:15px;text-decoration:none;color:#353535;font-family:Arial;font-size:12px;">1</a>
   </td>
</tr>
  </tbody></table>
 </td>
</tr>
</tbody></table>
 </td> 
 <td style="padding-left: 5px; padding-right: 5px;">
 <input type="image" name="" id="" disabled="disabled" src="images/forward_arrow.png" style="border-width:0px;width: 17px">
    </td>
   </tr>
 </tbody></table>
 </td>
  </tr>
</tbody></table>
 </div>

 </td>
  </tr>
 </tbody></table>

<!-- user table ends -->





        <!-- left panel -->
		<nav> 
		
		</nav>
		<!-- left panel ends -->

		<!-- right panel -->
		<article> <!-- <p><a href="map.jsp">Map</a></p> -->
		<!-- <div id="div_map">
			<div id="loader_map" style="disply: none;">
				<img id="loader_img_map" alt="Loding ..." src="images/loader.gif" />
			</div>
		</div> -->
		</article>
		<!-- right panel ends -->

		<!-- buttom panel -->
		<footer><div style="text-align: center"> Copyright &copy; Nrusingha nath Nayak</div></footer>
		<!-- buttom panel ends -->
	</div>
</body>
</html>