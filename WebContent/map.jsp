<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Nrusingh GPS</title>
<%  
    String id_devices=request.getParameter("id");  
    String uniqueId_devices=request.getParameter("uniqueId"); 
    String name_devices=request.getParameter("name"); 
    String status_devices=request.getParameter("status"); 
    String email = session.getAttribute("email").toString();
    String password = session.getAttribute("password").toString();
 %> 
<script src="https://maps.google.com/maps/api/js?sensor=false&libraries=geometry&v=3.22&key=AIzaSyAwhtPukjfFu0p8p7KtAToIuLjqSQJmThM"></script>
<script src="js/jquery.min.js"></script>
<script src="js/maplace.min.js"></script>
<script type="text/javascript">
	var test = [];
	$(function() {
		var id_devices = '<%= id_devices %>';
		var deviceId_devices = '<%= uniqueId_devices %>';
		var name_devices = '<%= name_devices %>';
		var status_devices = '<%= status_devices %>';
		var email = '<%= email %>';
		var password = '<%= password %>';
		//alert("id_devices: "+id_devices+"  --  deviceId_devices: "+deviceId_devices);
		var position_url = 'http://23.92.61.79:8082/api/positions/';
		$.ajax({
			type: 'get',
			url: position_url,
			headers: {
				"Accept": "application/json",         
				"Content-Type": "application/json",
				"Authorization": "Basic " + btoa(email + ":" + password)
			},
			'dataType': 'json',
			success: function (response) {
				console.log('Success: '+JSON.stringify(response));
				$.each(response, function(k,v){
					var id_positions = v.id,
					deviceId_positions= v.deviceId,
				    _type= v.type,
				    _protocol= v.protocol,
				    _serverTime= v.serverTime,
				    _deviceTime= v.deviceTime,
				    _fixTime= v.fixTime,
				    _outdated= v.outdated,
				    _valid= v.valid,
				    _latitude= v.latitude,
				    _longitude= v.longitude,
				    _altitude= v.altitude,
				    _speed= v.speed,
				    _course= v.course,
				    _address= v.address,
				    _accuracy= v.accuracy,
				    _network= v.network;
					//alert("id_positions: "+id_positions+"  --  deviceId_positions: "+deviceId_positions);
					if(id_devices == deviceId_positions){
						new Maplace({
							locations: [{"lat":_latitude,"lon":_longitude,"title":name_devices,"html":"<h1>"+name_devices+"</h1><br>"+status_devices,"icon":""}]
							//,locations : test,
							//,map_div: '#gmap-polyline',
							//,controls_div: '#controls-polyline'
							,controls_type : 'list'
							,controls_on_map : false
							,view_all_text : 'Start'
							,type : 'polyline' 
							,map_options: {
				                zoom: 16,
				                controls_on_map: false
				             }
						}).Load(); 
					}
					
					
				});
				$('#loader_left').hide();
			},
			error: function(response){
				alert('Error: '+JSON.stringify(response));
				$('#loader_left').hide();
			}
		});
		
		
		
		
		/*$('#btn_locate').on('click', function() {
			var deviceid = $('#txt_deviceid').val();
			alert(deviceid);
			
			
			 if (deviceid == null || deviceid == undefined
					|| deviceid.length <= 0) {
				alert('Enter a valid Device ID');
			} else {
				$.ajax({
					url : '../services/gpsalllocationservice.php',
					data : "",
					dataType : 'json',
					success : function(data) {
						//alert(data.length)
						$.each(data, function(index, value) {
							var temp_obj = {};
							temp_obj["lat"] = value[0];
							temp_obj["lon"] = value[1];
							temp_obj["title"] = '',
									temp_obj["html"] = '',
									temp_obj["zoom"] = 22,
									temp_obj["icon"] = ''
							test[index] = temp_obj;
						});
						//alert(JSON.stringify(test));	
						new Maplace({
							//locations: [{"lat":"20.3458377","lon":"85.8233476","title":"","html":"","zoom":8,"icon":""},{"lat":"20.3458377","lon":"85.8233476","title":"","html":"","zoom":8,"icon":""},{"lat":"20.3553074","lon":"85.8273524","title":"","html":"","zoom":8,"icon":""},{"lat":"20.3541784","lon":"85.8268995","title":"","html":"","zoom":8,"icon":""},{"lat":"20.3516373","lon":"85.8260807","title":"","html":"","zoom":8,"icon":""},{"lat":"20.3457986","lon":"85.8233062","title":"","html":"","zoom":8,"icon":""},{"lat":"20.3457986","lon":"85.8233062","title":"","html":"","zoom":8,"icon":""},{"lat":"20.3457986","lon":"85.8233062","title":"","html":"","zoom":8,"icon":""},{"lat":"20.3458499","lon":"85.8233477","title":"","html":"","zoom":8,"icon":""},{"lat":"20.345838","lon":"85.8233458","title":"","html":"","zoom":8,"icon":""},{"lat":"20.3458517","lon":"85.8233478","title":"","html":"","zoom":8,"icon":""},{"lat":"20.345866","lon":"85.8233828","title":"","html":"","zoom":8,"icon":""}],
							locations : test,
							//map_div: '#gmap-polyline',
							//controls_div: '#controls-polyline',
							controls_type : 'list',
							controls_on_map : false,
							view_all_text : 'Start',
							type : 'polyline'
						}).Load();
					}
				});
			} 
		});*/
	});
</script>
</head>
<body>
	<div id="gmap" style="with: 400px; height: 400px;"></div>
	<!--<div id="controls"></div>
<div id="controls-polyline"></div>
<div id="gmap-polyline"></div>
-->
</body>
</html>
