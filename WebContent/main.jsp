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

		<!-- left panel -->
		<nav> 
		
		</nav>
		<!-- left panel ends -->

		<!-- right panel -->
		<article> <!-- <p><a href="map.jsp">Map</a></p> -->
		<div class="image" style="background:url(images/1.png) no-repeat; background-size: 500px 230px; height: 500px; width: 100%;"> 
		<div style="margin-left: 25%;padding-top: 50px;">
			<div style="font-size: 30px;font-weight: bold;color:  green;">DASH BOARD</div>
			<div style="background-color: green;width: 164px;padding: 10px;font-size: 15px;font-weight: bold;"><a href="live_tracking" style="text-decoration: none;color: white;">GO TO LIVE TRACKING</a></div>
		</div>
		</article>
		<!-- right panel ends -->

		<!-- buttom panel -->
		<footer><div style="text-align: center"> Copyright &copy; Nrusingha nath Nayak</div></footer>
		<!-- buttom panel ends -->
	</div>
</body>
</html>