import 'package:excelapp/UI/Components/Appbar/appbar.dart';
import 'package:excelapp/UI/constants.dart';
import 'package:flutter/material.dart';
import 'package:excelapp/UI/Screens/HomePage/Widgets/Notifications/notificationCard.dart';

class NotificationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 236, 244, 245),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 251, 255, 255),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: secondaryColor,
          onPressed: () {},
        ),
        titleTextStyle: TextStyle(
          color: secondaryColor,
          fontFamily: pfontFamily,
          fontSize: 18,
          fontWeight: FontWeight.w700,
        ),
        title: Text("Notifications"),
        actions: [],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.fromLTRB(0, 10, 0, 100),
        child: Column(
          children: List.generate(
            notificationData.length,
            (index) => NotificationCard(
              title: notificationData[index]['title'],
              time: notificationData[index]['time'],
              description: notificationData[index]['content'],
              button: notificationData[index]['button'],
              link: notificationData[index]['link'],
            ),
          ),
        ),
      ),
    );
  }
}

List<Map<String, dynamic>> notificationData = [
  {
    "id": 1,
    "title": "Lorem Ipsum",
    "time": "2023-02-02T00:00:00",
    "content":
        "Lorem ipsum dolor sit amet, consectetur adip is cing elit. Netus platea quis malesu",
    "button": "Read more",
    "link": "https://www.google.com"
  },
  {
    "id": 2,
    "title": "Lorem Ipsum",
    "time": "2020-01-04T00:00:00",
    "content":
        "Lorem ipsum dolor sit amet, consectetur adip is cing elit. Netus platea quis malesu",
    "button": "Read more",
    "link": "https://www.google.com"
  },
  {
    "id": 3,
    "title": "Lorem Ipsum",
    "time": "2023-01-15T00:00:00",
    "content":
        "Lorem ipsum dolor sit amet, consectetur adip is cing elit. Netus platea quis malesu",
    "button": "Read more",
    "link": "https://www.google.com"
  }
];
