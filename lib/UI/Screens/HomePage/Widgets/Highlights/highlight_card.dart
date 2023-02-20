import 'package:cached_network_image/cached_network_image.dart';
import 'package:excelapp/Models/highlights_model.dart';
import 'package:excelapp/UI/Themes/colors.dart';
import 'package:excelapp/UI/Themes/profile_themes.dart';
import 'package:excelapp/UI/constants.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HighlightsCard extends StatelessWidget {
  final Highlights highlights;
  final int index;
  Color firstColor;
  HighlightsCard(this.highlights, this.index) {
    firstColor = this.index % 3 == 0
        ? blue500
        : this.index % 3 == 1
            ? green500
            : Color(0xFF104164);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
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
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                              Padding(
                                padding: const EdgeInsets.only(bottom: 4),
                                child: Image.asset("assets/icons/arrow.png", height: 16),
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
    );
  }
}
