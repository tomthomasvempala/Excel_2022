import 'package:excelapp/UI/Screens/EventPage/eventPage.dart';
import 'package:excelapp/UI/Screens/ExplorePage/explorePage.dart';
import 'package:excelapp/UI/Screens/HomePage/Widgets/Discover/button.dart';
import 'package:excelapp/UI/Screens/HomePage/Widgets/Discover/buttonData.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../../../../../Providers/navigationProvider.dart';
import '../../../../constants.dart';

class Discover extends StatelessWidget {
  const Discover({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
  final myNavIndex = Provider.of<MyNavigationIndex>(context);
    return Container(
      margin: EdgeInsets.all(16),
      child: Column(
        children: [
          //heading
          Container(
            margin: EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    FaIcon(FontAwesomeIcons.compass),
                    SizedBox(width: 10),
                    Text("Discover", style: headingStyle),
                  ],
                ),
                Text(
                  "our prime events",
                  style: TextStyle(
                      color: Color(0xff778585),
                      fontWeight: FontWeight.w600,
                      fontSize: 11,
                      fontFamily: pfontFamily),
                ),
              ],
            ),
          ),

          //buttons row 1
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                    onTap: () {
                      //Talks
                      myNavIndex.setIndextoExplore(1, 'talks');
                    },
                    child: DiscoverButtons(
                      data: DiscoverButtonData[0],
                      width: width / 2.41,
                    )),
                InkWell(
                    onTap: () {
                      //Workshop
                      myNavIndex.setIndextoExplore(1, 'workshops');
                    },
                    child: DiscoverButtons(
                      data: DiscoverButtonData[1],
                      width: width / 2.41,
                    )),
              ],
            ),
          ),
          SizedBox(
            height: 16,
          ),
          //buttons row 2
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                  onTap: () {
                    //Competitions
                    
                      myNavIndex.setIndextoExplore(0, 'all');
                  },
                  child: DiscoverButtons(
                    data: DiscoverButtonData[2],
                    width: width / 1.969,
                  )),
              InkWell(
                  onTap: () {
                    //other
                    
                      myNavIndex.setIndextoExplore(1, 'all');
                  },
                  child: DiscoverButtons(
                    data: DiscoverButtonData[3],
                    width: width / 3.096,
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
