import 'package:flutter/material.dart';

Widget darkAppbar({Color color}) {
  return PreferredSize(
    child: AppBar(
      backgroundColor: color ?? Color(0xff272733),
      elevation: 0,
    ),
    preferredSize: Size.fromHeight(0),
  );
}
