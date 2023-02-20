import 'package:excelapp/Services/Database/hive_operations.dart';
import 'package:excelapp/UI/Screens/HomePage/Widgets/Notifications/notifications.dart';
import 'package:excelapp/UI/Screens/HomePage/Widgets/QuickAccess/modals/contactUsModal.dart';
import 'package:excelapp/UI/Screens/HomePage/Widgets/QuickAccess/modals/reachUsModal.dart';
import 'package:excelapp/UI/Screens/HomePage/Widgets/aboutExcel.dart';
import 'package:excelapp/UI/Themes/colors.dart';
import 'package:excelapp/UI/Themes/profile_themes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../constants.dart';

class QuickAccessBar extends StatefulWidget {
  QuickAccessBar({Key key}) : super(key: key);

  @override
  State<QuickAccessBar> createState() => _QuickAccessBarState();
}

class _QuickAccessBarState extends State<QuickAccessBar> {
  final labelStyle = TextStyle(
    color: black300,
    fontFamily: pfontFamily,
    fontSize: 12,
    fontWeight: FontWeight.w500,
    //shadows: [Shadow(blurRadius: 10, color: primaryColor)],
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        //quickAccessButton(context, FontAwesomeIcons.qrcode, "Scan QR", null),
        quickAccessButton(
            context, "assets/excel logo.png", "About", AboutExcelPopUp(),
            inverted: true),
        quickAccessButton(context, "assets/icons/call.png", "Contact",
            ContactUsModal(context)),
        quickAccessButton(context, "assets/icons/location.png", "Reach Us",
            ReachUsModal(context)),
        notificationButton(context),
      ]),
    );
  }

  Widget quickAccessButton(BuildContext context, String iconName,
      String buttonName, Widget modalSheet,
      {bool inverted = false}) {
    return Container(
        //decoration: BoxDecoration(color: Colors.brown),
        margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            OutlinedButton(
              // onLongPress: () async {
              //   // await HiveDB.storeData(valueName: 'notifications', value: null);
              //   // await HiveDB.storeData(
              //   //     valueName: 'unread_notifications', value: true);
              //   //     print('done');
              //   // SharedPreferences prefs = await SharedPreferences.getInstance();
              //   // prefs.setBool('firstTime',true);
              //   // print('done');
              // },
              onPressed: () {
                showModalBottomSheet<dynamic>(
                  isScrollControlled: true,
                  useRootNavigator: true,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40))),
                  constraints: BoxConstraints(
                    minWidth: MediaQuery.of(context).size.width,
                  ),
                  context: context,
                  builder: (context) => Wrap(children: <Widget>[modalSheet]),
                );
              },
              child: Image.asset(iconName, height: 28),
              style: ButtonStyle(
                  fixedSize: MaterialStateProperty.all(const Size(60, 60)),
                  padding: MaterialStateProperty.all(const EdgeInsets.all(16)),
                  side: MaterialStateProperty.all(
                    BorderSide(
                      color: white300,
                      width: 1.2,
                    ),
                  ),
                  backgroundColor:
                      MaterialStateProperty.all(inverted ? blue500 : white200),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)))),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              buttonName,
              style: labelStyle,
            )
          ],
        ));
  }

  Widget notificationButton(context) {
    return Container(
        //decoration: BoxDecoration(color: Colors.brown),
        margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => NotificationsPage()))
                        .then((value) {
                      setState(() {});
                    });
                  },
                  child: Image.asset("assets/icons/notification.png", height: 28),
                  style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all(const Size(60, 60)),
                    padding:
                        MaterialStateProperty.all(const EdgeInsets.all(15)),
                    backgroundColor: MaterialStateProperty.all(white200),
                    side: MaterialStateProperty.all(
                      BorderSide(
                        color: white300,
                        width: 1.2,
                      ),
                    ),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)),
                    ),
                  ),
                ),
                FutureBuilder(
                    future:
                        HiveDB.retrieveData(valueName: 'unread_notifications'),
                    builder: (context, snapshot) {
                      if (snapshot.hasData && snapshot.data > 0)
                        return Transform.translate(
                          offset: Offset(22, -22),
                          child: Container(
                            height: 12,
                            width: 12,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Color(0xFFFD7B69)),
                          ),
                        );
                      else {
                        return Container();
                      }
                    })
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Notifications",
              style: labelStyle,
            )
          ],
        ));
  }
}
