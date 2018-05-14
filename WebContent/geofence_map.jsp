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


<!--  table for geofence -->

<table style="width:100%;height:100%;">
<tbody><tr>

 <td style="width:70%" align="left" valign="top">
<div id="map" style="height: 500px; width: 100%; border: 1px solid rgb(183, 183, 183); position: relative; overflow: hidden;">
<div style="height: 100%; width: 100%; position: absolute; top: 0px; left: 0px; background-color: rgb(229, 227, 223);">
<!--  <div class="gm-style" style="position: absolute; z-index: 0; left: 0px; top: 0px; height: 100%; width: 100%; padding: 0px; border-width: 0px; margin: 0px;">
<div tabindex="0" style="position: absolute; z-index: 0; left: 0px; top: 0px; height: 100%; width: 100%; padding: 0px; border-width: 0px; margin: 0px; cursor: url(&quot;http://maps.gstatic.com/mapfiles/openhand_8_8.cur&quot;), default; touch-action: none;">
<div style="z-index: 1; position: absolute; left: 50%; top: 50%; transform: translate(0px, 0px);">
<div style="position: absolute; left: 0px; top: 0px; z-index: 100; width: 100%;"><div style="position: absolute; left: 0px; top: 0px; z-index: 0;"><div style="position: absolute; z-index: 1; transform: matrix(1, 0, 0, 1, -160, -227);"><div style="position: absolute; left: 256px; top: 0px; width: 256px; height: 256px;"><div style="width: 256px; height: 256px;"></div></div><div style="position: absolute; left: 0px; top: 0px; width: 256px; height: 256px;">
<div style="width: 256px; height: 256px;"></div>
<div style="position: absolute; left: 0px; top: -256px; width: 256px; height: 256px;">
<div style="width: 256px; height: 256px;"></div>
<div style="position: absolute; left: 256px; top: -256px; width: 256px; height: 256px;">
<div style="width: 256px; height: 256px;"></div>
<div style="position: absolute; left: 512px; top: -256px; width: 256px; height: 256px;"><div style="width: 256px; height: 256px;"></div></div><div style="position: absolute; left: 512px; top: 0px; width: 256px; height: 256px;"><div style="width: 256px; height: 256px;"></div></div><div style="position: absolute; left: 512px; top: 256px; width: 256px; height: 256px;"><div style="width: 256px; height: 256px;"></div></div><div style="position: absolute; left: 256px; top: 256px; width: 256px; height: 256px;"><div style="width: 256px; height: 256px;"></div></div><div style="position: absolute; left: 0px; top: 256px; width: 256px; height: 256px;"><div style="width: 256px; height: 256px;"></div></div><div style="position: absolute; left: -256px; top: 256px; width: 256px; height: 256px;"><div style="width: 256px; height: 256px;"></div></div><div style="position: absolute; left: -256px; top: 0px; width: 256px; height: 256px;"><div style="width: 256px; height: 256px;"></div></div><div style="position: absolute; left: -256px; top: -256px; width: 256px; height: 256px;"><div style="width: 256px; height: 256px;"></div></div></div></div></div><div style="position: absolute; left: 0px; top: 0px; z-index: 101; width: 100%;"><div style="position: absolute; left: 0px; top: 0px; z-index: 30;"><div style="position: absolute; z-index: 1; transform: matrix(1, 0, 0, 1, -160, -227);"><div style="width: 256px; height: 256px; position: absolute; left: 256px; top: 0px;"></div><div style="width: 256px; height: 256px; position: absolute; left: 0px; top: 0px;"><canvas width="256" height="256" draggable="false" style="width: 256px; height: 256px; user-select: none; position: absolute; left: 0px; top: 0px;"></canvas></div><div style="width: 256px; height: 256px; position: absolute; left: 0px; top: -256px;"></div><div style="width: 256px; height: 256px; position: absolute; left: 256px; top: -256px;"></div><div style="width: 256px; height: 256px; position: absolute; left: 512px; top: -256px;"></div><div style="width: 256px; height: 256px; position: absolute; left: 512px; top: 0px;"></div><div style="width: 256px; height: 256px; position: absolute; left: 512px; top: 256px;"></div><div style="width: 256px; height: 256px; position: absolute; left: 256px; top: 256px;"></div><div style="width: 256px; height: 256px; position: absolute; left: 0px; top: 256px;"></div><div style="width: 256px; height: 256px; position: absolute; left: -256px; top: 256px;"></div><div style="width: 256px; height: 256px; position: absolute; left: -256px; top: 0px;"></div><div style="width: 256px; height: 256px; position: absolute; left: -256px; top: -256px;"></div></div></div></div><div style="position: absolute; left: 0px; top: 0px; z-index: 102; width: 100%;"></div><div style="position: absolute; left: 0px; top: 0px; z-index: 103; width: 100%;"><div style="position: absolute; left: 0px; top: 0px; z-index: -1;"><div style="position: absolute; z-index: 1; transform: matrix(1, 0, 0, 1, -160, -227);"><div style="width: 256px; height: 256px; overflow: hidden; position: absolute; left: 256px; top: 0px;"></div><div style="width: 256px; height: 256px; overflow: hidden; position: absolute; left: 0px; top: 0px;"></div><div style="width: 256px; height: 256px; overflow: hidden; position: absolute; left: 0px; top: -256px;"></div><div style="width: 256px; height: 256px; overflow: hidden; position: absolute; left: 256px; top: -256px;"></div><div style="width: 256px; height: 256px; overflow: hidden; position: absolute; left: 512px; top: -256px;"></div><div style="width: 256px; height: 256px; overflow: hidden; position: absolute; left: 512px; top: 0px;"></div><div style="width: 256px; height: 256px; overflow: hidden; position: absolute; left: 512px; top: 256px;"></div><div style="width: 256px; height: 256px; overflow: hidden; position: absolute; left: 256px; top: 256px;"></div><div style="width: 256px; height: 256px; overflow: hidden; position: absolute; left: 0px; top: 256px;"></div><div style="width: 256px; height: 256px; overflow: hidden; position: absolute; left: -256px; top: 256px;"></div><div style="width: 256px; height: 256px; overflow: hidden; position: absolute; left: -256px; top: 0px;"></div><div style="width: 256px; height: 256px; overflow: hidden; position: absolute; left: -256px; top: -256px;"></div></div></div></div><div style="position: absolute; left: 0px; top: 0px; z-index: 0;"><div style="position: absolute; z-index: 1; transform: matrix(1, 0, 0, 1, -160, -227);"><div style="position: absolute; left: 256px; top: 0px; width: 256px; height: 256px;"><img draggable="false" alt="" src="http://maps.googleapis.com/maps/vt?pb=!1m5!1m4!1i9!2i368!3i230!4i256!2m3!1e0!2sm!3i421121892!3m9!2sen-US!3sUS!5e18!12m1!1e68!12m3!1e37!2m1!1ssmartmaps!4e0!23i1301875&amp;token=7736" style="width: 256px; height: 256px; user-select: none; border: 0px; padding: 0px; margin: 0px; max-width: none;"></div><div style="position: absolute; left: 0px; top: 0px; width: 256px; height: 256px;"><img draggable="false" alt="" src="http://maps.googleapis.com/maps/vt?pb=!1m5!1m4!1i9!2i367!3i230!4i256!2m3!1e0!2sm!3i421121892!3m9!2sen-US!3sUS!5e18!12m1!1e68!12m3!1e37!2m1!1ssmartmaps!4e0!23i1301875&amp;token=91516" style="width: 256px; height: 256px; user-select: none; border: 0px; padding: 0px; margin: 0px; max-width: none;"></div><div style="position: absolute; left: 0px; top: -256px; width: 256px; height: 256px;"><img draggable="false" alt="" src="http://maps.googleapis.com/maps/vt?pb=!1m5!1m4!1i9!2i367!3i229!4i256!2m3!1e0!2sm!3i421121892!3m9!2sen-US!3sUS!5e18!12m1!1e68!12m3!1e37!2m1!1ssmartmaps!4e0!23i1301875&amp;token=56869" style="width: 256px; height: 256px; user-select: none; border: 0px; padding: 0px; margin: 0px; max-width: none;"></div><div style="position: absolute; left: 256px; top: -256px; width: 256px; height: 256px;"><img draggable="false" alt="" src="http://maps.googleapis.com/maps/vt?pb=!1m5!1m4!1i9!2i368!3i229!4i256!2m3!1e0!2sm!3i421121892!3m9!2sen-US!3sUS!5e18!12m1!1e68!12m3!1e37!2m1!1ssmartmaps!4e0!23i1301875&amp;token=104160" style="width: 256px; height: 256px; user-select: none; border: 0px; padding: 0px; margin: 0px; max-width: none;"></div><div style="position: absolute; left: 512px; top: -256px; width: 256px; height: 256px;"><img draggable="false" alt="" src="http://maps.googleapis.com/maps/vt?pb=!1m5!1m4!1i9!2i369!3i229!4i256!2m3!1e0!2sm!3i421121872!3m9!2sen-US!3sUS!5e18!12m1!1e68!12m3!1e37!2m1!1ssmartmaps!4e0!23i1301875&amp;token=26303" style="width: 256px; height: 256px; user-select: none; border: 0px; padding: 0px; margin: 0px; max-width: none;"></div><div style="position: absolute; left: 512px; top: 0px; width: 256px; height: 256px;"><img draggable="false" alt="" src="http://maps.googleapis.com/maps/vt?pb=!1m5!1m4!1i9!2i369!3i230!4i256!2m3!1e0!2sm!3i421121892!3m9!2sen-US!3sUS!5e18!12m1!1e68!12m3!1e37!2m1!1ssmartmaps!4e0!23i1301875&amp;token=55027" style="width: 256px; height: 256px; user-select: none; border: 0px; padding: 0px; margin: 0px; max-width: none;"></div><div style="position: absolute; left: 512px; top: 256px; width: 256px; height: 256px;"><img draggable="false" alt="" src="http://maps.googleapis.com/maps/vt?pb=!1m5!1m4!1i9!2i369!3i231!4i256!2m3!1e0!2sm!3i421121892!3m9!2sen-US!3sUS!5e18!12m1!1e68!12m3!1e37!2m1!1ssmartmaps!4e0!23i1301875&amp;token=59848" style="width: 256px; height: 256px; user-select: none; border: 0px; padding: 0px; margin: 0px; max-width: none;"></div><div style="position: absolute; left: 256px; top: 256px; width: 256px; height: 256px;"><img draggable="false" alt="" src="http://maps.googleapis.com/maps/vt?pb=!1m5!1m4!1i9!2i368!3i231!4i256!2m3!1e0!2sm!3i421121892!3m9!2sen-US!3sUS!5e18!12m1!1e68!12m3!1e37!2m1!1ssmartmaps!4e0!23i1301875&amp;token=12557" style="width: 256px; height: 256px; user-select: none; border: 0px; padding: 0px; margin: 0px; max-width: none;"></div><div style="position: absolute; left: 0px; top: 256px; width: 256px; height: 256px;"><img draggable="false" alt="" src="http://maps.googleapis.com/maps/vt?pb=!1m5!1m4!1i9!2i367!3i231!4i256!2m3!1e0!2sm!3i421121892!3m9!2sen-US!3sUS!5e18!12m1!1e68!12m3!1e37!2m1!1ssmartmaps!4e0!23i1301875&amp;token=96337" style="width: 256px; height: 256px; user-select: none; border: 0px; padding: 0px; margin: 0px; max-width: none;"></div><div style="position: absolute; left: -256px; top: 256px; width: 256px; height: 256px;"><img draggable="false" alt="" src="http://maps.googleapis.com/maps/vt?pb=!1m5!1m4!1i9!2i366!3i231!4i256!2m3!1e0!2sm!3i421121892!3m9!2sen-US!3sUS!5e18!12m1!1e68!12m3!1e37!2m1!1ssmartmaps!4e0!23i1301875&amp;token=49046" style="width: 256px; height: 256px; user-select: none; border: 0px; padding: 0px; margin: 0px; max-width: none;"></div><div style="position: absolute; left: -256px; top: 0px; width: 256px; height: 256px;"><img draggable="false" alt="" src="http://maps.googleapis.com/maps/vt?pb=!1m5!1m4!1i9!2i366!3i230!4i256!2m3!1e0!2sm!3i421121892!3m9!2sen-US!3sUS!5e18!12m1!1e68!12m3!1e37!2m1!1ssmartmaps!4e0!23i1301875&amp;token=44225" style="width: 256px; height: 256px; user-select: none; border: 0px; padding: 0px; margin: 0px; max-width: none;"></div><div style="position: absolute; left: -256px; top: -256px; width: 256px; height: 256px;"><img draggable="false" alt="" src="http://maps.googleapis.com/maps/vt?pb=!1m5!1m4!1i9!2i366!3i229!4i256!2m3!1e0!2sm!3i421121892!3m9!2sen-US!3sUS!5e18!12m1!1e68!12m3!1e37!2m1!1ssmartmaps!4e0!23i1301875&amp;token=9578" style="width: 256px; height: 256px; user-select: none; border: 0px; padding: 0px; margin: 0px; max-width: none;"></div></div></div></div><div class="gm-style-pbc" style="z-index: 2; position: absolute; height: 100%; width: 100%; padding: 0px; border-width: 0px; margin: 0px; left: 0px; top: 0px; opacity: 0;"><p class="gm-style-pbt"></p></div><div style="z-index: 3; position: absolute; height: 100%; width: 100%; padding: 0px; border-width: 0px; margin: 0px; left: 0px; top: 0px; touch-action: pan-x pan-y;"><div style="z-index: 1; position: absolute; height: 100%; width: 100%; padding: 0px; border-width: 0px; margin: 0px; left: 0px; top: 0px;"></div><div style="z-index: 4; position: absolute; left: 50%; top: 50%; transform: translate(0px, 0px);"><div style="position: absolute; left: 0px; top: 0px; z-index: 104; width: 100%;"></div><div style="position: absolute; left: 0px; top: 0px; z-index: 105; width: 100%;"></div><div style="position: absolute; left: 0px; top: 0px; z-index: 106; width: 100%;"></div><div style="position: absolute; left: 0px; top: 0px; z-index: 107; width: 100%;"><div style="z-index: -202; cursor: pointer; display: none; touch-action: none;"><div style="width: 30px; height: 27px; overflow: hidden; position: absolute;"><img alt="" src="http://maps.gstatic.com/mapfiles/undo_poly.png" draggable="false" style="position: absolute; left: 0px; top: 0px; user-select: none; border: 0px; padding: 0px; margin: 0px; max-width: none; width: 90px; height: 27px;"></div></div></div></div></div></div><iframe frameborder="0" src="about:blank" style="z-index: -1; position: absolute; width: 100%; height: 100%; top: 0px; left: 0px; border: none;"></iframe><div style="margin-left: 5px; margin-right: 5px; z-index: 1000000; position: absolute; left: 0px; bottom: 0px;"><a target="_blank" href="https://maps.google.com/maps?ll=17.385044,78.486671&amp;z=9&amp;t=m&amp;hl=en-US&amp;gl=US&amp;mapclient=apiv3" title="Click to see this area on Google Maps" style="position: static; overflow: visible; float: none; display: inline;"><div style="width: 66px; height: 26px; cursor: pointer;"><img alt="" src="http://maps.gstatic.com/mapfiles/api-3/images/google4.png" draggable="false" style="position: absolute; left: 0px; top: 0px; width: 66px; height: 26px; user-select: none; border: 0px; padding: 0px; margin: 0px;"></div></a></div><div style="background-color: white; padding: 15px 21px; border: 1px solid rgb(171, 171, 171); font-family: Roboto, Arial, sans-serif; color: rgb(34, 34, 34); box-shadow: rgba(0, 0, 0, 0.2) 0px 4px 16px; z-index: 10000002; display: none; width: 256px; height: 148px; position: absolute; left: 204px; top: 160px;"><div style="padding: 0px 0px 10px; font-size: 16px;">Map Data</div><div style="font-size: 13px;">Map data ©2018 Google</div><div style="width: 13px; height: 13px; overflow: hidden; position: absolute; opacity: 0.7; right: 12px; top: 12px; z-index: 10000; cursor: pointer;"><img alt="" src="http://maps.gstatic.com/mapfiles/api-3/images/mapcnt6.png" draggable="false" style="position: absolute; left: -2px; top: -336px; width: 59px; height: 492px; user-select: none; border: 0px; padding: 0px; margin: 0px; max-width: none;"></div></div><div class="gmnoprint" style="z-index: 1000001; position: absolute; right: 166px; bottom: 0px; width: 121px;"><div draggable="false" class="gm-style-cc" style="user-select: none; height: 14px; line-height: 14px;"><div style="opacity: 0.7; width: 100%; height: 100%; position: absolute;"><div style="width: 1px;"></div><div style="background-color: rgb(245, 245, 245); width: auto; height: 100%; margin-left: 1px;"></div></div><div style="position: relative; padding-right: 6px; padding-left: 6px; font-family: Roboto, Arial, sans-serif; font-size: 10px; color: rgb(68, 68, 68); white-space: nowrap; direction: ltr; text-align: right; vertical-align: middle; display: inline-block;"><a style="text-decoration: none; cursor: pointer; display: none;">Map Data</a><span>Map data ©2018 Google</span></div></div></div><div class="gmnoscreen" style="position: absolute; right: 0px; bottom: 0px;"><div style="font-family: Roboto, Arial, sans-serif; font-size: 11px; color: rgb(68, 68, 68); direction: ltr; text-align: right; background-color: rgb(245, 245, 245);">Map data ©2018 Google</div></div><div class="gmnoprint gm-style-cc" draggable="false" style="z-index: 1000001; user-select: none; height: 14px; line-height: 14px; position: absolute; right: 95px; bottom: 0px;"><div style="opacity: 0.7; width: 100%; height: 100%; position: absolute;"><div style="width: 1px;"></div><div style="background-color: rgb(245, 245, 245); width: auto; height: 100%; margin-left: 1px;"></div></div><div style="position: relative; padding-right: 6px; padding-left: 6px; font-family: Roboto, Arial, sans-serif; font-size: 10px; color: rgb(68, 68, 68); white-space: nowrap; direction: ltr; text-align: right; vertical-align: middle; display: inline-block;"><a href="https://www.google.com/intl/en-US_US/help/terms_maps.html" target="_blank" style="text-decoration: none; cursor: pointer; color: rgb(68, 68, 68);">Terms of Use</a></div></div><button draggable="false" title="Toggle fullscreen view" aria-label="Toggle fullscreen view" type="button" style="background: none rgb(255, 255, 255); border: 0px; margin: 10px 14px; padding: 0px; position: absolute; cursor: pointer; user-select: none; top: 0px; right: 0px;"></button><div draggable="false" class="gm-style-cc" style="user-select: none; height: 14px; line-height: 14px; position: absolute; right: 0px; bottom: 0px;"><div style="opacity: 0.7; width: 100%; height: 100%; position: absolute;"><div style="width: 1px;"></div><div style="background-color: rgb(245, 245, 245); width: auto; height: 100%; margin-left: 1px;"></div></div><div style="position: relative; padding-right: 6px; padding-left: 6px; font-family: Roboto, Arial, sans-serif; font-size: 10px; color: rgb(68, 68, 68); white-space: nowrap; direction: ltr; text-align: right; vertical-align: middle; display: inline-block;"><a target="_blank" rel="noopener" title="Report errors in the road map or imagery to Google" href="https://www.google.com/maps/@17.385044,78.486671,9z/data=!10m1!1e1!12b1?source=apiv3&amp;rapsrc=apiv3" style="font-family: Roboto, Arial, sans-serif; font-size: 10px; color: rgb(68, 68, 68); text-decoration: none; position: relative;">Report a map error</a></div></div><div class="gmnoprint gm-bundled-control gm-bundled-control-on-bottom" draggable="false" controlwidth="28" controlheight="93" style="margin: 10px; user-select: none; position: absolute; bottom: 107px; right: 28px;"><div class="gmnoprint" controlwidth="28" controlheight="55" style="position: absolute; left: 0px; top: 38px;"><div draggable="false" style="user-select: none; box-shadow: rgba(0, 0, 0, 0.3) 0px 1px 4px -1px; border-radius: 2px; cursor: pointer; background-color: rgb(255, 255, 255); width: 28px; height: 55px;"><button draggable="false" title="Zoom in" aria-label="Zoom in" type="button" style="background: none; display: block; border: 0px; margin: 0px; padding: 0px; position: relative; cursor: pointer; user-select: none; width: 28px; height: 27px; top: 0px; left: 0px;"><div style="overflow: hidden; position: absolute; width: 15px; height: 15px; left: 7px; top: 6px;"><img alt="" src="http://maps.gstatic.com/mapfiles/api-3/images/tmapctrl.png" draggable="false" style="position: absolute; left: 0px; top: 0px; user-select: none; border: 0px; padding: 0px; margin: 0px; max-width: none; width: 120px; height: 54px;"></div></button><div style="position: relative; overflow: hidden; width: 67%; height: 1px; left: 16%; background-color: rgb(230, 230, 230); top: 0px;"></div><button draggable="false" title="Zoom out" aria-label="Zoom out" type="button" style="background: none; display: block; border: 0px; margin: 0px; padding: 0px; position: relative; cursor: pointer; user-select: none; width: 28px; height: 27px; top: 0px; left: 0px;"><div style="overflow: hidden; position: absolute; width: 15px; height: 15px; left: 7px; top: 6px;"><img alt="" src="http://maps.gstatic.com/mapfiles/api-3/images/tmapctrl.png" draggable="false" style="position: absolute; left: 0px; top: -15px; user-select: none; border: 0px; padding: 0px; margin: 0px; max-width: none; width: 120px; height: 54px;"></div></button></div></div><div class="gm-svpc" controlwidth="28" controlheight="28" style="background-color: rgb(255, 255, 255); box-shadow: rgba(0, 0, 0, 0.3) 0px 1px 4px -1px; border-radius: 2px; width: 28px; height: 28px; cursor: url(&quot;http://maps.gstatic.com/mapfiles/openhand_8_8.cur&quot;), default; touch-action: none; position: absolute; left: 0px; top: 0px;"><div style="position: absolute; left: 1px; top: 1px;"></div><div style="position: absolute; left: 1px; top: 1px;"><div aria-label="Street View Pegman Control" style="width: 26px; height: 26px; overflow: hidden; position: absolute; left: 0px; top: 0px;"><img alt="" src="http://maps.gstatic.com/mapfiles/api-3/images/cb_scout5.png" draggable="false" style="position: absolute; left: -147px; top: -26px; width: 215px; height: 835px; user-select: none; border: 0px; padding: 0px; margin: 0px; max-width: none;"></div><div aria-label="Pegman is on top of the Map" style="width: 26px; height: 26px; overflow: hidden; position: absolute; left: 0px; top: 0px; visibility: hidden;"><img alt="" src="http://maps.gstatic.com/mapfiles/api-3/images/cb_scout5.png" draggable="false" style="position: absolute; left: -147px; top: -52px; width: 215px; height: 835px; user-select: none; border: 0px; padding: 0px; margin: 0px; max-width: none;"></div><div aria-label="Street View Pegman Control" style="width: 26px; height: 26px; overflow: hidden; position: absolute; left: 0px; top: 0px; visibility: hidden;"><img alt="" src="http://maps.gstatic.com/mapfiles/api-3/images/cb_scout5.png" draggable="false" style="position: absolute; left: -147px; top: -78px; width: 215px; height: 835px; user-select: none; border: 0px; padding: 0px; margin: 0px; max-width: none;"></div></div></div><div class="gmnoprint" controlwidth="28" controlheight="0" style="display: none; position: absolute;"><div title="Rotate map 90 degrees" style="width: 28px; height: 28px; overflow: hidden; position: absolute; background-color: rgb(255, 255, 255); box-shadow: rgba(0, 0, 0, 0.3) 0px 1px 4px -1px; border-radius: 2px; cursor: pointer; display: none;"><img alt="" src="http://maps.gstatic.com/mapfiles/api-3/images/tmapctrl4.png" draggable="false" style="position: absolute; left: -141px; top: 6px; width: 170px; height: 54px; user-select: none; border: 0px; padding: 0px; margin: 0px; max-width: none;"></div><div class="gm-tilt" style="width: 28px; height: 28px; overflow: hidden; position: absolute; background-color: rgb(255, 255, 255); box-shadow: rgba(0, 0, 0, 0.3) 0px 1px 4px -1px; border-radius: 2px; top: 0px; cursor: pointer;"><img alt="" src="http://maps.gstatic.com/mapfiles/api-3/images/tmapctrl4.png" draggable="false" style="position: absolute; left: -141px; top: -13px; width: 170px; height: 54px; user-select: none; border: 0px; padding: 0px; margin: 0px; max-width: none;"></div></div></div><div class="gmnoprint" style="margin: 10px; z-index: 0; position: absolute; cursor: pointer; left: 0px; top: 0px;"><div class="gm-style-mtc" style="float: left; position: relative;"><div role="button" tabindex="0" title="Show street map" aria-label="Show street map" aria-pressed="true" draggable="false" style="direction: ltr; overflow: hidden; text-align: center; position: relative; color: rgb(0, 0, 0); font-family: Roboto, Arial, sans-serif; user-select: none; font-size: 11px; background-color: rgb(255, 255, 255); padding: 8px; border-bottom-left-radius: 2px; border-top-left-radius: 2px; background-clip: padding-box; box-shadow: rgba(0, 0, 0, 0.3) 0px 1px 4px -1px; min-width: 22px; font-weight: 500;">Map</div><div style="background-color: white; z-index: -1; padding: 2px; border-bottom-left-radius: 2px; border-bottom-right-radius: 2px; box-shadow: rgba(0, 0, 0, 0.3) 0px 1px 4px -1px; position: absolute; left: 0px; top: 29px; text-align: left; display: none;"><div draggable="false" title="Show street map with terrain" style="color: rgb(0, 0, 0); font-family: Roboto, Arial, sans-serif; user-select: none; font-size: 11px; background-color: rgb(255, 255, 255); padding: 6px 8px 6px 6px; direction: ltr; text-align: left; white-space: nowrap;"><span role="checkbox" style="box-sizing: border-box; position: relative; line-height: 0; font-size: 0px; margin: 0px 5px 0px 0px; display: inline-block; background-color: rgb(255, 255, 255); border: 1px solid rgb(198, 198, 198); border-radius: 1px; width: 13px; height: 13px; vertical-align: middle;"><div style="position: absolute; left: 1px; top: -2px; width: 13px; height: 11px; overflow: hidden; display: none;"><img alt="" src="http://maps.gstatic.com/mapfiles/mv/imgs8.png" draggable="false" style="position: absolute; left: -52px; top: -44px; user-select: none; border: 0px; padding: 0px; margin: 0px; max-width: none; width: 68px; height: 67px;"></div></span><label style="vertical-align: middle; cursor: pointer;">Terrain</label></div></div></div><div class="gm-style-mtc" style="float: left; position: relative;"><div role="button" tabindex="0" title="Show satellite imagery" aria-label="Show satellite imagery" aria-pressed="false" draggable="false" style="direction: ltr; overflow: hidden; text-align: center; position: relative; color: rgb(86, 86, 86); font-family: Roboto, Arial, sans-serif; user-select: none; font-size: 11px; background-color: rgb(255, 255, 255); padding: 8px; border-bottom-right-radius: 2px; border-top-right-radius: 2px; background-clip: padding-box; box-shadow: rgba(0, 0, 0, 0.3) 0px 1px 4px -1px; min-width: 40px; border-left: 0px;">Satellite</div><div style="background-color: white; z-index: -1; padding: 2px; border-bottom-left-radius: 2px; border-bottom-right-radius: 2px; box-shadow: rgba(0, 0, 0, 0.3) 0px 1px 4px -1px; position: absolute; right: 0px; top: 29px; text-align: left; display: none;"><div draggable="false" title="Show imagery with street names" style="color: rgb(0, 0, 0); font-family: Roboto, Arial, sans-serif; user-select: none; font-size: 11px; background-color: rgb(255, 255, 255); padding: 6px 8px 6px 6px; direction: ltr; text-align: left; white-space: nowrap;"><span role="checkbox" style="box-sizing: border-box; position: relative; line-height: 0; font-size: 0px; margin: 0px 5px 0px 0px; display: inline-block; background-color: rgb(255, 255, 255); border: 1px solid rgb(198, 198, 198); border-radius: 1px; width: 13px; height: 13px; vertical-align: middle;"><div style="position: absolute; left: 1px; top: -2px; width: 13px; height: 11px; overflow: hidden;"><img alt="" src="http://maps.gstatic.com/mapfiles/mv/imgs8.png" draggable="false" style="position: absolute; left: -52px; top: -44px; user-select: none; border: 0px; padding: 0px; margin: 0px; max-width: none; width: 68px; height: 67px;"></div></span><label style="vertical-align: middle; cursor: pointer;">Labels</label></div></div></div></div></div>--></div></div>  
  </td>
  
  
 <td align="left" style="width:23%;padding-left:10px; margin-left:10px;  text-align: left;   vertical-align: top;">
 <div>
 <div id="header1"></div>
 <div id="left-cont">
