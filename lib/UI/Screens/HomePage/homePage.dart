import 'package:excelapp/UI/Screens/HomePage/Widgets/Discover/discover.dart';
import 'package:excelapp/UI/Screens/HomePage/Widgets/Highlights/highlights.dart';
import 'package:excelapp/UI/Screens/HomePage/Widgets/home_appBar.dart';
import 'package:excelapp/UI/Themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:excelapp/UI/Screens/HomePage/Widgets/QuickAccess/quickAccess.dart';
import 'Widgets/LatestNews/latestNews.dart';
import 'Widgets/CampusAmbassador/campusAmb.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: white100,
      body: Container(
        color: white100,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: BouncingScrollPhysics(),
          child: Container(
            color: white200,
            child: Column(
              children: <Widget>[
                SafeArea(
                    bottom: false,
                    child: Container(),
                  ),
                Container(
                  child: Column(
                    children: [
                      ExcelTitle(),
                      QuickAccessBar(),
                      HighlightsSection(),
                    ],
                  ),
                  decoration: BoxDecoration(
                    color: white100,
                    border:
                        Border(bottom: BorderSide(color: white300, width: 1.2)),
                  ),
                ),
                Discover(),
                CampusAmbassador(),
                LatestNewsSection(),
                const SizedBox(height: 30)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
