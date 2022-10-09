import 'package:excelapp/UI/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LastestNewsCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: Color(0xfffbffff),
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child:
                      // Image.network('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
                      Stack(
                    alignment: Alignment.topRight,
                    children: [
                      Image(
                        image: AssetImage('assets/sampleposter.png'),
                      ),
                      Padding(
                        padding: EdgeInsets.all(15),
                        child: Container(
                          width: 40,
                          height: 40,
                          child: FloatingActionButton(
                            heroTag: 'btn1',
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(60),
                            ),
                            child: FaIcon(Icons.bookmark_outline_rounded),
                            foregroundColor: Colors.white,
                            backgroundColor: Color.fromARGB(155, 251, 255, 255),
                          ),
                        ),
                      ),
                    ],
                  )),
              SizedBox(
                height: 16,
              ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Excel 2022",
                    style: headingStyle,
                    textAlign: TextAlign.left,
                  )),
              SizedBox(
                height: 8,
              ),
              Text(
                "It's time to finally launch the journey we've all planned together! Excel 2022 is here with new stuf..",
                textAlign: TextAlign.left,
                style: pStyle,
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Register Now",
                    style: TextStyle(
                        color: primaryColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        fontFamily: pfontFamily),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "26th July",
                        style: TextStyle(
                            color: Color(0xff778585),
                            fontSize: 10,
                            fontWeight: FontWeight.w800,
                            fontFamily: pfontFamily),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      SizedBox(
                        child: Container(
                          height: 5,
                          width: 5,
                          decoration: BoxDecoration(
                              color: Color(0xff778585),
                              borderRadius: BorderRadius.circular(50)),
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "5:30 PM",
                        style: TextStyle(
                            color: Color(0xff778585),
                            fontSize: 10,
                            fontWeight: FontWeight.w800,
                            fontFamily: pfontFamily),
                      )
                    ],
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
