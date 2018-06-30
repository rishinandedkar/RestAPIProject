$(document).ready(function () {
    $("#submitWeather").click()(function () {
        var city = $("#city").val();

        if(city != ""){
          $.ajax({
            url: 'http://api.openweathermap.org/data/2.5/weather?q=' + city + "&units=metric" +  + "&APPID=019c05e566a6d852354e05f13265437b",
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
