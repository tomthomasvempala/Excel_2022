import 'package:flutter/material.dart';
import 'package:excelapp/Models/event_details.dart';
import 'package:excelapp/UI/constants.dart';
import 'package:intl/intl.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget getEventDetails(
    {EventDetails eventDetails, bool detailed, double height, double width}) {
  List<Widget> children = [];

  if (eventDetails.isTeam) {
    children.add(detailBox(Icons.person, "Team Size",
        eventDetails.teamSize.toString(), height, width));
  }

  if (eventDetails.prizeMoney != null ) {
    if(eventDetails.prizeMoney != 0) 
    children.add(detailBox(FontAwesomeIcons.trophy, "Prize pool",
       "₹"+ eventDetails.prizeMoney.toString(), height, width));
  }

  return Hero(
    tag: 'EventDescription',
    child: Container(
      color: Color(0xffECF4F5),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 8, 8, 4),
                child: detailBox(
                    Icons.calendar_month,
                    "Date",
                    DateFormat.MMMd()
                        .format(
                            DateTime.parse(eventDetails.datetime.toString()))
                        .toString(),
                    height,
                    width),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 8, 8, 4),
                child: detailBox(
                    Icons.access_time_outlined,
                    "Time",
                    DateFormat('hh:mm a')
                        .format(
                            DateTime.parse(eventDetails.datetime.toString()))
                        .toString(),
                    height,
                    width),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 8, 8, 4),
                child: detailBox(
                    Icons.pin_drop, "Venue", eventDetails.venue, height, width),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 8, 8, 4),
                child: (eventDetails.isTeam == false)
                    ? eventDetails.prizeMoney != null && eventDetails.prizeMoney != 0
                        ? children[0]
                        : (SizedBox(
                            height: height,
                            width: width,
                          ))
                    : detailBox(Icons.person, "Team Size",
                        eventDetails.teamSize.toString(), height, width),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: (children.length > 1)
                ? [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                      child: children[1],
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                      child: SizedBox(
                        height: height,
                        width: width,
                      ),
                    )
                  ]
                : [],
          )
        ],
      ),
    ),
  );
}

Widget detailBox(
    IconData icon, String title, String data, double height, double width) {
  return Container(
    // height: 66,
    // width: 155,
    height: height,
    width: width,

    decoration: BoxDecoration(
        color: Color(0xFFFBFFFF), borderRadius: BorderRadius.circular(24)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.fromLTRB(15, 5.23, 0, 0),
          child: FaIcon(
            icon,
            size: 20.0,
            color: Color(0xFF0E99E8),
          ),
        ),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.fromLTRB(11, 0, 0, 0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Color(0xFF778585),
                    fontSize: 11,
                    fontFamily: pfontFamily,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  data,
                  style: TextStyle(
                    color: Color(0xFF3D4747),
                    fontSize: 14,
                    fontFamily: pfontFamily,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ))
      ],
    ),
  );
}
