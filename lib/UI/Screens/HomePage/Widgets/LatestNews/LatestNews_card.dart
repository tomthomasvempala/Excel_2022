import 'package:cached_network_image/cached_network_image.dart';
import 'package:excelapp/Models/latest_news.dart';
import 'package:excelapp/UI/Screens/EventPage/eventPage.dart';
import 'package:excelapp/UI/Screens/HomePage/Widgets/socialIcons.dart';
import 'package:excelapp/UI/Themes/colors.dart';
import 'package:excelapp/UI/constants.dart';
import 'package:flutter/material.dart';
import 'package:excelapp/Services/API/favourites_api.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class LastestNewsCard extends StatefulWidget {
  final News news;
  LastestNewsCard(this.news);

  @override
  State<LastestNewsCard> createState() => _LastestNewsCardState();
}

class _LastestNewsCardState extends State<LastestNewsCard> {
  @override
  bool likeState = false;
  getFavouritedStatus(id) async {
    bool isFavourited = await FavouritesAPI.isFavourited(id);
    setState(() {
      likeState = isFavourited;
    });
  }

  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: white100,
        borderRadius: BorderRadius.circular(32),
        border: Border.all(
          color: white300,
          width: 1.6,
        ),
      ),
      child: Container(
        padding: EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: Stack(
                alignment: Alignment.topRight,
                children: [
                  Image(
                    image: CachedNetworkImageProvider(widget.news.imageurl),
                  ),
                  // commented due to some tag error

                  // Padding(
                  //   padding: EdgeInsets.all(15),
                  //   child: Container(
                  //     width: 40,
                  //     height: 40,
                  //     child: FloatingActionButton(
                  //       onPressed: () {},
                  //       heroTag: 'newsIcon${news.id}',
                  //       elevation: 0,
                  //       shape: RoundedRectangleBorder(
                  //         borderRadius: BorderRadius.circular(60),
                  //       ),
                  //       child: FaIcon(Icons.bookmark_outline_rounded),
                  //       foregroundColor: Colors.white,
                  //       backgroundColor: Color.fromARGB(155, 251, 255, 255),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.news.title,
                    style: headingStyle,
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    widget.news.content,
                    textAlign: TextAlign.left,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 14, color: black300, height: 1.4,),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          if (widget.news.link != null || widget.news.link != "") {
                            if (widget.news.link.length >= 3)
                              launchURL((widget.news.link.startsWith("http")
                                  ? widget.news.link
                                  : "https://" + widget.news.link));
                            else {
                              Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              EventPage(int.parse(widget.news.link))))
                                  .then((value) {
                                getFavouritedStatus(widget.news.link);
                              });
                            }
                          }
                        },
                        child: Text(
                          'Click Here',
                          style: TextStyle(
                              color: primaryColor,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              fontFamily: pfontFamily),
                        ),
                      ),
                      Text(
                        dateMsgGenerator(widget.news.date),
                        style: TextStyle(
                            color: black100, fontSize: 12, fontFamily: pfontFamily),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  dateMsgGenerator(String postTime) {
    var currTime = DateTime.now().millisecondsSinceEpoch;
    var diff = currTime - int.parse(postTime);

    const sec = 1000;
    const min = sec * 60;
    const hour = min * 60;
    const day = hour * 24;
    const week = day * 7;

    var msg = "";

    if (diff < min) {
      msg = "${(diff / sec).round()} sec ago";
    } else if (diff < hour) {
      msg = "${(diff / min).round()} mins ago";
    } else if (diff < day) {
      msg = "${(diff / hour).round()} hrs ago";
    } else if (diff < week) {
      msg = "${(diff / day).round()} days ago";
    } else {
      msg = "${(diff / week).round()} weeks ago";
    }

    return msg;
  }
}
