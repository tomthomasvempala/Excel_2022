import '../../Themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'Widgets/pages.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      globalBackgroundColor: Color.fromARGB(255, 236, 244, 245),
      key: introKey,
      pages: [
        PageViewModel(
          title: "",
          decoration: PageDecoration(bodyAlignment: Alignment.center),
          bodyWidget: page(
            context,
            data[0]["title"],
            data[0]["description"],
            Image.asset('assets/excellogo.png', height: 240),
          ),
        ),
        PageViewModel(
          title: "",
          decoration: PageDecoration(bodyAlignment: Alignment.center),
          bodyWidget: page(
            context,
            data[1]["title"],
            data[1]["description"],
            Lottie.asset('assets/mascot.json',
                height: 256, fit: BoxFit.contain),
          ),
        ),
        PageViewModel(
          title: "",
          decoration: PageDecoration(bodyAlignment: Alignment.center),
          bodyWidget: page(
            context,
            data[2]["title"],
            data[2]["description"],
            Image.asset('assets/ui.jpeg', height: 240),
            extra: CTAButton(context),
          ),
        ),
      ],
      onDone: () => onIntroEnd(context),
      showSkipButton: true,
      nextFlex: 1,
      skip: Text(
        'Skip',
        style: TextStyle(
          fontWeight: FontWeight.w600,
          color: black300,
          fontFamily: "mulish",
          fontSize: 16,
        ),
      ),
      next: Icon(Icons.arrow_forward, color: black300),
      done: Text(''),
      dotsDecorator: DotsDecorator(
        activeColor: black300,
        size: Size(8.0, 8.0),
        color: black100,
      ),
    );
  }

  Widget CTAButton(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(10, 32, 10, 0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: const StadiumBorder(), elevation: 0),
        onPressed: () => onIntroEnd(context),
        child: const Padding(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Text(
            "Get Started",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }

  var data = [
    {
      "title": "Welcome to Excel 2022",
      "description":
          "Excel is the official techno-managerial festival of Govt. Model Engineering College, Kochi! Found in 2001, while being the first of its kind in South India, the 23rd edition promises to be bigger and better!"
    },
    {
      "title": "Hi! I\'m AEVA",
      "description":
          "Meet Excel\'s bubbly, pointy-eared mascot that is hyper-excited about all things tech and fun, Aeva! Unable to sit still due to unbridled excitement, she is excited to have a blast at Excel with you!"
    },
    {
      "title": "Let\'s get into it!",
      "description":
          "Dive right in and explore 40+ events, inclusive of informative workshops, heated panels, competitions, and activities filled with madness for all!"
    },
  ];
}

void onIntroEnd(context) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setBool('firstTime', false);
  Navigator.of(context).pop();
}
