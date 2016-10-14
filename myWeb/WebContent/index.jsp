<%@page import="sun.nio.cs.HistoricallyNamedCharset"%>
<%@page import="java.lang.reflect.Array"%>
<%@page import="model.Forecast"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.City"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0,maximum-scale=1">

<title>Compass Starter by Ariona, Rian</title>

<!-- Loading third party fonts -->
<link href="http://fonts.googleapis.com/css?family=Roboto:300,400,700|"
	rel="stylesheet" type="text/css">
<link href="fonts/font-awesome.min.css" rel="stylesheet" type="text/css">

<!-- Loading main css file -->
<link rel="stylesheet" href="css/style.css">

<!--[if lt IE 9]>
		<script src="js/ie-support/html5.js"></script>
		<script src="js/ie-support/respond.js"></script>
		<![endif]-->
<link rel="stylesheet" href="css/w3.css">
<script src="jsOfMe/index.js"></script>
<style type="text/css">
body {
	background: url(images/background.jpg) no-repeat center center fixed;
	-webkit-background-size: cover;
	-moz-background-size: cover;
	-o-background-size: cover;
	background-size: cover;
}

.forecast-content {
	background: url(images/item.jpg) no-repeat center center fixed;
	-webkit-background-size: cover;
	-moz-background-size: cover;
	-o-background-size: cover;
	background-size: cover;
	border: solid 1px #262936;
	height: 316px;
}

.history {
	margin-left: 150px;
	margin-top: -141px;
}

