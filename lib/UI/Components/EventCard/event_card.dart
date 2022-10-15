import 'package:cached_network_image/cached_network_image.dart';
import 'package:excelapp/Models/event_card.dart';
import 'package:excelapp/UI/Screens/EventPage/eventPage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shimmer/shimmer.dart';

class EventCard extends StatelessWidget {
  final Event event;
  EventCard(this.event);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 15, vertical: 0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.white,
          ),
          child: Padding(
            padding: EdgeInsets.fromLTRB(15, 20, 0, 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(21),
                      color: Color.fromARGB(255, 14, 152, 232),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(12.25),
                      child: ClipRRect(
                        child: Image.network(
                          event.icon,
                          width: 31.5,
                          height: 31.5,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          event.name,
                          style: TextStyle(
                              color: Color.fromARGB(255, 28, 31, 32),
                              fontWeight: FontWeight.w800,
                              fontFamily: "mulish",
                              fontSize: 14),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.46,
                          child: Text(
                            event.desc,
                            style: TextStyle(
                                color: Color.fromARGB(255, 119, 133, 133),
                                fontWeight: FontWeight.w500,
                                fontFamily: "mulish",
                                fontSize: 11),
                          ),
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Color.fromARGB(255, 215, 245, 245),
                                ),
                                child: Padding(
                                    padding: EdgeInsets.fromLTRB(16, 6, 16, 6),
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    EventPage(123)));
                                      },
                                      child: Container(
                                        child: Text(
                                          'Register',
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 14, 152, 232),
                                              fontWeight: FontWeight.w700,
                                              fontFamily: "mulish",
                                              fontSize: 11),
                                        ),
                                      ),
                                    ))),
                            SizedBox(width: 10),
                            FaIcon(FontAwesomeIcons.heart,
                                color: Color.fromARGB(255, 179, 193, 197),
                                size: 20),
                          ],
                        ),
                      ],
                    ),
                  ),
                ]),
                Container(
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 230, 255, 234),
                      borderRadius: BorderRadiusDirectional.only(
                          topStart: Radius.circular(24),
                          bottomStart: Radius.circular(24))),
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Text(
                          event.date.substring(3, 6),
                          style: TextStyle(
                              color: Color.fromARGB(255, 7, 131, 131),
                              fontWeight: FontWeight.w800,
                              fontFamily: "mulish",
                              fontSize: 11),
                        ),
                        Text(
                          event.date.substring(0, 2),
                          style: TextStyle(
                              color: Color.fromARGB(255, 18, 221, 197),
                              fontWeight: FontWeight.w800,
                              fontFamily: "mulish",
                              fontSize: 18),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: 15,
        )
      ],
    );
  }
}