<div>
<table style="width: 100%; ">
<tbody><tr>
<td>
<table>
<tbody><tr>
<td align="left" width="100px">
<span  style="display:inline-block;width:100px;">Select Vehicle</span>
 </td>
 <td></td>
 <td align="right" width="150px">
<select style="width:150px;">
	<option value="Select">Select</option>
	<option value="TS 06UB 3555">TS 06UB 3555</option>
	<option value="TS 09UB 5709">TS 09UB 5709</option>
	<option value="TS 09UB 5710">TS 09UB 5710</option>
	<option value="TS 09UB 5791">TS 09UB 5791</option>
	<option value="TS 09UB 5792">TS 09UB 5792</option>
	<option value="TS 09UB 6167">TS 09UB 6167</option>
	<option value="TS 10UA 0926">TS 10UA 0926</option>
	<option value="TS 10UA 9920">TS 10UA 9920</option>

</select>
</td>
</tr>
<tr>
<td>
</td>
<td></td>
<td align="right">
<input type="submit"  value="Search" style="width:120px;">
 </td>
</tr>
<tr>
 <td colspan="4">
 <div>	
<table>
<tbody><tr>
<td align="left">
 <span >Geofence Name</span>
 </td>
  <td align="center"><span >*</span></td>
 <td>
<input  type="text" style="width:150px;">
 </td>
