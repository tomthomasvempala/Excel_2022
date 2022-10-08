// import 'package:excelapp/UI/Screens/HomePage/Widgets/Notifications/notifications.dart';
import 'package:excelapp/UI/constants.dart';
import 'package:flutter/material.dart';

Widget homeAppBar(context) {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    title: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'EXCEL ',
          style: TextStyle(
            color: secondaryColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: pfontFamily,
          ),
        ),
        Text(
          '2022',
          style: TextStyle(
            color: secondaryColor,
            fontSize: 20,
            fontWeight: FontWeight.w100,
            fontFamily: pfontFamily,
          ),
        ),
      ],
    )),
    // actions: <Widget>[
    //   IconButton(
    //     onPressed: () {
    //       Navigator.push(
    //         context,
    //         MaterialPageRoute(
    //           builder: (context) => NotificationsPage(),
    //         ),
    //       );
    //     },
    //     icon: Icon(
    //       Icons.notifications,
    //       color: primaryColor,
    //     ),
    //   ),
    //   SizedBox(width: 10)
    // ],
    iconTheme: IconThemeData(color: primaryColor),
  );
}
