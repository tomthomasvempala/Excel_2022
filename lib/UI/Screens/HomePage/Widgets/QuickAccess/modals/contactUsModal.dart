import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget ContactUsModal(context) {
  return Container(
      // margin: EdgeInsets.fromLTRB(0, 40, 0, 40),
      child: Column(
    children: [
      SizedBox(height: 10),
      Divider(
        indent: 140,
        endIndent: 140,
        thickness: 5,
        color: Color.fromARGB(163, 141, 151, 153),
      ),
      SizedBox(
        height: 30,
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
                    fontSize: 18,
                    fontWeight: FontWeight.w900),
              )),
          Padding(
            padding: EdgeInsets.all(20),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Color.fromARGB(141, 189, 199, 201),
                    ),
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: 60,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(18, 0, 10, 0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.phone_outlined,
                            color: Color.fromARGB(195, 14, 152, 232),
                          ),
                          SizedBox(
                            width: 9,
                          ),
                          Text(
                            "Call Us",
                            style: TextStyle(
                                fontFamily: "mulish",
                                fontSize: 15,
                                color: Color.fromARGB(204, 61, 71, 71),
                                fontWeight: FontWeight.w800),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Color.fromARGB(177, 189, 199, 201),
                    ),
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: 60,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.web,
                            color: Color.fromARGB(195, 14, 152, 232),
                          ),
                          SizedBox(
                            width: 9,
                          ),
                          Text(
                            "Visit Website",
                            style: TextStyle(
                                fontFamily: "mulish",
                                fontSize: 15,
                                color: Color.fromARGB(204, 61, 71, 71),
                                fontWeight: FontWeight.w800),
                          ),
                        ],
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
                    fontSize: 18,
                    fontWeight: FontWeight.w900),
              )),
          Padding(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Color.fromARGB(141, 189, 199, 201),
                    ),
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: 60,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(18, 0, 10, 0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          FaIcon(FontAwesomeIcons.instagram),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Instagram",
                            style: TextStyle(
                                fontFamily: "mulish",
                                fontSize: 15,
                                color: Color.fromARGB(204, 61, 71, 71),
                                fontWeight: FontWeight.w800),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Color.fromARGB(177, 189, 199, 201),
                    ),
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: 60,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(18, 0, 10, 0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          FaIcon(FontAwesomeIcons.facebook),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Facebook",
                            style: TextStyle(
                                fontFamily: "mulish",
                                fontSize: 15,
                                color: Color.fromARGB(204, 61, 71, 71),
                                fontWeight: FontWeight.w800),
                          ),
                        ],
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
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Color.fromARGB(141, 189, 199, 201),
                    ),
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: 60,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(18, 0, 10, 0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          FaIcon(FontAwesomeIcons.linkedin),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Linkedin",
                            style: TextStyle(
                                fontFamily: "mulish",
                                fontSize: 15,
                                color: Color.fromARGB(204, 61, 71, 71),
                                fontWeight: FontWeight.w800),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Color.fromARGB(177, 189, 199, 201),
                    ),
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: 60,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(18, 0, 10, 0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          FaIcon(FontAwesomeIcons.twitter),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Twitter",
                            style: TextStyle(
                                fontFamily: "mulish",
                                fontSize: 15,
                                color: Color.fromARGB(204, 61, 71, 71),
                                fontWeight: FontWeight.w800),
                          ),
                        ],
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