</tr>
 <tr>
 <td align="left">
 <span>Description</span>
 </td>
 <td align="center">
 <span >*</span></td>
 <td>
<input type="text"  style="width:150px;">
</td>
 </tr>
 <tr>
  <td>
 <span>Location</span>
  </td>
<td>
<span>*</span>
 </td>
  <td>
 <textarea rows="2" cols="20"  style="width:150px;"></textarea>
 </td>
</tr>
 <tr>
 <td align="left">
 <span>Latitude</span>
 </td>
<td>
<span>*</span>
 </td>
 <td align="left">
 <input type="text" maxlength="7"  onkeypress="return isNumberKey(event)" style="width:150px;">
 </td>
 </tr>
 <tr>
<td align="left">
   <span >Longitude</span>
 </td>
 <td>
 <span>*</span>
 </td>
<td align="left">
  <input type="text" onkeypress="return isNumberKey(event)" style="width:150px;">
 </td>
 </tr>
<tr>
<td align="left">
<span >Admin</span>
</td>
<td><span>*</span></td>
                                     
<td align="left">
<select style="height:20px;width:156px;">
<option value="Select">Select</option>
<option value="demo">demo</option>

</select>
 </td>
 </tr>
 <tr>
<td align="left">
 <span>Radius</span>
 </td>
 <td>
 <span >*</span>
 </td>
 <td align="left">
                                      
