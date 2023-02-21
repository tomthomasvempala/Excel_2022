import 'package:cached_network_image/cached_network_image.dart';
import 'package:excelapp/Models/highlights_model.dart';
import 'package:excelapp/UI/Themes/colors.dart';
import 'package:excelapp/UI/Themes/profile_themes.dart';
import 'package:excelapp/UI/constants.dart';
import 'package:flutter/material.dart';

import '../Stories/fullPageView.dart';

// ignore: must_be_immutable
class HighlightsCard extends StatelessWidget {
  final Highlights highlights;
  final int index;
  final List<Map<String,dynamic>> storiesMapList;
  Color firstColor;
  HighlightsCard(this.highlights, this.index,this.storiesMapList) {
    int v =this.index;
    if(v==this.storiesMapList.length-1){
      if(v%3==0){
        v-=2;
      }
    }
    firstColor = v % 3 == 0
        ? blue500
        : v % 3 == 1
            ? green500
            : Color(0xFF104164);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      child: GestureDetector(
        onTap: (){
          Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FullPageView(
                      storiesMapList: storiesMapList,
                      storyNumber: index),
                ),
              );
        },
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  image: DecorationImage(
                      image: CachedNetworkImageProvider((highlights.image != null)
                          ? highlights.image
                          : "http://greatcatwalk.com/images/service2.jpg"),
                      fit: BoxFit.cover)),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: Stack(
                      children: <Widget>[
                        Opacity(
                          opacity: 0.9,
                          child: Container(
                            padding: EdgeInsets.fromLTRB(20, 0, 24, 24),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: FractionalOffset.bottomCenter,
                                end: FractionalOffset.topCenter,
                                colors: [firstColor, firstColor.withOpacity(0.4)],
                                stops: [0.2, 1],
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  "HIGHLIGHTS",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontFamily: pfontFamily,
                                      fontSize: 10,
                                      letterSpacing: 2,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  highlights.name,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontFamily: pfontFamily,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w800,
                                      color: Colors.white),
                                ),
                                
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
