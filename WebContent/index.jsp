<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Nrusingh GPS</title>
<link href="css/index.css" rel="stylesheet" />
<script src="js/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		$('#txt_submit').on('click', function(){
			url = "http://23.92.61.79:8082/api/session";
			var email_id = $('#txt_email_id').val();
			var password = $('#txt_password').val();
			if(email_id == undefined || email_id.trim().length <= 0 || password == undefined || password.trim().length <= 0){
				$('#div_response').html("");
				$('#div_response').html("Invalid Email ID or Password");
			}else{
				$.ajax({
					async:false,
					cache:false,
					dataType:"json",
					type: "POST",  
					url: url,
					async: false,
					data:{email:email_id,password:password},
					success: function (response) {
						console.log('Success: '+JSON.stringify(response));
						$('#div_response').html("");
						$('#div_response').html("Login success.Please wait...");
						//window.location.href = 'main.jsp';
						//$(location).attr('href', 'main.jsp');
						
						// submit the form
						$('form').attr('action','login');
						$('form').submit();
					},
					error: function (response) {
						console.log('Error: '+JSON.stringify(response));
						$('#div_response').html("");
						$('#div_response').html("There has been an error.");
					}
				});
			}
		});
	});
</script>
</head>
<body>
	<div class="box-outer">
		<div class="box-inner">
			<div class="heading">NRUSiNGHA GPS TRACKER</div>
			<table>
				<tr>
					<td>
						<img src="images/gps.png" class="imag" />
					</td>
					<td>
						<form action="IndexServlet" method="post">
							<table>
								<tr>
									<td>eMail Id</td>
									<td><div><input type="text" id="txt_email_id" name="txt_email_id" placeholder="Email Id" class="txt" /></div></td>
								</tr>
								<tr>
									<td>Password</td>
									<td><div><input type="password" id="txt_password" name="txt_password" placeholder="Password" class="txt" /></div></td>
								</tr>
								<tr>
									<td></td>
									<td><div class="box-btn"><input type="button" id="txt_submit" name="txt_submit" value="Login" class="btn" /></div></td>
								</tr>
							</table>
						</form>
					</td>
				</tr>
				<tr>
					<td></td>				
					<td><div id="div_response">.</div></td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>