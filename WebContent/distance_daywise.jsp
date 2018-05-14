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
<link href="css/jquery-ui.min.css" rel="stylesheet" />
<link href="css/main.css" rel="stylesheet" />
<link href="css/topmenu.css" rel="stylesheet" />
<script src="js/jquery.min.js"></script>
<script src="js/jquery-ui.min.js"></script>
<script type="text/javascript">

function toggle(source) {
    var checkboxes = document.querySelectorAll('input[type="checkbox"]');
    for (var i = 0; i < checkboxes.length; i++) {
        if (checkboxes[i] != source)
            checkboxes[i].checked = source.checked;
    }
}



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
			html += '<th>Vehicle No</th>';
			html += '<th>Date</th>';
			html += '<th>Distance</th>';
			html += '<th>Commulative Total</th>';
			html += '</tr>';
			$.each(response, function(k,v){
				var vehicleno = null ;
				var date = null;
				var distance = null;
				var commulativetotal =null;
				
				
				
				html += '<tr>';
				html += '<td><div class="report_vehicleno">'+vehicleno+'</div></td>';
				html += '<td><div class="report_location">'+date+'</div></td>';
				html += '<td><div class="report_haltedfrom">'+distance+'</div></td>';
				html += '<td><div class="report_haltedtill">'+commulativetotal+'</div></td>';
				
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
	
	//date picker
	$("#dt1").datepicker({
	            dateFormat: "dd-M-yy",
	            minDate: 0,
	            onSelect: function () {
	                var dt2 = $('#dt1');
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
	                dt2.datepicker('option', 'maxDate', startDate);
	                dt2.datepicker('option', 'minDate', minDate);
	            }
	        });
	        $('#dt2').datepicker({
	            dateFormat: "dd-M-yy",
	            minDate: 0,
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
	                dt2.datepicker('option', 'maxDate', startDate);
	                dt2.datepicker('option', 'minDate', minDate);
	            }
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
<div>
<input type="checkbox" onclick="toggle(this);" />Select All<br/>
<input type="checkbox" />Bar 1<br />
<input type="checkbox" />Bar 2<br />
<input type="checkbox" />Bar 3<br />
<input type="checkbox" />Bar 4<br />
<input type="checkbox" />Bar 5<br />
<input type="checkbox" />Bar 6<br />
<input type="checkbox" />Bar 7<br />
<input type="checkbox" />Bar 8<br />

</div>	



	
	<nav> 
	
	<span><b>Date Range</b></span><br>
	<table cellpadding="0" cellspacing="0">


     <tbody><tr>
     <td>
     <span>From Date</span>
      </td>
     </tr>
     <tr>
      <td>
     <input  type="text" id="dt1" maxlength="18" size="10" onclick="" readonly="readonly" onfocus="this.blur()" tabindex="1" placeholder="dd-mm-yyyy">
       <a  id="dt1"> 
       <img height="12" src="images/Calendar_Icon.svg.png" width="18" class="ImageColor">
       </a>
          </td>
       </tr>
       
       
     <tr >
       <td >
       <span>To Date</span>
       </td>
       </tr>
        <tr >
      <td >
      <input type="text" id="dt2" maxlength="18" size="10" onclick="" readonly="readonly" onfocus="this.blur()" tabindex="2" placeholder="dd-mm-yyyy">
       <a  id="dt2">
       <img height="12" src="images/Calendar_Icon.svg.png" width="18" class="ImageColor">
       </a>
       </td>
       </tr>
        <tr >
       <td >
      <table border="0">
		<tbody><tr>
			<td><input type="radio" name="a" value="" checked><label >Day Wise</label></td><td><input  type="radio" name="a" value=""><label>Periodic</label></td>
		</tr>
	</tbody></table>
        </td>
        </tr>
 <tr >
      <td >
   <input type="submit"value="Search" onclick="return validate();" tabindex="4" title="Search" >
   <input type="submit" value="Reset" onclick="return uncheckall();" tabindex="5" title="Reset" >

    </td>
   </tr>

  </tbody>
  </table>
	
	
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