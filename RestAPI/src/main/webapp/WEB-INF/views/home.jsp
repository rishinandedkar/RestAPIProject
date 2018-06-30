<html>
  <head>
    <title>Weather API Demo</title>

  </head>

<body>
  <div class="col-md-offset-3"></div>
  <div class="col-md-9">
    <h2>Get the current weather of your city</h2>
  </div>

  <p>Some changes</p>

  Enter City name: <input id="city" type="text" name="cityName" value=""><span id="error"></span>
  <button type="button" id="submitWeather">Submit</button>

  
</body>
<script
			  src="https://code.jquery.com/jquery-3.3.1.js"
			  integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
			  crossorigin="anonymous"></script>
			  
			  
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
	              console.log(data);
	          }
	          });
	        }
	        else {
	          $("#error").html('Field cannot be empty');
	        }
		 })
	});

  </script>
</html>
