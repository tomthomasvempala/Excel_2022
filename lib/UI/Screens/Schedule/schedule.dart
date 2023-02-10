import 'dart:async';
import 'package:excelapp/Services/API/schedule_api.dart';
import 'package:excelapp/UI/Components/LoadingUI/loadingAnimation.dart';
import 'package:excelapp/UI/Screens/Schedule/Widgets/schedulePage.dart';
import 'package:excelapp/UI/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../Providers/scheduleProvider.dart';

class Schedule extends StatefulWidget {
  @override
  _ScheduleState createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  bool dataLoaded = false;
  StreamController<dynamic> estream;

  fetchScheduleDetails() async {
    var  result1 = await fetchScheduleFromStorage();
    if(result1!=null)
      estream.add(result1);
    var result2 = await fetchAndStoreScheduleFromNet();
    if(result2!='error' && result1!=result2)
      estream.add(result1);
    if(result2=='error' && result1==null)
      estream.add('error');
  }

  @override
  void initState() {
    super.initState();
    estream = StreamController<dynamic>();
    fetchScheduleDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: estream.stream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data == "error") {
              return errorRetry();
            }
            return ChangeNotifierProvider(
              create: (context) =>ScheduleProvider(snapshot.data),
              child: SchedulePage(scheduleData: snapshot.data),
            );
          } else {
            return Stack(
              fit: StackFit.expand,
              children: <Widget>[
                //Background Image
                LoadingAnimation()
              ],
            );
          }
        },
      ),
    );
  }

  Widget errorRetry() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Couldn't fetch Schedule",
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
          SizedBox(height: 30),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: () {
              fetchScheduleDetails();
            },
            child: Text(
              "Retry",
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
