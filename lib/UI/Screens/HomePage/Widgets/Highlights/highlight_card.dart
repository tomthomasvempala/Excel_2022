import 'package:cached_network_image/cached_network_image.dart';
import 'package:excelapp/Models/highlights_model.dart';
import 'package:excelapp/UI/constants.dart';
import 'package:flutter/material.dart';

class HighlightsCard extends StatelessWidget {
  final Highlights highlights;
  HighlightsCard(this.highlights);

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
            ),
            child: Stack(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: Stack(children: <Widget>[
                      CachedNetworkImage(
                        imageUrl: highlights.image,
                        fit: BoxFit.fill,
                      ),
                      Opacity(
                        opacity: 0.3,
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: FractionalOffset.bottomCenter,
                              end: FractionalOffset.topCenter,
                              colors: [primaryColor, primaryColor],
                              stops: [0.0, 1.0],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(25, 100, 0, 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "HIGHLIGHTS",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontFamily: pfontFamily,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white),
                                ),
                                Text(
                                  highlights.name,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontFamily: pfontFamily,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w800,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                              child: IconButton(
                                icon: Icon(
                                  Icons.arrow_forward,
                                  color: Colors.white,
                                  size: 30.0,
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ])),
              ],
            ),
          )
        ],
      ),
    );
  }
}
