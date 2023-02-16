import 'package:flutter/material.dart';
import 'package:excelapp/UI/Screens/LandingPage/landingPage.dart';

Widget introPage(context) {
  return Container(
    child: Center(
        child: Container(
      width: MediaQuery.of(context).size.width * 0.9,
      margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color.fromARGB(255, 251, 255, 255),
      ),
      height: 600,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
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
                'Excel is the annual techno-managerial fest of Govt. Model Enginnering College. It’s the Nation’s second and South India’s first ever fest of it’s kind!',
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
    )),
  );
}

// Widget page(title, desc, img, context) {
//   return Container(
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.stretch,
//       children: <Widget>[
//         SizedBox(height: 20),
//         SizedBox(
//           height: 195,
//           child: Image.asset(img),
//         ),
//         SizedBox(height: 20),
//         Center(
//           child: Text(
//             title,
//             style: TextStyle(
//                 fontSize: 25, color: primaryColor, fontFamily: pfontFamily),
//           ),
//         ),
//         SizedBox(height: 40),
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 15.0),
//           child: Text(
//             desc,
//             textAlign: TextAlign.center,
//             style: TextStyle(
//                 fontSize: 15, color: lightTextColor, fontFamily: pfontFamily),
//           ),
//         ),
//       ],
//     ),
//   );
// }

Widget lastPage(context) {
  return Container(
    child: Center(
        child: Container(
      width: MediaQuery.of(context).size.width * 0.9,
      margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color.fromARGB(255, 251, 255, 255),
      ),
      height: 600,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <
          Widget>[
        Image.asset(
          'assets/excellogo.png',
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
              'Excel is the annual techno-managerial fest of Govt. Model Enginnering College. It’s the Nation’s second and South India’s first ever fest of it’s kind!',
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
    )),
  );
}
