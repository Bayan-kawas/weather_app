import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'weatherCurrentLocation.dart';
import 'package:geolocator/geolocator.dart';



Position position;
var response;
getCurrentLocation() async{
   position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
}
var key ='c56c22613d997ea6d4651fd2b91713bf';
getWeather(String anotherLocation)async{

  var url;
  if(anotherLocation==null){
    await getCurrentLocation();
    url='api.openweathermap.org/data/2.5/weather?lat=${position.latitude}&lon=${position.longitude}&units=metric&appid=$key';
  }else{
    url='api.openweathermap.org/data/2.5/weather?q=$anotherLocation&units=metric&appid=$key';
  }
   response = await http.get("http://$url");
  print(response.body);
  if(response.statusCode==200){
    return WeatherCurrentLocation.fromJson(jsonDecode(response.body),);
  }
  else{
    throw Exception("City Name Not Found Check Spelling");
  }

}

Widget messageDialog(){
  return AlertDialog(
    title: Text("not found city name"),
  );
}
class Message extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("not found city name"),
    );
  }
}



// Map weatherData=jsonDecode(response.body);
// temp =weatherData['main']['temp'].toInt();
// cityName=weatherData['name'];
// iconWeather=weatherData['weather'][0]['icon'];
// statusWeather=weatherData['weather']['main'];