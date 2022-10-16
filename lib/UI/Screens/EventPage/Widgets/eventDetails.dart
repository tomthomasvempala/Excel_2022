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
      initialIndex: 0,
      length: 4,
<<<<<<< HEAD
      child: 
      Column(
        children: [
          TabBar(
=======
      child: new Scaffold(
        appBar: AppBar(
          toolbarHeight: 10,
          leading: SizedBox(),
          backgroundColor: Color(0xFFEDF5F6),
          // floating: true,
          // pinned: true,
          // snap: true,
          bottom: new TabBar(
>>>>>>> f8fe05aef3dddf16b261d61e053572e33540c06c
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
<<<<<<< HEAD
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
            child: TabBarView(
            children: [
              showEventDetails(1, boxPadding),
              showEventDetails(2, boxPadding),
              showEventDetails(3, boxPadding),
              showEventDetails(4, boxPadding),
=======
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
>>>>>>> f8fe05aef3dddf16b261d61e053572e33540c06c
            ],
                  ),
          ),
<<<<<<< HEAD
        ],
      ),
      // new Scaffold(
      //   appBar: AppBar(
      //     toolbarHeight: 10,
      //     leading: SizedBox(),
      //     backgroundColor: Color(0xFFEDF5F6),
      //     // floating: true,
      //     // pinned: true,
      //     // snap: true,
      //     bottom: new 
      //   ),
      //   body: new 
      // ),
=======
        ),
        body: new TabBarView(
          physics: BouncingScrollPhysics(),
          children: [
            showEventDetails(1, boxPadding),
            showEventDetails(2, boxPadding),
            showEventDetails(3, boxPadding),
            showEventDetails(4, boxPadding),
          ],
        ),
      ),
>>>>>>> f8fe05aef3dddf16b261d61e053572e33540c06c
    );
  }

  Widget showEventDetails(pageNumber, padding) {
    String content;

    if (pageNumber == 1)
      content = widget.eventDetails.about;
    else if (pageNumber == 2)
      content = widget.eventDetails.format;
    else if (pageNumber == 3)
<<<<<<< HEAD
      content = widget.eventDetails.rules;
    else if (pageNumber == 4) content = widget.eventDetails.about;

    return Container(
      decoration: BoxDecoration(
        color: Color(0xffe4edef)
      ),
      child: SingleChildScrollView(
        child: Padding(
            padding: padding,
            child: Text(
              content,
              style: TextStyle(fontFamily: pfontFamily, fontSize: 14),
            )),
      ),
=======
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
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      child: returnWidget,
>>>>>>> f8fe05aef3dddf16b261d61e053572e33540c06c
    );
  }
}
