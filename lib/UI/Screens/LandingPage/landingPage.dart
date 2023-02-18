import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:excelapp/UI/Screens/LandingPage/Widgets/pages.dart';
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
      globalBackgroundColor: Color.fromARGB(255, 219, 228, 231),
      key: introKey,
      pages: [
        PageViewModel(
          bodyWidget: introPage(context),
          title: "",
        ),
        PageViewModel(
          decoration: PageDecoration(
              // contentPadding: EdgeInsets.symmetric(horizontal: 0)
              ),
          bodyWidget: page(context),
          // bodyWidget: page(
          //     "Come Join Us",
          //     "Certain events wake us, nurture us and revitalize us. But how often do these events come? Either you wait for those moments or you create them. Sometimes life offers you a chance to take yourself to the next level. All you have to do is to seize them.",
          //     "assets/introScreen/page3.png",
          //     context),
          title: "",
        ),
        PageViewModel(
          decoration: PageDecoration(
              // contentPadding: EdgeInsets.symmetric(horizontal: 0)
              ),
          bodyWidget: lastPage(context),
          title: "",
        ),
      ],
      onDone: () => onIntroEnd(context),
      showSkipButton: true,
      //skipFlex: 0,
      nextFlex: 1,
      skip: Text('Skip',
          style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Color(
                0xff3D4747,
              ),
              fontFamily: "mulish",
              fontSize: 16)),
      next: Icon(Icons.arrow_forward, color: Color(0xff014F60)),
      done: Text(''),
      dotsDecorator: DotsDecorator(
        activeColor: Color(0xff3D4747),
        size: Size(8.0, 8.0),
        color: Color(0xFFB3C1C5),
        // activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(50.0),
          ),
        ),
      ),
    );
  }
}

void onIntroEnd(context) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setBool('firstTime', false);
  Navigator.of(context).pop();
}
