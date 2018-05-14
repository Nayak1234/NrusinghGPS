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
		</header>
		<!-- top panel ends -->



<!--  mail details table -->

<table border="50" bordercolor="white" cellpadding="0" cellspacing="0"">
<tbody><tr>
<td>
<div>		
 </div></td>
</tr>
 <tr>
<td>
<div align="right">
<input type="submit"  value="Search" tabindex="1"style="width:75px;">
<input type="text" maxlength="50" style="height:20px;width:145px;">      
<input type="hidden"> 
</div><br>

 <div>
<table style="width: 100%" cellpadding="0" cellspacing="0">
<tbody><tr align="center">
<td align="center">
<table style="width:100%;" cellpadding="0" cellspacing="0">
<tbody><tr>
<td style="width: 20px; ">
<input type="checkbox" onclick="">
</td>
<td style="width:200Px;">
<b>Vehicle No
</td>
<td style="width: 100Px; ">
<b>User Name
</td>
<td style="width: 300Px;">
<b>Report Name
</td>
<td style="width: 150Px;">
<b>Email Id
</td>
<td style="width: 50Px;">
</td>
</tr>
 <tr>
 <td style="width: 20px">
 <input type="checkbox" onclick="">
</td>
 <td  style="width:200Px">
<span style="display:inline-block;width:280px;">AP 35V 9921,MH 11M 6063</span>
</td>
 <td style="width:100Px">demo</td>
<td style="width:300Px">Geofence Report, Distance Report</td>
<td style="width:150Px">demo@gmail.com</td>
<td style="width:50Px">
<form action="mail.jsp">
<input type="submit" value="Edit">
</form>
</td>
</tr>
</tbody></table>
<div>
</div>

</td>
</tr>
 <tr>
<td style="width: 100%;">
<div>
<table style="width: 100%; height: 28px;" cellpadding="0" cellspacing="0">
<tbody><tr>
<td style="width: 40%; font-family: Arial; font-size: 14px;font-weight:normal;" align="left">
 <table cellpadding="0" cellspacing="0">
 <tbody><tr>
 <td style="padding-left: 5px;">
 <span>Records per page</span>&nbsp;
</td>
<td>
<select>
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
<td style="width: 60%">
</td>
 <td>
<table style="font-family: Arial; font-size: 11px;" cellpadding="0" cellspacing="0">
<tbody><tr>
<td style="padding-left: 5px; padding-right: 5px;color:#353535;font-family:Arial;font-size:14px;font-weight:normal;">
 Pages
</td>
<td style="padding-left: 5px; padding-right: 5px;">
<input type="image"src="images/backward_arrow.png" style="width:17px;border-width:0px;">
</td>
<td>
 <table cellspacing="0" style="border-collapse:collapse;">
<tbody><tr>
<td align="center">
 <table cellpadding="0" cellspacing="0" style="border: solid 1px #B3B3B3;text-align:center;">
 <tbody><tr>
 <td>
<a style="display:inline-block;background-color:#D8D8D8;width:20px;height:15px;text-decoration:none;color:#353535;font-family:Arial;font-size:12px;">1</a>
 </td>
</tr>
</tbody></table>                                                    
 </td>
</tr>
</tbody></table>
 </td>
<td style="padding-left: 5px; padding-right: 5px;">
<input type="image" src="images/forward_arrow.png" style="border-width:0px;width: 17px">
</td>
</tr>
 </tbody></table>
</td>
</tr>
</tbody></table>
</div>
  </td>
</tr>
</tbody></table>   </div>
<div class="bot_div">
<table cellpadding="0" cellspacing="0" style="width: 100%;">
<tbody><tr>
<td align="right" style="width: 100%;">
<table cellpadding="0" cellspacing="0">
<tbody><tr>
 <td>
</td>
 <td>
<input type="submit"value="Add" style="width:75px;">
</td>
<td style="padding-left: 10px;">
<input type="submit"value="Delete" onclick=""  style="width:80px;">
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

<!--  mail details table ends -->



		<!-- left panel -->
		<nav> 
		
		</nav>
		<!-- left panel ends -->

		<!-- right panel -->
		<article> <!-- <p><a href="map.jsp">Map</a></p> -->
		
		</article>
		<!-- right panel ends -->

		<!-- buttom panel -->
		<footer><div style="text-align: center"> Copyright &copy; Nrusingha nath Nayak</div></footer>
		<!-- buttom panel ends -->
	</div>
</body>
</html>