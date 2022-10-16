import 'package:excelapp/UI/constants.dart';
import 'package:excelapp/Models/schedule_model.dart';
import 'package:flutter/material.dart';
import 'package:excelapp/UI/Screens/Schedule/Widgets/generateScheduleCardList.dart';

class SchedulePage extends StatelessWidget {
  final scheduleData;
  SchedulePage({@required this.scheduleData});
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: new Scaffold(
        body: new NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              new SliverAppBar(
                title: Center(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 25, 0, 25),
                    child: Text(
                      "Event Schedule",
                      style: TextStyle(color: Color(0xff1C1F20), fontWeight: FontWeight.w800, fontSize: 20),
                    ),
                  ),
                ),
                backgroundColor: Color(0xffFBFFFF),
                floating: true,
                pinned: true,
                snap: true,
                bottom: new TabBar(
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicatorWeight: 3,
                  indicatorColor: Color(0xff0E99E8),
                  labelColor: Color(0xff0E99E8),
                  unselectedLabelColor: Color(0xff778585),
                  tabs: [
                    Tab(
                      child: Column(
                        children: [
                          SizedBox(height: 5,),
                          Text('Oct-Nov', style: TextStyle(fontSize: 9, fontWeight: FontWeight.w400),),
                          SizedBox(width: 70, child: Text('Pre-Events', style: TextStyle(fontSize: 12.5, fontWeight: FontWeight.w800),))
                        ],
                      ),
                    ),
                    dayTab('Nov 3', 'Day 1'),
                    dayTab('Nov 4', 'Day 2'),
                    dayTab('Nov 5', 'Day 3'),
                  ],
                ),
              ),
            ];
          },
          body: Container(
            color: Color(0xffECF4F5),
            child: new TabBarView(
              children: [
                schedule(0),
                schedule(1),
                schedule(2),
                schedule(3),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget dayTab(date, day) {
    return Tab(
      child: Column(
        children: [
          SizedBox(height: 5,),
          Text(date, style: TextStyle(fontSize: 9, fontWeight: FontWeight.w400),),
          Text(day, style: TextStyle(fontSize: 12.5, fontWeight: FontWeight.w800),)
        ],
      ),
    );
  }

  Widget schedule(dayNumber) {
    List<ScheduleModel> day0 = scheduleData["day0"];
    day0.sort((a, b) => DateTime.parse(a.datetime).compareTo(DateTime.parse(b.datetime)));
    List<ScheduleModel> day1 = scheduleData["day1"];
    day1.sort((a, b) => DateTime.parse(a.datetime).compareTo(DateTime.parse(b.datetime)));
    List<ScheduleModel> day2 = scheduleData["day2"];
    day2.sort((a, b) => DateTime.parse(a.datetime).compareTo(DateTime.parse(b.datetime)));
    List<ScheduleModel> day3 = scheduleData["day3"];
    day3.sort((a, b) => DateTime.parse(a.datetime).compareTo(DateTime.parse(b.datetime)));
    Widget returnWidget;
    if (dayNumber == 0)
      returnWidget = TimeTableList(day0);
    else if (dayNumber == 1)
      returnWidget = TimeTableList(day1);
    else if (dayNumber == 2)
      returnWidget = TimeTableList(day2);
    else if (dayNumber == 3) returnWidget = TimeTableList(day3);
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: returnWidget,
    );
  }
}
