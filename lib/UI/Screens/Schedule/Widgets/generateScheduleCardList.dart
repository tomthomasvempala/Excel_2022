import 'package:cached_network_image/cached_network_image.dart';
import 'package:excelapp/Models/schedule_model.dart';
import 'package:intl/intl.dart';
import 'package:excelapp/UI/Screens/EventPage/eventPage.dart';
import 'package:excelapp/UI/constants.dart';
import 'package:flutter/material.dart';

class TimeTableList extends StatelessWidget {
  final eventDetails;

  TimeTableList(this.eventDetails);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[Padding(padding: EdgeInsets.all(8))] +
          List.generate(
            eventDetails.length,
            (i) => ScheduleEvent(eventDetails[i], i, eventDetails.length, (i>0)?eventDetails[i-1].datetime: ""),
          ) +
          [
            eventDetails.isEmpty
                ? Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Center(
                        child: Text(
                      "No Events",
                      style: TextStyle(fontSize: 13, color: Colors.grey),
                    )),
                  )
                : Center(),
            SizedBox(
              height: 90,
            )
          ],
    );
  }
}

class ScheduleEvent extends StatelessWidget {
  final ScheduleModel eventSchedule;
  final int lineNumber;
  final int eventLength;
  final String prevDateTime;

  ScheduleEvent(this.eventSchedule, this.lineNumber, this.eventLength, this.prevDateTime);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(25, 20, 25, 0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            children: [
              SizedBox(height: 20,),
              Container(
                width: 70,
                  child: Text(
                    (prevDateTime==eventSchedule.datetime) ? "" : DateFormat('hh:mma').format(DateTime.parse(eventSchedule.datetime)).toLowerCase(),
                    textAlign: TextAlign.right,
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                  )
              ),
            ],
          ),
          //lineAndDot(lineNumber, eventLength),
          SizedBox(width: 15,),
          Expanded(
            child: InkWell(
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => EventPage(eventSchedule.id),
                //   ),
                // );

              },
              radius: 30,
              borderRadius: BorderRadius.circular(30),
              child: Container(
                padding: EdgeInsets.all(17),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), color: Color(0xffFBFFFF),),
                margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                child: Row(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(18)),color: Color(0xff0E99E8),),
                      padding: EdgeInsets.all(10),
                      child: CachedNetworkImage(
                        imageUrl: eventSchedule.icon,
                        width: 50,
                        height: 50,
                      ),
                    ),
                    SizedBox(width: 12,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                            width: 140,
                            child: Text(eventSchedule.name ?? "", style: TextStyle(fontWeight: FontWeight.w800, fontSize: 14, color: Color(0xff1C1F20)),)
                        ),
                        SizedBox(height: 8,),
                        Text("View Event", style: TextStyle(fontSize: 11, color: Color(0xff0E99E8), fontWeight: FontWeight.w600),),
                      ],
                    )
                  ],
                )
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget lineAndDot(lineNumber, noOfEvents) {
  noOfEvents = noOfEvents - 1;
  double rowHeight = 95.0;
  double left = 25;
  double circleRadius = 4.5;
  double width = left * 2 - 10;
  double top = 42;
  return Stack(
    children: <Widget>[
      Container(
        width: width,
      ),
      Container(
        margin: lineNumber != 0
            ? (lineNumber == noOfEvents
                ? EdgeInsets.only(left: left, bottom: rowHeight / 2)
                : EdgeInsets.only(left: left))
            : EdgeInsets.only(left: left, top: rowHeight / 2),
        width: 1.0,
        height: lineNumber != 0
            ? lineNumber == noOfEvents
                ? rowHeight / 2
                : rowHeight
            : rowHeight / 2,
        color: noOfEvents == 0 ? Colors.transparent : primaryColor,
      ),
      Container(
        margin: EdgeInsets.only(left: left - circleRadius, top: top),
        child: CircleAvatar(
          backgroundColor: primaryColor,
          radius: circleRadius,
        ),
      )
    ],
  );
}
