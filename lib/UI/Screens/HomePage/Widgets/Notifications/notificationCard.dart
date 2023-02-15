import 'package:excelapp/UI/constants.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class NotificationCard extends StatelessWidget {
  final int id;
  final String title;
  final String description;
  final String time;
  final String link;
  final String icon;
  final bool outline;
  NotificationCard(
      {this.id,
      this.title,
      this.time,
      this.description,
      this.link,
      this.outline = true,
      this.icon = null});

  getTime(time) {
    if (time == "error") {
      return "Some time ago";
    }
    if (new DateTime.now().difference(DateTime.parse(time)).inDays < 1) {
      if (new DateTime.now().difference(DateTime.parse(time)).inHours < 1) {
        if (new DateTime.now().difference(DateTime.parse(time)).inMinutes < 1) {
          return new DateTime.now()
                  .difference(DateTime.parse(time))
                  .inSeconds
                  .toString() +
              ' seconds ago';
        }
        if (new DateTime.now().difference(DateTime.parse(time)).inMinutes ==
            1) {
          return new DateTime.now()
                  .difference(DateTime.parse(time))
                  .inSeconds
                  .toString() +
              ' minute ago';
        }
        return new DateTime.now()
                .difference(DateTime.parse(time))
                .inMinutes
                .toString() +
            ' minutes ago';
      }
      if (new DateTime.now().difference(DateTime.parse(time)).inHours == 1) {
        return new DateTime.now()
                .difference(DateTime.parse(time))
                .inHours
                .toString() +
            ' hour ago';
      }
      return new DateTime.now()
              .difference(DateTime.parse(time))
              .inHours
              .toString() +
          ' hours ago';
    } else if (new DateTime.now().difference(DateTime.parse(time)).inDays ==
        1) {
      return new DateTime.now()
              .difference(DateTime.parse(time))
              .inDays
              .toString() +
          ' day ago';
    } else if (new DateTime.now().difference(DateTime.parse(time)).inDays > 1 &&
        new DateTime.now().difference(DateTime.parse(time)).inDays < 7) {
      return new DateTime.now()
              .difference(DateTime.parse(time))
              .inDays
              .toString() +
          ' days ago';
    } else if (new DateTime.now().difference(DateTime.parse(time)).inDays <
        30) {
      if (((new DateTime.now().difference(DateTime.parse(time)).inDays) / 7)
              .round() ==
          1)
        return ((new DateTime.now().difference(DateTime.parse(time)).inDays) /
                    7)
                .round()
                .toString() +
            ' week ago';
      return ((new DateTime.now().difference(DateTime.parse(time)).inDays) / 7)
              .round()
              .toString() +
          ' weeks ago';
    } else if (new DateTime.now().difference(DateTime.parse(time)).inDays <
        365) {
      if (((new DateTime.now().difference(DateTime.parse(time)).inDays) / 31)
              .round() ==
          1)
        return ((new DateTime.now().difference(DateTime.parse(time)).inDays) /
                    31)
                .round()
                .toString() +
            ' month ago';
      ;

      return ((new DateTime.now().difference(DateTime.parse(time)).inDays) / 31)
              .round()
              .toString() +
          ' months ago';
    } else {
      if (((new DateTime.now().difference(DateTime.parse(time)).inDays) / 365)
              .round() ==
          1)
        return ((new DateTime.now().difference(DateTime.parse(time)).inDays) /
                    365)
                .round()
                .toString() +
            ' year ago';
      return ((new DateTime.now().difference(DateTime.parse(time)).inDays) /
                  365)
              .round()
              .toString() +
          ' years ago';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: !outline
          ? Color.fromARGB(255, 236, 244, 245)
          : Color.fromARGB(255, 251, 255, 255),
      margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: InkWell(
        onTap: () {
          if (link != null) {
            launchUrl(Uri.parse(link));
          }
        },
        child: Container(
          decoration: BoxDecoration(
            border:
                Border.all(width: 0.5, color: Colors.black.withOpacity(0.2)),
            borderRadius: BorderRadius.circular(20),
          ),
          padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
          child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(21),
                color: Color.fromARGB(255, 14, 152, 232),
              ),
              child: Padding(
                padding: EdgeInsets.all(12.25),
                child: ClipRRect(
                  //Change this to Image.network when image server is up
                  child: icon == null
                      ? Image.asset(
                          "assets/events/eventLogo.png",
                          //event.icon,
                          width: 31.5,
                          height: 31.5,
                        )
                      : Image.network(
                          icon,
                          width: 31.5,
                          height: 31.5,
                        ),
                ),
              ),
            ),
            SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.57,
                    child: Text(
                      title,
                      style: TextStyle(
                          color: Color.fromARGB(255, 28, 31, 32),
                          fontWeight: FontWeight.w800,
                          fontFamily: "mulish",
                          fontSize: 14),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.57,
                    child: Text(
                      description,
                      style: TextStyle(
                          color: Color.fromARGB(255, 119, 133, 133),
                          fontWeight: FontWeight.w500,
                          fontFamily: "mulish",
                          fontSize: 11),
                    ),
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.57,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // InkWell(
                        //   onTap: () {
                        //     if (link != null) {
                        //       launchUrl(Uri.parse(link));
                        //     }
                        //   },
                        //   child: Container(
                        //     child: Text(
                        //       'Learn More',
                        //       style: TextStyle(
                        //           color: Color.fromARGB(255, 14, 152, 232),
                        //           fontWeight: FontWeight.w600,
                        //           fontFamily: "mulish",
                        //           fontSize: 11),
                        //     ),
                        //   ),
                        // ),
                        Container(
                          child: Text(
                            getTime(time),
                            style: TextStyle(
                                color: Color.fromARGB(255, 119, 133, 133),
                                fontWeight: FontWeight.w400,
                                fontFamily: "mulish",
                                fontSize: 11),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
