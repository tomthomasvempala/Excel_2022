import 'package:excelapp/UI/Themes/colors.dart';
import 'package:flutter/material.dart';
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
      margin: EdgeInsets.all(20),
      child: Column(
        children: [
          SizedBox(height: 8),
          //heading
          Container(
            margin: EdgeInsets.fromLTRB(8,16,12,16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset("assets/icons/discover.png", height: 24),
                    SizedBox(width: 10),
                    Text("Discover", style: headingStyle),
                  ],
                ),
                Text(
                  "our prime events",
                  style: TextStyle(
                      color: black200,
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                      fontFamily: pfontFamily),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          //buttons row 1
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      myNavIndex.setIndextoExplore(1, 'talks');
                    },
                    child: Image.asset("assets/discover/talks.png"),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  flex: 1,
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      myNavIndex.setIndextoExplore(1, 'workshops');
                    },
                    child: Image.asset("assets/discover/workshops.png"),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  flex: 1,
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {
                    myNavIndex.setIndextoExplore(0, 'all');
                  },
                  child: Image.asset("assets/discover/competitions.png"),
                  borderRadius: BorderRadius.circular(24),
                ),
                flex: 3,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: InkWell(
                  onTap: () {
                    myNavIndex.setIndextoExplore(1, 'general');
                  },
                  child: Image.asset("assets/discover/others.png"),
                  borderRadius: BorderRadius.circular(24),
                ),
                flex: 2,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
