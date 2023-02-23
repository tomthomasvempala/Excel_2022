import 'package:cached_network_image/cached_network_image.dart';
import 'package:excelapp/Models/event_details.dart';
import 'package:excelapp/UI/Screens/EventPage/Widgets/eventDescription.dart';
import 'package:excelapp/UI/Screens/EventPage/Widgets/eventDetails.dart';
import 'package:excelapp/UI/Screens/EventPage/Widgets/registerButton.dart';
import 'package:excelapp/UI/Themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:excelapp/UI/constants.dart';
import 'package:excelapp/UI/Components/LikeButton/likeButton.dart';

class EventPageBody extends StatelessWidget {
  final EventDetails eventDetails;
  final String heroname;
  EventPageBody({this.eventDetails, this.heroname = 'eventIcon'});

  @override
  Widget build(BuildContext context) {
    Widget registerButton;

    if (eventDetails.needRegistration == false && eventDetails.button == null)
      registerButton = SizedBox();
    else
      registerButton = RegisterButton(eventDetails: eventDetails);

    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    Color textColor = Color(0xFF1C1F20);
    return Scaffold(
      //backgroundColor: Color(0xffECF4F5),
      resizeToAvoidBottomInset: true,
      backgroundColor: white200,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: deviceHeight,
              child: Column(
                children: <Widget>[
                  SafeArea(
                    bottom: false,
                    child: Container(),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Column(
                        children: [
                          Column(
                            children: [
                              SizedBox(height: 10),
                              Container(
                                alignment: Alignment.centerLeft,
                                child: IconButton(
                                  icon: new Icon(Icons.arrow_back),
                                  iconSize: 30.0,
                                  color: Color(0xFF1C1F20),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(35, 10, 35, 10),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(
                                      child: Text(
                                        eventDetails.name,
                                        maxLines: 3,
                                        style: TextStyle(
                                          overflow: TextOverflow.ellipsis,
                                          decoration: TextDecoration.none,
                                          fontFamily: pfontFamily,
                                          fontSize: 32.0,
                                          fontWeight: FontWeight.w900,
                                          color: textColor,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Hero(
                                      tag: '${this.heroname}${eventDetails.id}',
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(21),
                                          color: Color.fromARGB(255, 14, 152, 232),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.all(12.25),
                                          child: ClipRRect(
                                            //Change this to Image.network when image server is up
                                            // child: Image.asset(
                                            //   "assets/events/eventLogo.png",
                                            //   //event.icon,
                                            //   width: 31.5,
                                            //   height: 31.5,
                                            // ),
                                            child: (eventDetails.icon
                                                    .startsWith("Microsoft"))
                                                ? (Image.asset(
                                                    "assets/events/eventLogo.png",
                                                    //event.icon,
                                                    width: 31.5,
                                                    height: 31.5,
                                                  ))
                                                : CachedNetworkImage(
                                                    imageUrl: eventDetails.icon,
                                                    width: 31.5,
                                                    height: 31.5,
                                                    fit: BoxFit.contain,
                                                  ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                              
                          //Event Details
                              
                          getEventDetails(
                              eventDetails: eventDetails,
                              detailed: true,
                              height: deviceHeight / 12.681,
                              width: deviceWidth / 2.477),
                              
                          Container(
                            child: MoreEventDetails(
                              eventDetails: eventDetails,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 90,
              padding: EdgeInsetsDirectional.only(bottom: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40), topRight: Radius.circular(40)),
                boxShadow: [
                  new BoxShadow(
                    color: Color.fromARGB(94, 28, 31, 32),
                    blurRadius: 5.0,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 8),
                  Image.asset('assets/icons/divider.png'),
                  SizedBox(height: 8),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    registerButton,
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: white200,
                      ),
                      child: Padding(
                          padding: EdgeInsets.all(10),
                          child: LikeButton(eventDetails: eventDetails)),
                    ),
                  ]),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
