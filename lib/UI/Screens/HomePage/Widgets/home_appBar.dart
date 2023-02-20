// import 'package:excelapp/UI/Screens/HomePage/Widgets/Notifications/notifications.dart';
import 'package:excelapp/UI/constants.dart';
import 'package:flutter/material.dart';

class ExcelTitle extends StatelessWidget {
  const ExcelTitle({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
      child: Center(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'EXCEL ',
            style: TextStyle(
              color: secondaryColor,
              fontSize: 22,
              fontWeight: FontWeight.w900,
              fontFamily: pfontFamily,
            ),
          ),
          Text(
            '2022',
            style: TextStyle(
              color: secondaryColor,
              fontSize: 22,
              fontWeight: FontWeight.w500,
              fontFamily: pfontFamily,
            ),
          ),
        ],
      )),
    );
  }
}