.btnhis {
	margin-top : 10px;
	margin-left : 5px;
	-moz-box-shadow:inset 0px 0px 0px 0px #bee2f9;
	-webkit-box-shadow:inset 0px 0px 0px 0px #bee2f9;
	box-shadow:inset 0px 0px 0px 0px #bee2f9;
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #afccde), color-stop(1, #a3a4a6) );
	background:-moz-linear-gradient( center top, #afccde 5%, #a3a4a6 100% );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#afccde', endColorstr='#a3a4a6');
	background-color:#afccde;
	-webkit-border-top-left-radius:0px;
	-moz-border-radius-topleft:0px;
	border-top-left-radius:0px;
	-webkit-border-top-right-radius:0px;
	-moz-border-radius-topright:0px;
	border-top-right-radius:0px;
	-webkit-border-bottom-right-radius:0px;
	-moz-border-radius-bottomright:0px;
	border-bottom-right-radius:0px;
	-webkit-border-bottom-left-radius:0px;
	-moz-border-radius-bottomleft:0px;
	border-bottom-left-radius:0px;
	text-indent:0px;
	border:3px solid #3a7ed6;
	display:inline-block;
	color:#ebebeb;
	font-family:Times New Roman;
	font-size:16px;
	font-weight:normal;
	font-style:normal;
	height:80px;
	line-height:65px;
	width:200px;
	text-decoration:none;
	text-align:center;
	text-shadow:0px 0px 0px #cad9e8;
}
.btnhis:hover {
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #a3a4a6), color-stop(1, #afccde) );
	background:-moz-linear-gradient( center top, #a3a4a6 5%, #afccde 100% );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#a3a4a6', endColorstr='#afccde');
	background-color:#a3a4a6;}
.container{
margin-top: 100px;
}
.container{
margin-top: 100px;
}

.localstorage {
	display: block;
}
</style>
<script type="text/javascript">
	function shows() {
		$(document).ready(function(){
			$(".localstorage").hide();
			$("#btnHistory").click(function(){
				
				$(".localstorage").show();
				$("#btnHistory").click(function(){
					$(".localstorage").hide();
					shows();
				});
			});
			
		
		
		});
		
	}

</script>
</head>
<body onload="shows()">
	<%	
		
		ArrayList<String> hit = (ArrayList<String>) request.getAttribute("history");
		
		ArrayList<Forecast> list = new ArrayList();
		boolean check = false;
		City city = (City) request.getAttribute("city");
		if(city!=null){
			list = city.getList();
			check = true;
		}
	%>
	<div class="site-content">
		<div class="site-header" data-bg-image="images/header.jpg">
			<div class="container">
				
					<div class="logo-type">
						<a href="index.jsp" class="branding"><h1 class="site-title">WeatherForecast</h1></a>
					</div>

				<!-- Default snippet for navigation -->

				<div class="mobile-navigation"></div>

			</div>
		</div>
		<!-- .site-header -->


		<div class="hero">
			<div class="container">
				<form action="Location" method="get" class="find-location" 
					id="find-location" name="find-location">
					<input type="text" placeholder="Find your location..."
						name="location" id="point"> <input type="submit" value="Find"
						onclick="return find()">
				</form>
			</div>
			<script type="text/javascript">
				function storage(){
					
					var point = document.getElementById("point").value;
					localStorage.setItem("btn0", point);
					for(var i =1;i<5;i++){
						var btnPoint = localStorage.getItem("btn"+i-1);
						localStorage.setItem("btn"+i, btnPoint);
						
					}
					for(var n = 0;n<5;n++){
						document.getElementById("btnhis"+n).value = localStorage.getItem("btn"+n);
					}
					
				}
				function find() {
					var location = document.forms["find-location"]["location"].value;
					if (location == null || location == "") {
						alert("you must enter location");
						return false;
					}else{
						
					
					return true;
					}
					
					
				}
			</script>
		</div>
		<div class="hero1">
			<div class="container">
				<div>
					<p>GEOLOCATION</p>

					<a href="weatherLocation.html"><button class="btn">
							<p
								style="background: url(images/location.png); height: 64px; width: 64px;"></p>
						</button></a>
					<div class="history">
						<p>HISTORY</p>
						<span id="title"></span>
						<button class="btn" id="btnHistory">
							<p
								style="background: url(images/history.png); height: 64px; width: 64px;"></p>
						</button>
					</div>
					<div class="localstorage">
					
					<%if(check){
						
					for(int i=hit.size()-1;i>hit.size()-6;i--){ 
						String s = hit.get(i);
					%>
						<a href="Location?location=<%=s%>"><button class="btnhis" ><%=s%></button></a>
						
					<%} 
					}%>
					</div>
				</div>
			</div>
		</div>


		<%
			if (check) {
		%>
		<div class="forecast-table">
			<div class="container">
				<div class="forecast-container">
					<div class="today forecast">
						<div class="forecast-header">
							<div class="day" id="day1">TO DAY</div>
							<div class="date" id="date1"><%=list.get(0).getDate()%></div>
						</div>
						<!-- .forecast-header -->
						<div class="forecast-content">
							<div class="location" id="location"><%=city.getName()%></div>
							<div class="degree">
								<div class="num" id="temperature"><%=list.get(0).getTemperature()%><sup>o</sup>C
								</div>
								<div class="forecast-icon">
									<img src=<%=list.get(0).getIcon()%> alt="" width=90>
								</div>
								<div class="forecast-icon" style="margin-top: 10px;">
									<p style="font-size: 20px; color: #bfb8a2; margin-top: 15px;"><%=list.get(0).getScript()%></p>
								</div>
							</div>
							<span><img src="images/icon-umberella.png" alt=""><%=list.get(0).getHumidity()%>%</span>
							<span><img src="images/icon-wind.png" alt=""><%=list.get(0).getWind()%>m/s</span>
							<span><img src="images/icon-compass.png" alt=""></span>
						</div>
					</div>
					<%
						for (int i = 1; i < list.size(); i++) {
					%>

					<div class="forecast">
						<div class="forecast-header">
							<div class="day"><%=list.get(i).getDate()%></div>
						</div>
						<!-- .forecast-header -->
						<div class="forecast-content">
							<div class="forecast-icon">
								<img src=<%=list.get(i).getIcon()%> alt="" width=48>
							</div>
							<div class="forecast-icon">
								<p><%=list.get(i).getScript()%></p>
							</div>
							<div class="degree"><%=list.get(i).getTemperatureMax()%><sup>o</sup>C
							</div>
							<small><%=list.get(i).getTemperatureMin()%><sup>o</sup></small>
						</div>
					</div>
					<%
						}
					%>

				</div>

			</div>
		</div>

		<%
			}
		%>
		<main class="main-content">

		<div class="fullwidth-block" data-bg-color="#262936">
			<div class="container">
				<div class="row">
					<div class="col-md-4">
						<div class="news">
							<div class="date">06.10</div>
							<h3>
								<a href="#">Doloremque laudantium totam sequi </a>
							</h3>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
								Illo saepe assumenda dolorem modi, expedita voluptatum ducimus
								necessitatibus. Asperiores quod reprehenderit necessitatibus
								harum, mollitia, odit et consequatur maxime nisi amet
								doloremque.</p>
						</div>
					</div>
					<div class="col-md-4">
						<div class="news">
							<div class="date">06.10</div>
							<h3>
								<a href="#">Doloremque laudantium totam sequi </a>
							</h3>
							<p>Nobis architecto consequatur ab, ea, eum autem aperiam
								accusantium placeat vitae facere explicabo temporibus minus
								distinctio cum optio quis, dignissimos eius aspernatur fuga.
								Praesentium totam, corrupti beatae amet expedita veritatis.</p>
						</div>
					</div>
					<div class="col-md-4">
						<div class="news">
							<div class="date">06.10</div>
							<h3>
								<a href="#">Doloremque laudantium totam sequi </a>
							</h3>
							<p>Enim impedit officiis placeat qui recusandae doloremque
								possimus, iusto blanditiis, quam optio delectus maiores.
								Possimus rerum, velit cum natus eos. Cumque pariatur beatae
								asperiores, esse libero quas ad dolorem. Voluptates.</p>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="fullwidth-block">
			<div class="container">
				<div class="row">
					<div class="col-md-4">
						<h2 class="section-title">Application features</h2>
						<ul class="arrow-feature">
							<li>
								<h3>Natus error sit voluptatem accusantium</h3>
								<p>Doloremque laudantium totam rem aperiam Inventore
									veritatis et quasi architecto beatae vitae.</p>
							</li>
							<li>
								<h3>Natus error sit voluptatem accusantium</h3>
								<p>Doloremque laudantium totam rem aperiam Inventore
									veritatis et quasi architecto beatae vitae.</p>
							</li>
							<li>
								<h3>Natus error sit voluptatem accusantium</h3>
								<p>Doloremque laudantium totam rem aperiam Inventore
									veritatis et quasi architecto beatae vitae.</p>
							</li>
						</ul>
					</div>
					<div class="col-md-4">
						<h2 class="section-title">Weather analyssis</h2>
						<ul class="arrow-list">
							<li><a href="#">Accusantium doloremque laudantium rem
									aperiam</a></li>
							<li><a href="#">Eaque ipsa quae ab illo inventore
									veritatis quasi</a></li>
							<li><a href="#">Architecto beatae vitae dicta sunt
									explicabo</a></li>
							<li><a href="#">Nemo enim ipsam voluptatem quia voluptas</a></li>
							<li><a href="#">Aspernatur aut odit aut fugit, sed quia
									consequuntur</a></li>
							<li><a href="#">Magni dolores eos qui ratione voluptatem
									sequi</a></li>
							<li><a href="#">Neque porro quisquam est qui dolorem
									ipsum quia</a></li>
						</ul>
					</div>
					<div class="col-md-4">
						<h2 class="section-title">Awesome Photos</h2>
						<div class="photo-grid">
							<a href="#"><img src="images/thumb-1.jpg" alt="#"></a> <a
								href="#"><img src="images/thumb-2.jpg" alt="#"></a> <a
								href="#"><img src="images/thumb-3.jpg" alt="#"></a> <a
								href="#"><img src="images/thumb-4.jpg" alt="#"></a> <a
								href="#"><img src="images/thumb-5.jpg" alt="#"></a> <a
								href="#"><img src="images/thumb-6.jpg" alt="#"></a> <a
								href="#"><img src="images/thumb-7.jpg" alt="#"></a> <a
								href="#"><img src="images/thumb-8.jpg" alt="#"></a> <a
								href="#"><img src="images/thumb-9.jpg" alt="#"></a>
						</div>
					</div>
				</div>
			</div>
		</div>
		</main>
		<!-- .main-content -->

		<footer class="site-footer">
		<div class="container">
			<div class="row">
				<div class="col-md-8">
					<form action="#" class="subscribe-form">
						<input type="text" placeholder="Enter your email to subscribe...">
						<input type="submit" value="Subscribe">
					</form>
				</div>
				<div class="col-md-3 col-md-offset-1">
					<div class="social-links">
						<a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i
							class="fa fa-twitter"></i></a> <a href="#"><i
							class="fa fa-google-plus"></i></a> <a href="#"><i
							class="fa fa-pinterest"></i></a>
					</div>
				</div>
			</div>

			<p class="colophon">Copyright 2014 Company name. Designed by
				Themezy. All rights reserved</p>
		</div>
		</footer>
		<!-- .site-footer -->
	</div>

	<script src="js/jquery-1.11.1.min.js"></script>
	<script src="js/plugins.js"></script>
	<script src="js/app.js"></script>

</body>
</html>