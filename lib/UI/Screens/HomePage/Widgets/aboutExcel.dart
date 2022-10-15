import 'package:excelapp/UI/constants.dart';
import 'package:flutter/material.dart';

// class AboutExcelPopUp extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() => AboutExcelPopUpState();
// }

// class AboutExcelPopUpState extends State<AboutExcelPopUp>
//     with SingleTickerProviderStateMixin {
// AnimationController controller;
// Animation<double> scaleAnimation;

// @override
// void initState() {
//   super.initState();

//   controller =
//       AnimationController(vsync: this, duration: Duration(milliseconds: 200));
//   scaleAnimation = CurvedAnimation(parent: controller, curve: Curves.easeIn);

//   controller.addListener(() {
//     setState(() {});
//   });

//   controller.forward();
// }
class AboutExcelPopUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(height: 8),
          Image.asset(
            "assets/icons/divider.png",
            width: 340,
          ),
          Image.asset(
            "assets/icons/college.png",
            width: 340,
            height: 160,
          ),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.fromLTRB(32, 7, 32, 10),
            child: Center(
              child: RichText(
                text: TextSpan(
                  text: 'Inspire. Innovate. Engineer ',
                  style: TextStyle(
                    color: Color(0xDD000000),
                    fontWeight: FontWeight.w800,
                    fontSize: 16,
                    fontFamily: "mulish",
                  ),
                  children: const <TextSpan>[
                    TextSpan(
                      text:
                          "\n\nExcel, the nation’s second and South India’s first ever fest of its kind, was started in 2001 by the students of Govt. Model Engineering College. Over the years, Excel has grown exponentially, consistently playing host to some of the most talented students, the most illustrious speakers and the most reputed companies. \n\n Now gearing towards the landmark 23rd edition, Excel continues to march forward. Join us this December to experience the magic of Excel!.",
                      style: TextStyle(
                        color: Color.fromARGB(255, 61, 71, 71),
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        fontFamily: pfontFamily,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.fromLTRB(32, 0, 32, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: Color.fromARGB(255, 14, 152, 232),
                    ),
                    height: 50,
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'View Website',
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
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: Color.fromARGB(255, 228, 237, 239),
                    ),
                    height: 50,
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Developer Credits',
                          style: TextStyle(
                              color: Color.fromARGB(255, 61, 71, 71),
                              fontFamily: "mulish",
                              fontWeight: FontWeight.w700,
                              fontSize: 14),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.arrow_forward,
                          size: 19,
                          color: Color.fromARGB(255, 61, 71, 71),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          )
          /*Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                      "assets/icons/meclogo.png",
                      height: 50,
                    ),
                    Image.asset(
                      "assets/icons/excel2020withtext.png",
                      height: 50,
                    ),
                  ],
                )*/
          ,
        ],
      ),
    );
  }
}

MaterialStateProperty<Color> getColor(Color color, Color colorPressed) {
  final getColor = (Set<MaterialState> states) {
    if (states.contains(MaterialState.pressed)) {
      return colorPressed;
    }
  };
  return MaterialStateProperty.resolveWith(getColor);
}
