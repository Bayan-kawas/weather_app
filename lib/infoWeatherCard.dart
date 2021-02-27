import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'getWeather.dart';
import 'contentOfSplashPage.dart';
class InfoWeatherCard extends StatelessWidget {
String anotherLocation;
InfoWeatherCard(this.anotherLocation);
  @override

  static const TextStyle KTextStyle =
  TextStyle(fontSize: 35, color: Colors.white, fontWeight: FontWeight.bold);
  Future<dynamic> futureWeatherCurrentLocation;
  @override
  Widget build(BuildContext context) {

      futureWeatherCurrentLocation=getWeather(anotherLocation);

    var now = new DateTime.now();
    var formatter = new DateFormat('dd-MM-yyyy');
    String formattedTime = DateFormat('kk:mm:a').format(now);
    String formattedDate = formatter.format(now);
    return FutureBuilder(
      future: futureWeatherCurrentLocation
      ,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey[400],
                            blurRadius: 7.0,
                          ),
                        ]),
                    child: Icon(
                      Icons.place,
                      size: 25,
                      color: Colors.cyan,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "${snapshot.data.cityName}",
                    style: TextStyle(
                      color: Colors.cyan,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                '$formattedTime  $formattedDate',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  color: Colors.white54,
                  child: new Card(
                    elevation: 0,
                    color: Colors.transparent,
                    child: new Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '${snapshot.data.temp.toString()}°c',
                              style: TextStyle(
                                  fontSize: 35,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.orange
                              ),
                            ),
                            Image.network(
                                "http://openweathermap.org/img/wn/${snapshot.data.iconWeather}@2x.png"),
                          ],
                        ),
                        Text(
                          snapshot.data.statusWeather,
                          style:KTextStyle,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Max: ${snapshot.data.temp_max.toString()}°",
                              style: TextStyle(
                                  fontSize: 15
                              ),
                            ),
                            SizedBox(width: 10),
                            Text(
                              "Min: ${snapshot.data.temp_min.toString()}°", style: TextStyle(
                                fontSize: 15
                            ),),
                            SizedBox(width: 20),
                            Text(
                              "Wind Speed: ${snapshot.data.windSpeed.toString()} Km/h", style: TextStyle(
                                fontSize: 15
                            ),),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return CircularProgressIndicator();
      },
    );
  }
}
