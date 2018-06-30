<html>
  <head>
    <title>Weather API Demo</title>
    <script src="https://code.jquery.com/jquery-3.3.1.js" integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60=" crossorigin="anonymous"></script>
    
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

  </head>

<body>

<div class="container-fluid">
  <div class="jumbotron">
    <center><h1>Weather Application</h1>
    <p>Weather report of over 2000 cities from all over the world</p></center>
  </div>
</div>

  <div class="form-group">
  	<div class="row">
  		<div class="col-md-offset-3 col-md-5">
    <input id="city" class="form-control" type="text" name="cityName" value="" placeholder="Enter the city name"><span id="error"></span>
     <button type="button" class="btn btn-success btn-lg" id="submitWeather">Submit</button>
     </div>
    </div>
    </div>
    
    <hr>
	
	<div class="container">
		<div class="row">
			<div class="col-md-5">
		<div class="panel panel-default">
  <div class="panel-body"><h2>Boston</h2></div>
  <hr>
  <img src='http://openweathermap.org/img/w/"+data.weather[0].icon+".png'>
  <!-- //real-time temperature
  //description of weather -->
</div>
</div>

<div class="col-md-5">
	<!-- //main.pressure
	//wind.speed
	//wind.deg
	//clouds.all
	//wind.speed.value
	//visibility.value -->
</div>
</div>
</div>
  
		<!-- api.openweathermap.org/data/2.5/find?q=London&type=accurate&mode=json&APPID="0e289b8f60ce5d3ae3d17b7043d83d00" -->

  <!-- Enter City name: <input id="city" type="text" name="cityName" value="">
  <button type="button" id="submitWeather">Submit</button> -->

  <div id="show"></div>
  
</body>
			  
<script type="text/javascript">
  $(document).ready(function () {
	  

	    $("#submitWeather").click(function (){
	    	
	        var city = $("#city").val();
	        
	        if(city != ""){ 
	         
	        	$.ajax({
	        	  
	            url: 'http://api.openweathermap.org/data/2.5/weather?q=' + city + '&units=metric'  + '&APPID=0e289b8f60ce5d3ae3d17b7043d83d00',
	            type: "GET",
	            dataType:"jsonp",  //javascript object notation pattern

	            success:function(data){
					var widget = showData(data);
					
					$("#show").html(widget);
					$("#city").val("");
	            }
	          });
	        }
	        else {
	          $("#error").html('Field cannot be empty');
	        }
		 })
	});
  
  function showData(data){
	  return "<h3><strong>Weather</strong>:"+data.weather[0].main +"<h3>" +
	         "<h3><strong>Description</strong>:"+data.weather[0].description +"<h3>" ;

  }

  </script>
</html>
