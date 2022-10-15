import 'package:excelapp/Models/event_details.dart';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../constants.dart';

class MoreEventDetails extends StatefulWidget {
  final EventDetails eventDetails;
  MoreEventDetails({this.eventDetails});

  @override
  State<MoreEventDetails> createState() => _MoreEventDetailsState();
}

class _MoreEventDetailsState extends State<MoreEventDetails> {
  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    var boxPadding = EdgeInsets.fromLTRB(deviceWidth / 12,
        deviceHeight / 52.312, deviceWidth / 12, deviceHeight / 52.312);
    return DefaultTabController(
      length: 4,
      child: new Scaffold(
        body: new NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              new SliverAppBar(
                toolbarHeight: 10,
                leading: SizedBox(),
                backgroundColor: Color(0xFFEDF5F6),
                floating: true,
                pinned: true,
                snap: true,
                bottom: new TabBar(
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicatorWeight: 2,
                  indicatorColor: primaryColor,
                  // labelColor: Color(0xFF3D4747),
                  labelColor: primaryColor,
                  unselectedLabelColor: Color(0xFF3D4747),
                  labelStyle: TextStyle(
                      fontSize: 14,
                      fontFamily: pfontFamily,
                      fontWeight: FontWeight.bold),
                  tabs: [
                    Tab(
                      text: 'About',
                    ),
                    Tab(
                      text: 'Format',
                    ),
                    Tab(
                      text: 'Rules',
                    ),
                    Tab(
                      text: 'Contact',
                    ),
                  ],
                ),
              ),
            ];
          },
          body: new TabBarView(
            children: [
              showEventDetails(1, boxPadding),
              showEventDetails(2, boxPadding),
              showEventDetails(3, boxPadding),
              showEventDetails(4, boxPadding),
            ],
          ),
        ),
      ),
    );
    ;
  }

  Widget showEventDetails(pageNumber, padding) {
    Widget returnWidget;
    if (pageNumber == 1)
      returnWidget = Padding(
          padding: padding,
          child: Text(
            widget.eventDetails.about,
            style: TextStyle(fontFamily: pfontFamily, fontSize: 14),
          ));
    else if (pageNumber == 2)
      returnWidget = Padding(
          padding: padding,
          child: Text(widget.eventDetails.format,
              style: TextStyle(fontFamily: pfontFamily, fontSize: 14)));
    else if (pageNumber == 3)
      returnWidget = Padding(
          padding: padding,
          child: Text(widget.eventDetails.rules,
              style: TextStyle(fontFamily: pfontFamily, fontSize: 14)));
    else if (pageNumber == 4)
      returnWidget = Padding(
          padding: padding,
          child: Text(widget.eventDetails.about,
              style: TextStyle(fontFamily: pfontFamily, fontSize: 14)));
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: returnWidget,
    );
  }
}
