import 'package:flutter/material.dart';

class DiscoverButtons extends StatelessWidget {
  final Map<String, dynamic> data;
  final width;
  DiscoverButtons({this.data, this.width});

  @override
  Widget build(BuildContext context) {
    return Padding(
      // padding: data["padding"],
      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: Container(
        height: 72,
        width: width,
        decoration: data["decoration"],
      ),
    );
  }
}
