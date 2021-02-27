import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'getWeather.dart';
import 'package:weather_icons/weather_icons.dart';
import 'weatherCurrentLocation.dart';
import 'package:intl/intl.dart';
import 'infoWeatherCard.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'contentOfSplashPage.dart';

class WeatherPage extends StatefulWidget {
  static const TextStyle KTextStyle =
  TextStyle(fontSize: 35, color: Colors.white, fontWeight: FontWeight.bold);

  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  Future<dynamic> futureWeatherCurrentLocation;
  String anotherLocation;
  var msgController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var now = new DateTime.now();
    var formatter = new DateFormat('dd-MM-yyyy');
    String formattedTime = DateFormat('kk:mm a').format(now);
    String formattedDate = formatter.format(now);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image:AssetImage('assets/images/background.jpeg') ,
                  fit: BoxFit.cover),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InfoWeatherCard(anotherLocation),
                Flexible(
                    flex: 1,
                    child: SizedBox(
                      height: 20,
                    )),
                Flexible(
                  flex: 9,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextField(
                      controller: msgController,
                      autofocus: false,
                      autocorrect: true,
                      cursorColor: Colors.cyan,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white54,

                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white, //this has no effect
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        hintText: "Location ...",
                        hintStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12.0)),
                          borderSide: BorderSide(color: Colors.cyan),
                        ),

                      ),
                      onSubmitted: (text) {
                        setState(() {
                          anotherLocation = text;
                          msgController.clear();
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}