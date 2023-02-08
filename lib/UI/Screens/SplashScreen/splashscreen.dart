import 'package:excelapp/Providers/favouritesProvider.dart';
import 'package:excelapp/Providers/loginStatusProvider.dart';
import 'package:excelapp/Providers/navigationProvider.dart';
import 'package:excelapp/UI/Screens/LandingPage/landingPage.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:excelapp/UI/Components/Navigation/customNavigation.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Services/API/favourites_api.dart';

class Splashscreen extends StatefulWidget {
  @override
  _SplashscreenState createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  leavePage(context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool firstTime = prefs.getBool('firstTime');
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (context) => MultiProvider(
                providers: [
                  ChangeNotifierProvider<MyNavigationIndex>(create: (c)=>MyNavigationIndex()),
                  ChangeNotifierProvider<LoginStatus>(create: (c)=>LoginStatus()),
                  ChangeNotifierProvider<FavoritesProvider>(create: (c)=>FavoritesProvider()),
                  ChangeNotifierProvider<FavouritesStatus>(create: (c)=>FavouritesStatus.instance),
                  ],
                child: CustomNavigator(),
              )),
    );
    if (firstTime == null || firstTime == true)
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LandingPage()),
      );
  }

  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 1000), () {
      leavePage(context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: Container(
            width: 100,
            height: 100,
            child: Hero(
              tag: 'logo',
              child: Image.asset(
                'assets/excellogo.png',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
