import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:excelapp/UI/Screens/SplashScreen/splashscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Locks Device Orientation
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    // Set status bar color
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Color(0x07000033)));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Excel 2022',
      theme: ThemeData(
        fontFamily: 'mulish',
        primarySwatch: Colors.blue,
        appBarTheme: AppBarTheme(brightness: Brightness.light,backgroundColor: Color(0xffe4edef)),
      ),
      home: Splashscreen(),
    );
  }
}
