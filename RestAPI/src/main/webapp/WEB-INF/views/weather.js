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
