import 'package:flutter/material.dart';

class DiscoverButtons extends StatelessWidget {
  final Map<String, dynamic> data;
  final width;
  DiscoverButtons({this.data, this.width});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height / 11.278;

    return Padding(
      // padding: data["padding"],
      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: Container(
        height: height,
        width: width,
        decoration: data["decoration"],
      ),
    );
  }
}
