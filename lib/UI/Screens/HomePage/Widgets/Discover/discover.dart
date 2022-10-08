import 'package:excelapp/UI/Screens/HomePage/Widgets/Discover/button.dart';
import 'package:excelapp/UI/Screens/HomePage/Widgets/Discover/buttonData.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../../constants.dart';

class Discover extends StatelessWidget {
  const Discover({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        //heading
        Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: Row(
              children: [
                Icon(Icons.compass_calibration_outlined),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:5),
                  child: Text(
                    "Discover",
                    style: headingStyle,
                  ),
                ),
              ],
            )),

        //buttons row 1
        Row(
          children: [
            InkWell(
                onTap: () {
                  //Talks
                },
                child: DiscoverButtons(
                  data: DiscoverButtonData[0],
                  width: width / 2.41,
                )),
            InkWell(
                onTap: () {
                  //Workshop
                },
                child: DiscoverButtons(
                  data: DiscoverButtonData[1],
                  width: width / 2.41,
                )),
          ],
        ),

        //buttons row 2
        Row(
          children: [
            InkWell(
                onTap: () {
                  //Competitions
                },
                child: DiscoverButtons(
                  data: DiscoverButtonData[2],
                  width: width / 1.969,
                )),
            InkWell(
                onTap: () {
                  //other
                },
                child: DiscoverButtons(
                  data: DiscoverButtonData[3],
                  width: width / 3.096,
                )),
          ],
        ),
      ],
    );
  }
}
