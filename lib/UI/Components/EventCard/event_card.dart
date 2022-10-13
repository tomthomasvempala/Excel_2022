import 'package:cached_network_image/cached_network_image.dart';
import 'package:excelapp/Models/event_card.dart';
import 'package:excelapp/UI/Screens/EventPage/eventPage.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class EventCard extends StatelessWidget {
  final Event event;
  EventCard(this.event);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.white,
          ),
          width: 343,
          child: Padding(
            padding: EdgeInsets.fromLTRB(15, 20, 0, 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
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
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(event.name),
                      Text(event.category),
                      Row(
                        children: [
                          Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Color.fromARGB(255, 215, 245, 245),
                              ),
                              child: Padding(
                                  padding: EdgeInsets.fromLTRB(16, 6, 16, 6),
                                  child: Text('Register'))),
                          Icon(Icons.heart_broken)
                        ],
                      ),
                    ],
                  ),
                ),
                Text('Nov 3')
              ],
            ),
          ),
        ),
        SizedBox(
          height: 20,
        )
      ],
    );
  }
}
