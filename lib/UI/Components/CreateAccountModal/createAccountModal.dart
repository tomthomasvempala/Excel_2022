import 'package:flutter/material.dart';

void showCreateAccountModal(context){
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
                        builder: (context) =>
                            Wrap(children: <Widget>[]));
}

