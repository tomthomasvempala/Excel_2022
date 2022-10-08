import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

import '../../../../constants.dart';

class QuickAccessBar extends StatelessWidget {
   QuickAccessBar({Key key}) : super(key: key);

  final labelStyle = TextStyle(
    color: primaryColor,
    fontFamily: pfontFamily,
    fontSize: 13,
    fontWeight: FontWeight.w500,
    //shadows: [Shadow(blurRadius: 10, color: primaryColor)],
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            quickAccessButton(Icons.qr_code_scanner_outlined,"Scan QR"),
            quickAccessButton(Icons.phone_in_talk_outlined,"Contact Us"),
            quickAccessButton(Icons.location_on_outlined,"Reach Us"),
            quickAccessButton(Icons.notifications_none_outlined,"Updates"),
      ]),
    );
  }

  Widget quickAccessButton(IconData iconName,String buttonName){
    return Container(
      //decoration: BoxDecoration(color: Colors.brown),
      margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {},
              child: Icon(iconName,color: primaryColor,size: 28,),
              style: ButtonStyle(
                  fixedSize: MaterialStateProperty.all(const Size(60,60)),
                  padding: MaterialStateProperty.all(const EdgeInsets.all(15)),
                  backgroundColor: MaterialStateProperty.all(Color(0xE8E8E8FF)),
                  shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)
                      ))),
            ),
            SizedBox(height: 10,),
            Text(
              buttonName,
              style: labelStyle,
            )
          ],
        ));
  }
}
