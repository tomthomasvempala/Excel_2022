import 'dart:convert';

import 'package:excelapp/Models/event_details.dart';
import 'package:excelapp/UI/Screens/CampusAmbassador/AmbassadorPage/referedUsers.dart';
import 'package:excelapp/UI/Themes/colors.dart';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:html/dom.dart' as dom;
import 'package:url_launcher/url_launcher.dart';
import '../../../constants.dart';

class MoreEventDetails extends StatefulWidget {
  final EventDetails eventDetails;

  MoreEventDetails({this.eventDetails});

  @override
  State<MoreEventDetails> createState() => _MoreEventDetailsState();
}

class _MoreEventDetailsState extends State<MoreEventDetails>
    with TickerProviderStateMixin {
  double height = 800.0;
  int selectedIndex;
  String content;
  List<String> contents = [];
  double lines;
  TabController _controller;

  @override
  void initState() {
    _controller = TabController(length: 4, vsync: this, initialIndex: 0);

    contents.add(widget.eventDetails.about);
    contents.add(widget.eventDetails.format);
    contents.add(widget.eventDetails.rules);

    var lines = contents[0].split(" ").length / 6.0;
    height = lines < 15 ? 560 : lines * 30;

    _controller.addListener(() {
      selectedIndex = _controller.index;

      setState(() {
        if (selectedIndex < 3) {
          var lines = contents[selectedIndex].split(" ").length / 5.0;
          height = lines < 15 ? 560 : lines * 30;
        } else
          height = 560;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(widget.eventDetails.eventHead1);
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    var boxPadding = EdgeInsets.fromLTRB(deviceWidth / 12,
        deviceHeight / 52.312, deviceWidth / 12, deviceHeight / 52.312);
    return DefaultTabController(
      initialIndex: 0,
      length: 4,
      child: Container(
        color: white200,
        height: height,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 15),
            TabBar(
              controller: _controller,
              padding: EdgeInsets.fromLTRB(7, 0, 7, 0),
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorWeight: 3,
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
            Expanded(
              child: Container(
                color: white100,
                child: TabBarView(
                  controller: _controller,
                  physics: BouncingScrollPhysics(),
                  children: [
                    showEventDetails(0, boxPadding),
                    showEventDetails(1, boxPadding),
                    showEventDetails(2, boxPadding),
                    contactTab(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget showEventDetails(pageNumber, padding) {
    switch (pageNumber) {
      case 0:
        content = widget.eventDetails.about ??
            "This is event is about an event. Please consult Ashish for more content in dummy data in the backend.";
        break;
      case 1:
        content = (widget.eventDetails.format != null)
            ? widget.eventDetails.format.replaceAll('<h2/>', "</h2>")
            : "No event format";
        break;
      case 2:
        content = widget.eventDetails.rules ??
            "Rules are not specified for this event";
        break;
    }

    return Padding(
          padding: padding,
          child: Html(
            data: content,
            customTextStyle: (node, baseStyle) {
              if (node is dom.Element)
                switch (node.localName) {
                  case "h2":
                    return TextStyle(
                        fontFamily: pfontFamily,
                        fontSize: 18,
                        height: 1.3,
                        color: Color(0xff3D4747));
                  case "p":
                    return TextStyle(
                        fontFamily: pfontFamily,
                        fontSize: 14.7,
                        height: 1.5,
                        color: Color(0xff3D4747));
                  case "li":
                    return TextStyle(
                        fontFamily: pfontFamily,
                        fontSize: 14.7,
                        height: 1.7,
                        color: Color(0xff3D4747));
                }
              return TextStyle(
                  fontFamily: pfontFamily,
                  fontSize: 14.7,
                  height: 1.5,
                  color: Color(0xff3D4747));
            },
            defaultTextStyle: TextStyle(
                color: Color.fromARGB(255, 61, 71, 71),
                fontFamily: pfontFamily,
                height: 1.7,
                fontSize: 14.5,
                fontWeight: FontWeight.w400),
          ),
    );
  }

  Widget contactTab() {
    var eventhead1 = json.decode(widget.eventDetails.eventHead1);
    var eventhead2 = json.decode(widget.eventDetails.eventHead2);
    return ListView(
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(vertical: 0, horizontal: 18),
      children: [
        const SizedBox(height: 8),
        eventHeadDetails(
            eventhead1['name'], eventhead1['phoneNumber'], eventhead1['email']),
        eventHeadDetails(
            eventhead2['name'], eventhead2['phoneNumber'], eventhead2['email']),
      ],
    );
  }

  Widget eventHeadDetails(
      String eventHeadName, String eventHeadNumber, String eventHeadEmail) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 6),
      width: MediaQuery.of(context).size.width * 1,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: white400,
            width: 1,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(eventHeadName,
                  style: TextStyle(
                    fontFamily: pfontFamily,
                    fontSize: 16,
                    height: 1.3,
                    color: black400,
                    fontWeight: FontWeight.w700,
                  )),
              // SizedBox(
              //   height: 5,
              // ),
              // Text(
              //     eventHeadNumber,
              //     style: TextStyle(
              //         fontFamily: pfontFamily,
              //         fontSize: 14,
              //         height: 1.5,
              //         color: Color(0xff3D4747))
              // ),
            ],
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () async {
                    final Uri launchUri = Uri(
                      scheme: 'tel',
                      path: eventHeadNumber,
                    );
                    await launchUrl(launchUri);
                  },
                  icon: Image.asset("assets/icons/call.png", height: 24),
                ),
                IconButton(
                    onPressed: () async {
                      Uri launchUri = Uri(
                        scheme: 'mailto',
                        path: eventHeadEmail,
                      );
                      if (await canLaunchUrl(launchUri) != null) {
                        await launchUrl(launchUri);
                      } else {
                        throw 'Could not launch';
                      }
                    },
                    icon: Image.asset("assets/icons/message.png", height: 24),
                    color: Colors.blue,
                    iconSize: 28),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
