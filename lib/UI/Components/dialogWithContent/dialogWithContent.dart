import 'package:flutter/material.dart';

dialogWithContent({@required Widget child, @required context}) {
  showModalBottomSheet(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40), topRight: Radius.circular(40))),
      constraints: BoxConstraints(
        minWidth: MediaQuery.of(context).size.width,
        // maxHeight: 250,
      ),
      useRootNavigator: true,
      context: context,
      builder: (context) {
        return child;
      });
}
