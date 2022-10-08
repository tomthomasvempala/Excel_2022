import 'package:excelapp/UI/constants.dart';
import 'package:excelapp/UI/Screens/HomePage/Widgets/LatestNews/LatestNews_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LatestNewsSection extends StatefulWidget {

  @override
  State<LatestNewsSection> createState() => _LatestNewsSectionState();
}

class _LatestNewsSectionState extends State<LatestNewsSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    FaIcon(FontAwesomeIcons.microphone),
                    SizedBox(width: 10),
                    Text("Latest News", style: headingStyle),
                  ],
                ),
                Text("from Excel 2022", style: TextStyle(color: Color(0xff778585), fontWeight: FontWeight.w600,fontSize: 11),),
              ],
            ),
          ),
          LastestNewsCard(),
        ],
      ),
    );
  }
}
