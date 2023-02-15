import 'package:excelapp/Services/Database/hive_operations.dart';
import 'package:excelapp/UI/Components/Appbar/appbar.dart';
import 'package:excelapp/UI/Components/LoadingUI/loadingAnimation.dart';
import 'package:excelapp/UI/constants.dart';
import 'package:flutter/material.dart';
import 'package:excelapp/UI/Screens/HomePage/Widgets/Notifications/notificationCard.dart';

class NotificationsPage extends StatelessWidget {
  Future<Map> notifications() async {
    List noti = await HiveDB.retrieveData(valueName: 'notifications');
    var count = await HiveDB.retrieveData(valueName: 'unread_notifications');
    await HiveDB.storeData(valueName: 'unread_notifications', value: 0);
    // return {
    //   'notifications': [
    //     {'title': 'Hey', 'body': 'body is here'},
    //     {
    //       'title': 'Hey',
    //       'body':
    //           'body is efsfegsefeffesfewfasfefwefefafefegfsegsegsegsGEGSEFEFhere'
    //     },
    //     {'title': 'Hey', 'body': 'body is here'},
    //     {
    //       'title': 'Hey',
    //       'body':
    //           'body is efsfegsefeffesfewfasfefwefefafefegfsegsegsegsGEGSEFEFhere'
    //     },
    //     {'title': 'Hey', 'body': 'body is here'},
    //     {
    //       'title': 'Hey',
    //       'body':
    //           'body is efsfegsefeffesfewfasfefwefefafefegfsegsegsegsGEGSEFEFhere'
    //     }
    //   ],
    //   'count': 3
    // };

    return {'notifications': noti ?? [], 'count': count??noti.length};
  }

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
          onPressed: () {
            Navigator.pop(context);
          },
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
      body: FutureBuilder(
          future: notifications(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List notificationData = snapshot.data['notifications'];
              int unread = snapshot.data['count'];
              notificationData = notificationData.reversed.toList();
              if (notificationData.length == 0) {
                return Center(
                    child: Text("Seems like you have no new notifcations"));
              }
              return SingleChildScrollView(
                child: Column(
                  children: List.generate(
                    notificationData.length,
                    (index) {
                      // return FlutterLogo();
                            // notificationData[index]['data'] =
                            //     notificationData[index]['data'] ?? {};
                      return NotificationCard(
                        title: notificationData[index]['title'],
                        time: notificationData[index]['time']??"error",
                        description: notificationData[index]['body'],
                        // link: "https://www.google.com",
                        outline: (index < unread)?true:false,
                        icon:null
                      );
                    },
                  ),
                ),
              );
            } else if (snapshot.hasError) {
              print("has error");
              {
                return Text("Sorry");
              }
            }

            return Center(child: LoadingAnimation());
          }),
    );
  }
}

// List<Map<String, dynamic>> notificationData = [
//   {
//     "id": 1,
//     "title": "Lorem Ipsum",
//     "time": "2023-02-02T00:00:00",
//     "content":
//         "Lorem ipsum dolor sit amet, consectetur adip is cing elit. Netus platea quis malesu",
//     "button": "Read more",
//     "link": "https://www.google.com"
//   },
//   {
//     "id": 2,
//     "title": "Lorem Ipsum",
//     "time": "2020-01-04T00:00:00",
//     "content":
//         "Lorem ipsum dolor sit amet, consectetur adip is cing elit. Netus platea quis malesu",
//     "button": "Read more",
//     "link": "https://www.google.com"
//   },
//   {
//     "id": 3,
//     "title": "Lorem Ipsum",
//     "time": "2023-01-15T00:00:00",
//     "content":
//         "Lorem ipsum dolor sit amet, consectetur adip is cing elit. Netus platea quis malesu",
//     "button": "Read more",
//     "link": "https://www.google.com"
//   }
// ];
