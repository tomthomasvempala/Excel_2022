import 'package:flutter/material.dart';
import 'package:excelapp/UI/Screens/LandingPage/landingPage.dart';
import 'package:lottie/lottie.dart';

Widget page(context) {
  return Center(
      child: Container(
    width: MediaQuery.of(context).size.width * 0.9,
    margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: Color.fromARGB(255, 251, 255, 255),
    ),
    height: 570,
    child:
        Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
      Lottie.asset('assets/mascot.json'),
      Text(
        'Welcome to Excel 2022',
        style: TextStyle(
          color: Color(0xff1C1F20),
          fontSize: 20,
          fontWeight: FontWeight.w800,
          fontFamily: "mulish",
        ),
      ),
      Padding(
        padding: EdgeInsets.fromLTRB(33, 10, 33, 33),
        child: Text(
          'Meet Excel\'s bubbly, pointy-eared mascot that is hyper-excited about all things tech and fun, Aeva! Born on 7th October\' 22, she is excited to be a part of the tech-fest, unable to sit still due to unbridled excitement, and is ready to have a blast at Excel with you!',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xff778585),
            fontFamily: "mulish",
            fontSize: 14,
            fontWeight: FontWeight.w400,
            height: 1.5,
          ),
        ),
      )
    ]),
  ));
}

Widget introPage(context) {
  return Center(
      child: Container(
    width: MediaQuery.of(context).size.width * 0.9,
    margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: Color.fromARGB(255, 251, 255, 255),
    ),
    height: 570,
    child:
        Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
      Image.asset(
        'assets/excellogo.png',
        width: 197,
        height: 237,
      ),
      Text(
        'Welcome to Excel 2022',
        style: TextStyle(
          color: Color(0xff1C1F20),
          fontSize: 20,
          fontWeight: FontWeight.w800,
          fontFamily: "mulish",
        ),
      ),
      Padding(
        padding: EdgeInsets.fromLTRB(33, 10, 33, 33),
        child: Text(
          'Excel is the official techno-managerial festival of Govt. Model Engineering College, Kochi! Found in 2001 by the students, the popular fest was the first of its kind in South India and the nation\'s second largest! The successor of 22 editions, the 23rd promises to be bigger and better!',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xff778585),
            fontFamily: "mulish",
            fontSize: 14,
            fontWeight: FontWeight.w400,
            height: 1.5,
          ),
        ),
      )
    ]),
  ));
}

Widget lastPage(context) {
  return Center(
      child: Container(
    width: MediaQuery.of(context).size.width * 0.9,
    margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: Color.fromARGB(255, 251, 255, 255),
    ),
    height: 570,
    child:
        Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
      Image.asset(
        'assets/ui.jpeg',
        width: 197,
        height: 237,
      ),
      Padding(
        padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
        child: Text(
          'Welcome to Excel 2022',
          style: TextStyle(
            color: Color(0xff1C1F20),
            fontSize: 20,
            fontWeight: FontWeight.w800,
            fontFamily: "mulish",
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.fromLTRB(33, 10, 33, 0),
        child: Column(children: [
          Text(
            'So let\'s dive right in and explore 40+events, inclusive of informative workshops, heated panels, competitions for both the techie professionals and the non-technical peeps, and activities filled with madness for all!',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xff778585),
              fontFamily: "mulish",
              fontSize: 14,
              fontWeight: FontWeight.w400,
              height: 1.5,
            ),
          ),
          InkWell(
            onTap: () {
              onIntroEnd(context);
            },
            child: Container(
              margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
              width: 241,
              height: 52,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: Color.fromARGB(255, 14, 152, 232),
              ),
              alignment: Alignment.center,
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text(
                  'Get Started',
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: "mulish",
                      fontWeight: FontWeight.w700,
                      fontSize: 14),
                ),
                SizedBox(
                  width: 10,
                ),
                Icon(Icons.arrow_forward, size: 19, color: Colors.white)
              ]),
            ),
          ),
        ]),
      )
    ]),
  ));
}
