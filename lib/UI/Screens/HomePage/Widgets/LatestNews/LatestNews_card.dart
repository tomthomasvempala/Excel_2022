import 'package:excelapp/UI/constants.dart';
import 'package:flutter/material.dart';

class LastestNewsCard extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      color: Color(0xfffbffff),
      child: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
            ),
            SizedBox(height: 16,),
            Align(
              alignment: Alignment.centerLeft,
              child: Text("Excel 2022", style: headingStyle,textAlign: TextAlign.left,)
            ),
            SizedBox(height: 8,),
            Text("It's time to finally launch the journey we've all planned together! Excel 2022 is here with new stuf..",textAlign: TextAlign.left,style: pStyle,),
            SizedBox(height: 16,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Register Now", style: TextStyle(color: Color(0xff0E99E8),fontSize: 12, fontWeight: FontWeight.w600),),
                Text("26th July"+"."+"5:30 PM", style: TextStyle(color: Color(0xff778585),fontSize: 10, fontWeight: FontWeight.w300),),
              ],
            )
          ],
        ),
      )
    );
  }
}
