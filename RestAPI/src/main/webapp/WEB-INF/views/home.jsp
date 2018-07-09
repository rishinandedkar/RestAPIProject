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
    <input id="city" class="form-control" type="text" name="cityName" value="" placeholder="Enter the city name">
     <button type="button" class="btn btn-success btn-lg" id="submitWeather">Submit</button><span id="error"></span>
     </div>
    </div>
    </div>
    
    <hr>
			<center><h2>Weather Report <span id="cityName"></span></h2></center>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-6">
			 <div class="panel panel-default">
              <!-- <div  class="panel-heading" ><span id="cityName"></span></div> -->
               <div class="panel-body">
               	 <div class="col-md-9">
               		<p>Current Temperature:<span id="minTemp"></span></p>
               		<p>Description:<span id="description"></span></p>
               	</div>
               	<div class="col-md-3">
               		<span id="show"></span>
               	</div>
               </div>
             </div>
  <hr>
			</div>
			
			<div class="col-md-6">
			 <div class="panel panel-default">
<!--               <div  class="panel-heading" >Wind and Humidity Information</div>
 -->               <div class="panel-body">
               	<p>Wind Speed:<span id="windSpeed"></span></p>
               	<p>Humidity:<span id="humidity"></span></p>
               	<p>Atmospheric Pressure:<span id="pressure"></span></p>
               	
               </div>
             </div>
             </div>
             
             
              <div class="col-md-12">
			 <div class="panel panel-default">
              <div  class="panel-heading" >Other Important Information</div>
               <div class="panel-body">
               	<p><span>Cloudiness:<span id="cloudiness"></span></span> | <span>Sunrise Time:<span id="sunRise"></span></span> | <span>Sunset Time:<span id="sunSet"></span></span>
               </div>
             </div>
             </div>

			

</div>
</div>
  
<div id="news"></div>


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
					/* console.log(data); */
					document.getElementById("cityName").innerHTML = "of&nbsp" + data.name + "," +data.sys.country;
					document.getElementById("minTemp").innerHTML = data.main.temp + "&nbspCelsius";
					document.getElementById("windSpeed").innerHTML = data.wind.speed+ "&nbspmeters/second";
					document.getElementById("humidity").innerHTML = data.main.humidity + "%";
					document.getElementById("pressure").innerHTML = data.main.pressure + "&nbsphPa";
					document.getElementById("cloudiness").innerHTML = data.clouds.all + "%";
					
					var sec = data.sys.sunrise;
					var date = new Date(sec * 1000);
					var timestr = date.toLocaleTimeString();
					
					document.getElementById("sunRise").innerHTML = timestr;
					
					var secc = data.sys.sunset;
					var datec = new Date(secc * 1000);
					var timestrc = datec.toLocaleTimeString();
					
					document.getElementById("sunSet").innerHTML = timestrc;
					document.getElementById("description").innerHTML = data.weather[0].description;
					
					document.getElementById("news").innerHTML = response.docs[0].headline.print_headline;

					
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
	  return "<img src='http://openweathermap.org/img/w/"+data.weather[0].icon+".png'\ width=\'87px'>";

  }

  
  var url = "https://api.nytimes.com/svc/search/v2/articlesearch.json";
  url += '?' + $.param({
    'api-key': "7a919279504f45e6a1623364fab82fad",
    'q': "Boston"
  });
  $.ajax({
    url: url,
    method: 'GET',
  }).done(function(result) {
    console.log(result);
  }).fail(function(err) {
    throw err;
  }); 
  
  </script>
</html>
