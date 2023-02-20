import 'dart:async';

import 'package:excelapp/Models/latest_news.dart';
import 'package:excelapp/Services/API/news_api.dart';
import 'package:excelapp/UI/Screens/HomePage/Widgets/LatestNews/data.dart';
import 'package:excelapp/UI/Themes/colors.dart';
import 'package:excelapp/UI/constants.dart';
import 'package:excelapp/UI/Screens/HomePage/Widgets/LatestNews/LatestNews_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shimmer/shimmer.dart';

class LatestNewsSection extends StatefulWidget {
  @override
  State<LatestNewsSection> createState() => _LatestNewsSectionState();
}

class _LatestNewsSectionState extends State<LatestNewsSection> {
  StreamController<dynamic> estream;
  List<News> news;
  bool dataLoaded = false;
  fetchfromNet() async {
    var dataFromNet = await fetchAndStoreNewsFromNet();
    if (!dataLoaded || dataFromNet != "error") {
      estream.add(dataFromNet);
    }
    // estream.add(NewsData);
    // dataLoaded = true;
  }

  @override
  void initState() {
    estream = StreamController<dynamic>();
    // initialisePage();
    fetchfromNet();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(24, 32, 28, 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset("assets/icons/news.png", height: 24),
                    SizedBox(width: 8),
                    Text("Latest News", style: headingStyle),
                  ],
                ),
                Text(
                  "from Excel 2022",
                  style: TextStyle(
                      color: black200,
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                      fontFamily: pfontFamily),
                ),
              ],
            ),
          ),
          StreamBuilder(
              stream: estream.stream,
              builder: (context, snapshot) {
                print(snapshot.data);
                if (snapshot.data == "error")
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    padding: EdgeInsets.symmetric(vertical: 50, horizontal: 20),
                    child: Center(
                      child: Column(
                        children: <Widget>[
                          Text("Failed to fetch Event"),
                          SizedBox(height: 20),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: primaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                              ),
                            ),
                            onPressed: () {
                              fetchfromNet();
                            },
                            child: Text(
                              "Retry",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          SizedBox(
                            height: 50,
                          )
                        ],
                      ),
                    ),
                  );
                if (snapshot.hasData) {
                  if (snapshot.data.length == 0)
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 45),
                      child: Center(
                          child: Text(
                        "No Events",
                        style: TextStyle(color: Colors.black54),
                      )),
                    );
                  return Column(children: [
                    ListView.builder(
                        scrollDirection: Axis.vertical,
                        physics: ScrollPhysics(),
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 100),
                        shrinkWrap: true,
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
                          return LastestNewsCard(snapshot.data[index]);
                        }),
                  ]);
                } else {
                  return Container(
                    child: Shimmer.fromColors(
                      child: Container(
                        color: Colors.white,
                        height: MediaQuery.of(context).size.height / 4,
                        margin: EdgeInsets.symmetric(horizontal: 15),
                      ),
                      baseColor: Colors.grey[300],
                      highlightColor: Colors.grey[100],
                    ),
                  );
                }
              })
        ],
      ),
    );
  }
}