<select style="height:20px;width:156px;">
		<option value="Select">Select</option>
		<option value="100">100</option>
		<option value="200">200</option>
		<option value="300">300</option>
		<option value="400">400</option>
		<option value="500">500</option>
		<option value="600">600</option>
		<option value="700">700</option>
		<option value="800">800</option>
		<option value="900">900</option>
		<option value="1000">1000</option>
		<option value="1100">1100</option>
		<option value="1200">1200</option>
		<option value="1300">1300</option>
		<option value="1400">1400</option>
		<option value="1500">1500</option>
		<option value="1600">1600</option>
		<option value="1700">1700</option>
		<option value="1800">1800</option>
		<option value="1900">1900</option>
		<option value="2000">2000</option>

</select>
</td>
 </tr>
 <tr>
  <td align="left">
<span>GeoFenceType</span>
 </td>
 <td>
  <span>*</span>
 </td>
<td align="left">
<select style="height:20px;width:156px;">
		<option value="Select">Select</option>
		<option value="1">Depot</option>
		<option value="2">Customer</option>
		<option value="3">FSO</option>
		<option value="4">KLU</option>
		<option value="5">VSE</option>
</select>
 </td>
  </tr>
                               
 </tbody></table>
<!-- <input type="hidden" > -->
            
</div>
 </td>
 </tr>
 <tr>
 <td align="right" valign="top" colspan="3">
<input type="submit"  value="Reset"  style="width:90px;">
 <input type="submit"  value="Add" onclick=""style="width:90px;">
  </td>
  </tr>
 <tr>
  <td align="center" colspan="3">
                                        
 </td>
 </tr>
 </tbody></table>
   </td>
  </tr>
 </tbody></table>
   </div>
 </div>
 </div>
 </td>
</tr>
</tbody></table>


<!--  table for geofence ends -->





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