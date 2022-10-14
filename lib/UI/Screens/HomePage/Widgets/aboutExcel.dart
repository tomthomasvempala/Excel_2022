import 'package:excelapp/UI/constants.dart';
import 'package:flutter/material.dart';

class AboutExcelPopUp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AboutExcelPopUpState();
}

class AboutExcelPopUpState extends State<AboutExcelPopUp>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 200));
    scaleAnimation = CurvedAnimation(parent: controller, curve: Curves.easeIn);

    controller.addListener(() {
      setState(() {});
    });

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: scaleAnimation,
      child: Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        insetPadding: EdgeInsets.all(13),
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(
                  "assets/icons/college.png",
                  width: 200,
                ),
                SizedBox(height: 10),
                Center(
                  child: RichText(
                    text: TextSpan(
                      text: 'Inspire. Innovate. Engineer ',
                      style: TextStyle(
                        color: Color(0xDD000000),
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        fontFamily: pfontFamily,
                        height: 1.3,),

                      children: const <TextSpan>[
                        TextSpan(text: "\nExcel, the nation’s second and South India’s first ever fest of its kind, was started in 2001 by the students of Govt. Model Engineering College. Over the years, Excel has grown exponentially, consistently playing host to some of the most talented students, the most illustrious speakers and the most reputed companies. \n\n Now gearing towards the landmark 23rd edition, Excel continues to march forward. Join us this December to experience the magic of Excel!.",
                          style: TextStyle(
                          color: Color(0xff555566),
                            fontWeight: FontWeight.normal,
                          fontSize: 13,
                          fontFamily: pfontFamily,
                          height: 1.3,
                        ),),
                      ],

                  ),
                  ),

                ),
                SizedBox(height: 20),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Center(
                        child: ElevatedButton(
                          style: ButtonStyle(

                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40)
                              )
                            ),
                            foregroundColor: getColor(Colors.white, Colors.blue),
                            backgroundColor: getColor(Colors.blue, Colors.white),
                            //overlayColor: getColor(Colors.white, Colors.teal),
                          ),
                          child: Text('View Website '),
                          onPressed: () {},
                        )
                    ),
                    Center(
                        child: ElevatedButton(
                          style: ButtonStyle(

                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)
                                )
                            ),
                            foregroundColor: getColor(Colors.white, Colors.blue),
                            backgroundColor: getColor(Colors.blue, Colors.white),
                            //overlayColor: getColor(Colors.white, Colors.teal),
                          ),
                          child: Text('Developer Credits '),
                          onPressed: () {},
                        )
                    )
                  ],
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
                )*/,
              ],
            ),
          ),
        ),
      ),

    );

  }

}
MaterialStateProperty<Color> getColor(Color color, Color colorPressed){

  final getColor = (Set<MaterialState> states) {
    if (states.contains(MaterialState.pressed)) {
      return colorPressed;
    }
  };
  return MaterialStateProperty.resolveWith(getColor);}
