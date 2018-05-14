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








<!-- user detail table -->

<table style="width: 100%">
 <tbody><tr>
 <td style="width:50%;padding-left:0px;">
 <table cellpadding="0" cellspacing="10" class="c_table">
 <tbody><tr>
 <td>
<span>Name</span>
</td>
 <td>
  &nbsp;
</td>
 <td>
 <input type="text" value="Demo" maxlength="30"  onkeypress="" style="width:152px;">
 </td>
 </tr>
 <tr>
 <td><span>AdminId</span></td>
  <td> &nbsp; </td>
  <td>
  <select disabled="disabled" style="width:157px;">
<option selected="selected" value="Asset">Asset</option>
</select>
</td>
</tr>
<tr>
<td>
<span>UserId</span>
 </td>
 <td><span>*</span></td>
 <td>
 <input type="text" value="demo" readonly="readonly" style="width:152px;">
 </td>
</tr>
<tr>
<td ><span>Password</span></td>
 <td>
    <span id="" class="">*</span>
  </td>
 <td>
<input type="text" value="123456" style="width:152px;">
 </td>
 </tr>
<tr >
 <td ><span>MailId</span></td>
<td ><span id="" class="">*</span></td>
<td >
 <input type="text" value="demo@gmail.com"  style="width:152px;">
 </td></tr>
  <tr>
  <td>
  <span>MobileNo</span>
  </td>
  <td > &nbsp; </td>
  <td >
  <input type="text" value="123456987" maxlength="15"  onkeypress="" style="width:152px;">
    </td>
 </tr>
 <tr>
  <td > <span>Refresh Time</span></td>
 <td ><span id="" class="">*</span></td>
  <td>
  <input type="text" value="60" maxlength="3" onkeypress="" style="width:152px;">
</td></tr>
 <tr>
 </tr>
 <tr>
 <td colspan="3">
 <input type="submit" value="Modify" onclick="" style="width:90px;position:relative;top: 1px; left: 0px;">
 <input type="submit"  value="Back" style="width:90px;position: relative; top: 1px; left: 0px;">
 </td>
</tr>
 <tr>
<td colspan="3"></td>
 </tr>
 </tbody></table>
</td>
 <td align="left" height="25" style="width:60%; height: 50px; text-align: left; vertical-align: top;">
                                               
                                                                    
 <table style="width: 100%;"cellpadding="0" cellspacing="0">
 <tbody><tr>
<td style="width:10px">
<input type="checkbox" onclick="CheckAll()">
 </td>
 <td style="width:90Px">
<span>Permissions</span>
</td>
</tr>
 <tr>
<td style="width:10px">
<input type="checkbox"  onclick="return validatecheck();">
 </td>
<td style="width:90Px">
<span>Alert</span>                                             
</td></tr>
 <tr>
<td style="width:10px">
<input type="checkbox" onclick="return validatecheck();">
 
 </td>
 <td style="width:90Px">
 <span>Change Password</span>                                             
                                                                                             
</td></tr>
 <tr>
<td style="width:10px" class="boxTd">
<input  type="checkbox"  onclick="return validatecheck();">
 </td>
 <td style="width:90Px" class="boxTd">
<span>MailScheduler</span>                                             
                                                                                             
</td></tr>
</tbody></table>
 </td></tr>
 </tbody></table>


<!-- user details table ends -->





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