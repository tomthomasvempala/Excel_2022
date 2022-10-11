import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget ReachUsModal(context) {
  return Container(
      // margin: EdgeInsets.fromLTRB(0, 40, 0, 10),
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
              padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
              child: Text(
                "Reach Us",
                style: TextStyle(
                    fontFamily: "mulish",
                    fontSize: 18,
                    fontWeight: FontWeight.w900),
              )),
          Padding(
            padding: EdgeInsets.fromLTRB(30, 20, 30, 20),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.asset(
                    "assets/MapsicleMap.png",
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: 320,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Color(0xff0E99E8),
                  ),
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'View on Google Maps',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "mulish",
                            fontWeight: FontWeight.w700,
                            fontSize: 17),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(Icons.arrow_forward, color: Colors.white)
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    ],
  ));
}
