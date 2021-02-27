import 'package:flutter/material.dart';
import 'contentOfSplashPage.dart';
import 'weatherPage.dart';
void main() async {
  runApp(
      MyApp()
  );
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Splash Screen',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: SplashContent(),
      debugShowCheckedModeBanner: false,
    );
  }
}



Widget messageDialog(){
  return AlertDialog(
    title: Text("not found city name"),
  );
}