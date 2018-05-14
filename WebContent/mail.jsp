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







<table cellpadding="0" cellspacing="0" style="width: 100%">
<tbody><tr>
<td class="m_tabe_td">
 <table cellpadding="0" cellspacing="10" class="c_table">
  <tbody><tr>
  <td align="left" style="vertical-align:middle;">
  <span id="ctl00_ContentPlaceHolder1_Label11">Report Name</span>
  </td>
 <td align="left" style="vertical-align:middle;">
  <span>*</span>   
  </td>
   <td align="left" style="vertical-align:middle;">
 <div style="width:197px; height:100px;">
 <div style="height:95px;width:197px;overflow:auto;">
<input  type="checkbox"><label>Distance Report</label><br><input  type="checkbox" ><label>Vehicle Summary Report</label><br></span>
                                    
	</div>
    </div>
    </td>
    </tr>
   <tr>
  <td align="left" style="vertical-align:middle;">
   <span >Select User</span>
     </td>
    <td align="left" style="vertical-align:middle;">
   <span>*</span>
   </td>
   <td align="left">
 <select style="width:200px;">
<option selected="selected" value="Select">Select</option>
<option value="demo">demo</option>
</select>
</td>
 </tr>
 <tr>
<td align="left" style="vertical-align:middle;">
  <span >Vehicle No</span>
</td>
 <td align="left" style="vertical-align:middle;">
  <span>*</span>
 </td>
 <td align="left" style="vertical-align:middle;">
  <div style="width:197px">
<div  style="height:95px;width:197px;overflow:auto;">
</div>
</div>
</td>
 </tr>
 <tr>
<td align="left" style="vertical-align:middle;">
   <span >MailId</span>
 </td>
  <td >
   <span >*</span>
 </td>
  <td align="left" style="vertical-align:middle;">
  <input  type="text" style="width:200px;">
   </td>
       </tr>
<tr>
  <td  style="vertical-align:middle;">
  <span >Cc</span>
 </td>
 <td>
   &nbsp;
</td>
 <td align="left" >
   <input  type="text"   style="width:200px;">
  </td>
 </tr>
 <tr>
  <td align="left">
</td>
    <td >
  &nbsp;
   </td>
<td align="left">
   </td>
  </tr>
 <tr>
<td align="left" colspan="3">
  <input type="submit"  value="Add" onclick="return validate();"  style="width:90px;position: relative; top: 1px; left: 13px;">
  &nbsp;&nbsp;&nbsp;&nbsp;
  <input type="submit"  value="Reset"   style="width:90px;">
   <span  style="color:Green;"></span>
 </td>
  </tr>
</tbody></table>
</td>
 </tr>
 </tbody></table>









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