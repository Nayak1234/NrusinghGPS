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
<link href="css/jquery-ui.css" rel="stylesheet" />
<link href="css/jquery-ui-timepicker-addon.css" rel="stylesheet" media="all" type="text/css" />
<link href="css/main.css" rel="stylesheet" />
<link href="css/topmenu.css" rel="stylesheet" />
<link href="css/tablestyle.css" rel="stylesheet" />

<script src="js/jquery.min.js"></script>
<script src="js/jquery-ui.min1.11.0.js"></script>
<script src="js/jquery-ui-timepicker-addon.js" type="text/javascript"></script>
<script src="js/jquery-ui-sliderAccess.js" type="text/javascript"></script>
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
		$('#div_left_menu').hide();
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
				$.each(response, function(k,v){
					var id = v.id;
					var name = v.name;
					var uniqueId = v.uniqueId;
					var status = v.status;
					
					var html = '';
					if(status == 'offline')
						html = "<option id='"+id+"^"+uniqueId+"^"+name+"^"+status+"' disabled>"+name+"</option> ";
					else
						html = "<option id='"+id+"^"+uniqueId+"^"+name+"^"+status+"'>"+name+"</option> ";
						
					$("#select_device_list").append(html);
				});
				$('#loader_left').hide();
				$('#div_left_menu').show();
			},
			error: function(response){
				alert('Error: '+JSON.stringify(response));
				$('#loader_left').hide();
				$('#div_left_menu').show();
			}
		});
		
		$(document).on("click", "#btn_show_history", function(event) {
			$('#loader_map').show();
	      	var li_id = $("#select_device_list").children(":selected").attr("id");
			//alert($("#select_device_list").children(":selected").attr("id"));
	      	var id = li_id.split('^')[0];
	      	var uniqueId = li_id.split('^')[1];
	      	var name = li_id.split('^')[2];
	      	var status = li_id.split('^')[3];
	      	
	      	var fromdatestr = $('#dt1').val();
	      	var todatestr   = $('#dt2').val();
	      	if(fromdatestr == null || fromdatestr == undefined || fromdatestr.length <= 0
	      			|| todatestr == null || todatestr == undefined || todatestr.length <= 0){
	      		alert('Wrong date format !!!');
	      	}else{
	      		var from = getISOdate(fromdatestr); 
	      		var to   = getISOdate(todatestr); 
	      		
	      		var url = "http://23.92.61.79:8082/api/positions?deviceId="+id+"&from="+from+"&to="+to+"";
	      		//alert(url);
	      		$.ajax({
					async:false,
					cache:false,
					dataType:"json",
					type: "get",  
					//url: "http://23.92.61.79:8082/api/positions?deviceId=1&from=2018-05-09T00:00:00.000Z&to=2018-05-09T23:59:59.000Z",
					url: url,
					//data:{id:id,uniqueId:uniqueId,name:name,status:status},
					headers: {
						"Accept": "application/json",         
						"Content-Type": "application/json",
						"Authorization": "Basic " + btoa(username + ":" + password)
					},
					'dataType': 'json',
					success: function (response) {
						$('#loader_map').hide();
						//console.log('Success: '+JSON.stringify(response));
						var html = '';
						html += '<div>';
						html += '<table id="mytable" style="width: 100%;">';
						html += 	'<tr>';
						html += 		'<th>Device Id</th>';
						html += 		'<th>Distance</th>';
						html += 		'<th>Motion</th>';
						html += 		'<th>Server Time</th>';
						html += 		'<th>Latitude</th>';
						html += 		'<th>Longitude</th>';
						html += 		'<th>Altitude</th>';
						html += 		'<th>Speed</th>';
						html += 		'<th>View</th>';
						html += 	'</tr>';
						$.each(response, function(k,v){
							var id = v.id;
							var deviceId = v.deviceId;
							var distance = v.attributes.distance;
							var motion = v.attributes.motion;
							var serverTime = v.serverTime;
							var latitude = v.latitude;
							var longitude = v.longitude;
							var altitude = v.altitude;
							var speed = v.speed;
							
							html += 	'<tr>';
							html += 		'<td>'+deviceId+'</td>';
							html += 		'<td>'+distance+'</td>';
							html += 		'<td>'+motion+'</td>';
							html += 		'<td>'+serverTime+'</td>';
							html += 		'<td>'+latitude+'</td>';
							html += 		'<td>'+longitude+'</td>';
							html += 		'<td>'+altitude+'</td>';
							html += 		'<td>'+speed+'</td>';
							html += 		'<td></td>';
							html += 	'</tr>';
						});
						
						html += '</table>';
						html += '</div>';
						$('#div_data').html("");
						$('#div_data').html(html);
					},
					error: function (response) {
						$('#loader_map').hide();
						console.log('Error: ');
						$('#div_data').html("");
						$('#div_data').html(JSON.stringify(response));
					}
				});
	      	}
	    });
		
		
		
		// date picker
		$("#dt1").datetimepicker({
			dateFormat: "yy-mm-dd",
            timeFormat: "HH:mm",
            //ampm:false,
            //pick12HourFormat: false,
            //use24hours: true,
            showSecond:false,
            showMillisec: false,
            showMicrosec: false,
            maxDate: 0,
            onSelect: function () {
                var dt2 = $('#dt2');
                var startDate = $(this).datepicker('getDate');
                var minDate = $(this).datepicker('getDate');
                var dt2Date = dt2.datepicker('getDate');
                //difference in days. 86400 seconds in day, 1000 ms in second
                var dateDiff = (dt2Date - minDate)/(86400 * 1000);
                
                startDate.setDate(startDate.getDate() + 30);
                if (dt2Date == null || dateDiff < 0) {
                		dt2.datepicker('setDate', minDate);
                }
                else if (dateDiff > 30){
                		dt2.datepicker('setDate', startDate);
                }
                //sets dt2 maxDate to the last day of 30 days window
                //dt2.datepicker('option', 'maxDate', startDate);
                dt2.datepicker('option', 'maxDate', 0);
                dt2.datepicker('option', 'minDate', minDate);
            }
        });
        $('#dt2').datetimepicker({
        	dateFormat: "yy-mm-dd",
            timeFormat: "HH:mm",
            minDate: 0
        }); 
	});
	function getISOdate(date){
		var ISOdate = '';
		var datedt = new Date(date);
      	var yr = 1900+datedt.getYear(); 
      	var mn = 1+datedt.getMonth(); 
      	var dt = datedt.getDate(); 
      	var hr = datedt.getHours(); 
      	var mi = datedt.getMinutes(); 
      	
      	
      	var year = ''+yr;
      	var mnth = (mn < 10)?'0'+mn:''+mn;
      	var date = (dt < 10)?'0'+dt:''+dt;
      	var hour = (hr < 10)?'0'+hr:''+hr;
      	var mint = (mi < 10)?'0'+mi:''+mi;
      	var scnd = '00'; 
      	ISOdate = year+'-'+mnth+'-'+date+'T'+hour+':'+mint+':'+scnd+'.000Z';
		return ISOdate;
	}
	
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
			<div id="loader_left">
				<img id="loader_img_left" alt="Loding ..." src="images/loader.gif" />
			</div>
			<div id="div_left_menu">
				<table>
					<tr>
						<td>Devices</td>
						<td><select id="select_device_list" name="select_device_list"></select></td>
					</tr>
				
					<tr>
						<td>From</td>
						<td><input type="text" id="dt1" style="width: 136px;"></td>
					</tr>
				
					<tr>
					<td>To</td>
					<td><input type="text" id="dt2" style="width: 136px;"></td>
					</tr>
				
					<tr>
						<td></td>
						<td><input type="button" id="btn_show_history" value="SHOW" /></td>
					</tr>
				</table>
			</div>
		</nav>
		<!-- left panel ends -->

		<!-- right panel -->
		<article> <!-- <p><a href="map.jsp">Map</a></p> -->
		<div id="div_map">
			<div id="loader_map" style="disply: none;">
				<img id="loader_img_map" alt="Loding ..." src="images/loader.gif" />
			</div>
			<div id="div_data" style=" overflow: auto; height:350px;"></div>
		</div>
		</article>
		<!-- right panel ends -->

		<!-- buttom panel -->
		<footer><div style="text-align: center"> Copyright &copy; Nrusingha nath Nayak</div></footer>
		<!-- buttom panel ends -->
	</div>
</body>
</html>