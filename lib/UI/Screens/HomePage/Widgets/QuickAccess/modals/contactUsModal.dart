import 'package:excelapp/UI/Screens/HomePage/Widgets/socialIcons.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Widget ContactUsModal(context) {
  return Container(
      // margin: EdgeInsets.fromLTRB(0, 40, 0, 40),
      child: Column(
    children: [
      SizedBox(height: 8),
      Image.asset(
        "assets/icons/divider.png",
        width: 340,
      ),
      SizedBox(
        height: 20,
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: Text(
                "Stay In Touch",
                style: TextStyle(
                    fontFamily: "mulish",
                    fontSize: 16,
                    fontWeight: FontWeight.w800),
              )),
          Padding(
            padding: EdgeInsets.all(20),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      launch('tel:8547588532');
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Color.fromARGB(255, 228, 237, 239),
                      ),
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: 60,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(20, 0, 10, 0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              "assets/icons/call.png",
                              width: 20,
                              height: 20,
                            ),
                            SizedBox(
                              width: 9,
                            ),
                            Text(
                              "Call Us",
                              style: TextStyle(
                                  fontFamily: "mulish",
                                  fontSize: 14,
                                  color: Color.fromARGB(255, 61, 71, 71),
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      launchURL("https://excelmec.org");
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Color.fromARGB(255, 228, 237, 239),
                      ),
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: 60,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(15, 0, 10, 0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              "assets/icons/website.png",
                              width: 20,
                              height: 20,
                            ),
                            SizedBox(
                              width: 9,
                            ),
                            Text(
                              "Visit Website",
                              style: TextStyle(
                                  fontFamily: "mulish",
                                  fontSize: 14,
                                  color: Color.fromARGB(255, 61, 71, 71),
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ]),
          ),
          Padding(
              padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
              child: Text(
                "Our Socials",
                style: TextStyle(
                    fontFamily: "mulish",
                    fontSize: 16,
                    fontWeight: FontWeight.w800),
              )),
          Padding(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      launchURL('https://www.instagram.com/excelmec/');
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Color.fromARGB(255, 228, 237, 239),
                      ),
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: 60,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(18, 0, 10, 0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              "assets/icons/insta.png",
                              width: 30,
                              height: 30,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Instagram",
                              style: TextStyle(
                                  fontFamily: "mulish",
                                  fontSize: 14,
                                  color: Color.fromARGB(255, 61, 71, 71),
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      launchURL('https://www.facebook.com/excelmec/');
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Color.fromARGB(255, 228, 237, 239),
                      ),
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: 60,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(18, 0, 10, 0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              "assets/icons/facebook.png",
                              width: 30,
                              height: 30,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Facebook",
                              style: TextStyle(
                                  fontFamily: "mulish",
                                  fontSize: 14,
                                  color: Color.fromARGB(255, 61, 71, 71),
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ]),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      launchURL('https://www.linkedin.com/company/excelmec/');
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Color.fromARGB(255, 228, 237, 239),
                      ),
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: 60,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(18, 0, 10, 0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              "assets/icons/linkedin.png",
                              width: 30,
                              height: 30,
                            ),
                            SizedBox(
                              width: 7,
                            ),
                            Text(
                              "Linkedin",
                              style: TextStyle(
                                  fontFamily: "mulish",
                                  fontSize: 14,
                                  color: Color.fromARGB(255, 61, 71, 71),
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      launchURL('https://twitter.com/excelmec/');
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Color.fromARGB(255, 228, 237, 239),
                      ),
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: 60,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(18, 0, 10, 0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              "assets/icons/twitter.png",
                              width: 30,
                              height: 30,
                            ),
                            SizedBox(
                              width: 7,
                            ),
                            Text(
                              "Twitter",
                              style: TextStyle(
                                  fontFamily: "mulish",
                                  fontSize: 14,
                                  color: Color.fromARGB(255, 61, 71, 71),
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ]),
          ),
          SizedBox(
            height: 40,
          )
        ],
      ),
    ],
  ));
}
