import 'package:cached_network_image/cached_network_image.dart';
import 'package:excelapp/Models/latest_news.dart';
import 'package:excelapp/UI/Screens/EventPage/eventPage.dart';
import 'package:excelapp/UI/Screens/HomePage/Widgets/socialIcons.dart';
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
    return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: Color(0xfffbffff),
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child:
                      // Image.network('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
                      Stack(
                    alignment: Alignment.topRight,
                    children: [
                      Image(
                        image: CachedNetworkImageProvider(
                            "https://excel-news-api.fly.dev/uploads/${widget.news.imageurl}"),
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
                  )),
              SizedBox(
                height: 16,
              ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    widget.news.title,
                    style: headingStyle,
                    textAlign: TextAlign.left,
                  )),
              SizedBox(
                height: 8,
              ),
              Text(
                widget.news.content,
                textAlign: TextAlign.left,
                style: pStyle,
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
                                      builder: (context) => EventPage(
                                          int.parse(widget.news.link))))
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        new DateFormat("yMd").format(
                            new DateTime.fromMillisecondsSinceEpoch(
                                int.parse(widget.news.date))),
                        style: TextStyle(
                            color: Color(0xff778585),
                            fontSize: 10,
                            fontWeight: FontWeight.w800,
                            fontFamily: pfontFamily),
                      ),
                      // SizedBox(
                      //   width: 5,
                      // ),
                      // SizedBox(
                      //   child: Container(
                      //     height: 5,
                      //     width: 5,
                      //     decoration: BoxDecoration(
                      //         color: Color(0xff778585),
                      //         borderRadius: BorderRadius.circular(50)),
                      //   ),
                      // ),
                      // SizedBox(
                      //   width: 5,
                      // ),
                      // Text(
                      //   news.date,
                      //   style: TextStyle(
                      //       color: Color(0xff778585),
                      //       fontSize: 10,
                      //       fontWeight: FontWeight.w800,
                      //       fontFamily: pfontFamily),
                      // )
                    ],
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
