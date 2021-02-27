import 'dart:async';
import 'package:flutter/material.dart';
import 'weatherPage.dart';

class SplashContent extends StatefulWidget {
  @override
  _SplashContentState createState() => _SplashContentState();
}

class _SplashContentState extends State<SplashContent> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
      Duration(seconds:6),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => WeatherPage(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          body: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image:
                AssetImage('images/splashWeather.jpeg'),
              fit: BoxFit.cover,
              ),
            ),
            child: Column(

              children: [
                SizedBox(height: 90,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Icon(
                    //   Icons.cloud,
                    //   size:40,
                    //   color: Colors.white,
                    // ),
                    // SizedBox(width:10),
                    Text(
                      'Weather ',
                      style: TextStyle(
                        //   fontWeight: FontWeight.bold,
                        fontSize: 40,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'Now',
                      style: TextStyle(
                    //   fontWeight: FontWeight.bold,
                        fontSize: 40,
                        color: Colors.amberAccent,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
