class WeatherCurrentLocation {
  int temp;
  int temp_max;
  int temp_min;
  int windSpeed;
  String cityName;
  String iconWeather;
  String statusWeather;


  WeatherCurrentLocation(
      {this.statusWeather,
      this.cityName,
      this.temp,
      this.iconWeather,
      this.temp_max,
      this.temp_min,
      this.windSpeed});

  factory WeatherCurrentLocation.fromJson(Map<String, dynamic> json) {
    return WeatherCurrentLocation(
      //set the path in json
      cityName: json['name'],
      statusWeather: json['weather'][0]['main'],
      iconWeather: json['weather'][0]['icon'],
      temp: json['main']['temp'].toInt(),
      temp_max: json['main']['temp_max'].toInt(),
      temp_min: json['main']['temp_min'].toInt(),
      windSpeed: json['wind']['speed'].toInt(),
    );
  }
}
