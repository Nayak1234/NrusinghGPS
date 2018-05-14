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
<link href="css/tablestyle.css" rel="stylesheet" />
<script src="js/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		var eml = '<%= email%>';
		//alert(eml);
		$('#loader_map').hide();
		var url = '';
		//url = 'http://23.92.61.79:8082/api/devices/';
		var position_url = 'http://23.92.61.79:8082/api/positions/';
		var device_url = 'http://23.92.61.79:8082/api/devices';
		
		var username = "admin";
		var password = "admin";

		$('#loader_left').show();
		$.ajax({
			type: 'get',
			url: device_url,
			headers: {
				"Accept": "application/json",         
				"Content-Type": "application/json",
				"Authorization": "Basic " + btoa(username + ":" + password)
			},
			'dataType': 'json',
			success: function (response) {
				console.log('Success: '+JSON.stringify(response));
				var html =  '';
				html += '<div>';
				html += '<table id="mytable" style="width: 100%;">';
				html += '<tr>';
				html += '<th>Device Name</th>';
				html += '<th>SIM No.</th>';
				html += '<th>Status</th>';
				html += '<th>Unique id</th>';
				html += '<th>Category</th>';
				html += '</tr>';
				$.each(response, function(k,v){
					var id = v.id;
					var name = v.name;
					var uniqueId = v.uniqueId;
					var status = v.status;
					var category = v.category;
					var phone = v.phone;
					
					html += '<tr>';
					html += '<td><a href="#"><div class="device_details_name" style="color: grey;">'+name+'</div></a></td>';
					html += '<td><div class="device_details_othr">'+phone+'</div></td>';
					html += '<td><div class="device_details_othr">'+status+'</div></td>';
					html += '<td><div class="device_details_othr">'+uniqueId+'</div></td>';
					html += '<td><div class="device_details_othr">'+category+'</div></td>';
					html += '</tr>';
					//$("#ul_device_list").append($(" <li class='device_li' id='"+id+"^"+uniqueId+"^"+name+"^"+status+"'> ").html(html));
				});
				html += '</table>';
				html += '</div>';
				$('#div_device_list').html('');
				$('#div_device_list').html(html);
				$('#loader_left').hide();
			},
			error: function(response){
				alert('Error: '+JSON.stringify(response));
				$('#loader_left').hide();
			}
		});
		
		$(document).on("click", "#ul_device_list li", function(event) {
	      var li_id = $(this).attr('id');
	      var id = li_id.split('^')[0];
	      var uniqueId = li_id.split('^')[1];
	      var name = li_id.split('^')[2];
	      var status = li_id.split('^')[3];
	      $('#loader_map').show();
	      $.ajax({
				async:false,
				cache:false,
				dataType:"json",
				type: "POST",  
				url: "map.jsp",
				data:{id:id,uniqueId:uniqueId,name:name,status:status},
				success: function (response) {
					$('#loader_map').hide();
					console.log('Success: ');
					$('#div_map').html("");
					$('#div_map').html(response.responseText);
				},
				error: function (response) {
					$('#loader_map').hide();
					console.log('Error: ');
					$('#div_map').html("");
					$('#div_map').html(response.responseText);
				}
			});
	    });
		
	});
	
	
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

		<!-- left panel -->
		<nav> 
		
		</nav>
		<!-- left panel ends -->

		<!-- right panel -->
		<article> 
			<div id="loader_left">
				<img id="loader_img_left" alt="Loding ..." src="images/loader.gif" />
			</div>
			<!-- <ul id="ul_device_list"></ul> -->
			<div id="div_device_list"></div>
		</article>
		<!-- right panel ends -->

		<!-- buttom panel -->
		<footer><div style="text-align: center"> Copyright &copy; Nrusingha nath Nayak</div></footer>
		<!-- buttom panel ends -->
	</div>
</body>
</html>