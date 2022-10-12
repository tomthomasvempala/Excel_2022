import 'package:excelapp/UI/Screens/HomePage/Widgets/Discover/discover.dart';
import 'package:excelapp/UI/Screens/HomePage/Widgets/Highlights/highlights.dart';
import 'package:excelapp/UI/Screens/HomePage/Widgets/home_appBar.dart';
import 'package:flutter/material.dart';
import 'package:excelapp/UI/Screens/HomePage/Widgets/Categories/categories.dart';
import 'package:excelapp/UI/Screens/HomePage/Widgets/socialIcons.dart';
import 'package:excelapp/UI/Screens/HomePage/Widgets/QuickAccess/quickAccess.dart';
import 'package:excelapp/UI/Screens/HomePage/Widgets/Stories/stories.dart';
import 'package:excelapp/UI/Screens/HomePage/Widgets/Drawer/drawer.dart';
import 'package:excelapp/UI/Screens/HomePage/Widgets/Drawer/drawer.dart';

import 'package:excelapp/UI/Screens/HomePage/Widgets/LatestNews/latestNews.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(237, 245, 246, 1),
      // appBar: homeAppBar(context),
      // drawer: CustomDrawer(),
      body: Container(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: <Widget>[
              // Stories(),
              Container(
                padding: EdgeInsets.all(0),
                color: Colors.white,
                child: Column(
                  children: [
                    ExcelTitle(),
                    QuickAccessBar(),
                    HighlightsSection(),
                  ],
                ),
              ),

              Discover(),
              LatestNewsSection(),
              // Categories(),
              // SocialIcons(),
              SizedBox(height: MediaQuery.of(context).size.height / 6)
            ],
          ),
        ),
      ),
    );
  }
}
