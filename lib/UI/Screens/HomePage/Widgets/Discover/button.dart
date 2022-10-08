import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class DiscoverButtons extends StatelessWidget {
  final Map<String, dynamic> data;
  final width;
  DiscoverButtons({this.data, this.width});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: data["padding"],
      child: Container(
        height: 72,
        width: width,
        decoration: data["decoration"],
      ),
    );
  }
}
