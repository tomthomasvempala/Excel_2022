import 'dart:async';
import 'package:excelapp/Services/API/schedule_api.dart';
import 'package:excelapp/Models/schedule_model.dart';
import 'package:excelapp/UI/Components/LoadingUI/loadingAnimation.dart';
import 'package:excelapp/UI/Screens/Schedule/Widgets/schedulePage.dart';
import 'package:excelapp/UI/constants.dart';
import 'package:flutter/material.dart';

class Schedule extends StatefulWidget {
  @override
  _ScheduleState createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  bool dataLoaded = false;
  StreamController<dynamic> estream;

  fetchfromNet() async {
    var dataFromNet = await fetchAndStoreScheduleFromNet();
    estream.add({"day1": [], "day2": [], "day3": []});
    // if (!dataLoaded || dataFromNet != "error") {
    //   estream.add(dataFromNet);
    //   dataLoaded = true;
    // }
  }

  initialisePage() async {
    var datafromStorage = await fetchScheduleFromStorage();
    if (datafromStorage != null) {
      estream.add(datafromStorage);
      dataLoaded = true;
    }
    //temp data
    await fetchData();
    //await fetchfromNet();
  }

  @override
  void initState() {
    estream = StreamController<dynamic>();
    initialisePage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: estream.stream,
        builder: (context, snapshot) {
          // If couldnt fetch
          if (snapshot.data == "error") return errorRetry();
          // If got data
          if (snapshot.hasData)
            return new SchedulePage(scheduleData: snapshot.data);
          // When loading
          return LoadingAnimation();
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
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => Schedule(),
                ),
              );
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

  fetchData() async {
    estream.add({
      "day0": [
        ScheduleModel(
          id: 13,
          name: "Wave Cloning",
          icon:
              'https://lh3.googleusercontent.com/u/0/drive-viewer/AFDK6gP3FNEz9-xW8xi_kZbWIUttbFoQqfnPk3eO74LqnnSWiauhn13FG4lZisLh09HKgAG6GsvqimyRU2eVapzdthT0PJHlEQ=w1920-h892',
          eventType: 'abc',
          category: 'xyz',
          needRegistration: true,
          round: '1',
          day: 0,
          datetime: "2012-02-27 13:27:00",
        ),
        ScheduleModel(
          id: 16,
          name: "Tiki Taka",
          icon:
              'https://lh3.googleusercontent.com/u/0/drive-viewer/AFDK6gP3FNEz9-xW8xi_kZbWIUttbFoQqfnPk3eO74LqnnSWiauhn13FG4lZisLh09HKgAG6GsvqimyRU2eVapzdthT0PJHlEQ=w1920-h892',
          eventType: 'abc',
          category: 'xyz',
          needRegistration: true,
          round: '1',
          day: 0,
          datetime: "2012-02-27 13:27:00",
        ),
      ],
      "day1": [
        ScheduleModel(
          id: 13,
          name: "Wave Cloning",
          icon:
              'https://lh3.googleusercontent.com/u/0/drive-viewer/AFDK6gP3FNEz9-xW8xi_kZbWIUttbFoQqfnPk3eO74LqnnSWiauhn13FG4lZisLh09HKgAG6GsvqimyRU2eVapzdthT0PJHlEQ=w1920-h892',
          eventType: 'abc',
          category: 'xyz',
          needRegistration: true,
          round: '1',
          day: 1,
          datetime: "2022-11-03 09:00:00",
        ),
        ScheduleModel(
          id: 1,
          name: "Debugger",
          icon:
              'https://lh3.googleusercontent.com/u/0/drive-viewer/AFDK6gMTTKh8WvY3BqpviD547K9G7LfLVczO8E5fPzNl1xgWBE8ItZPcRvHagX0w82u13uiD-eeYu-l5YExvr-AjoYhvubqEvw=w1920-h892',
          eventType: 'abc',
          category: 'xyz',
          needRegistration: true,
          round: '1',
          day: 1,
          datetime: "2022-11-03 09:00:00",
        ),
        ScheduleModel(
          id: 7,
          name: "Spider Web",
          icon:
              'https://drive.google.com/file/d/1jVMZRRZjzmsn3FkCDugWo2n2WXH2mSKq/view',
          eventType: 'abc',
          category: 'xyz',
          needRegistration: true,
          round: '1',
          day: 1,
          datetime: "2022-11-03 10:00:00",
        ),
        ScheduleModel(
          id: 5,
          name: ".Issue",
          icon:
              'https://lh3.googleusercontent.com/u/0/drive-viewer/AFDK6gP3FNEz9-xW8xi_kZbWIUttbFoQqfnPk3eO74LqnnSWiauhn13FG4lZisLh09HKgAG6GsvqimyRU2eVapzdthT0PJHlEQ=w1920-h892',
          eventType: 'abc',
          category: 'xyz',
          needRegistration: true,
          round: '1',
          day: 1,
          datetime: "2022-11-03 13:00:00",
        ),
        ScheduleModel(
          id: 4,
          name: "Cyber Security Workshop",
          icon:
              'https://lh3.googleusercontent.com/u/0/drive-viewer/AFDK6gP3FNEz9-xW8xi_kZbWIUttbFoQqfnPk3eO74LqnnSWiauhn13FG4lZisLh09HKgAG6GsvqimyRU2eVapzdthT0PJHlEQ=w1920-h892',
          eventType: 'abc',
          category: 'xyz',
          needRegistration: true,
          round: '1',
          day: 1,
          datetime: "2022-11-03 13:00:00",
        ),
      ],
      "day2": [
        ScheduleModel(
          id: 10,
          name: "ROBOWAR",
          icon:
              'https://lh3.googleusercontent.com/u/0/drive-viewer/AFDK6gP3FNEz9-xW8xi_kZbWIUttbFoQqfnPk3eO74LqnnSWiauhn13FG4lZisLh09HKgAG6GsvqimyRU2eVapzdthT0PJHlEQ=w1920-h892',
          eventType: 'abc',
          category: 'xyz',
          needRegistration: true,
          round: '1',
          day: 2,
          datetime: "2019-07-19 08:40:23",
        ),
      ],
      "day3": [
        ScheduleModel(
          id: 15,
          name: "REVERSO",
          icon:
              'https://lh3.googleusercontent.com/u/0/drive-viewer/AFDK6gP3FNEz9-xW8xi_kZbWIUttbFoQqfnPk3eO74LqnnSWiauhn13FG4lZisLh09HKgAG6GsvqimyRU2eVapzdthT0PJHlEQ=w1920-h892',
          eventType: 'abc',
          category: 'xyz',
          needRegistration: true,
          round: '1',
          day: 3,
          datetime: "2019-07-19 08:40:23",
        ),
      ]
    });
  }
}
