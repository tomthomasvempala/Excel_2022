import 'package:excelapp/UI/Screens/ExplorePage/Widgets/Events/allEvents.dart';
import 'package:excelapp/UI/Screens/ExplorePage/Widgets/Events/generalEvents.dart';
import 'package:excelapp/UI/Screens/ExplorePage/Widgets/Events/talksEvents.dart';
import 'package:excelapp/UI/Screens/ExplorePage/Widgets/Events/workshopEvents.dart';
import 'package:flutter/material.dart';

class EventsCardList extends StatefulWidget {
  const EventsCardList({Key key}) : super(key: key);

  @override
  State<EventsCardList> createState() => _EventsCardListState();
}

class _EventsCardListState extends State<EventsCardList>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  List<Widget> tabs = [
    Tab(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
        ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
          child: Align(
            alignment: Alignment.center,
            child: Text(
              "All",
              style: TextStyle(
                  fontFamily: "mulish",
                  fontSize: 11,
                  fontWeight: FontWeight.w700),
            ),
          ),
        ),
      ),
    ),
    Tab(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
        ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
          child: Align(
            alignment: Alignment.center,
            child: Text(
              "Workshops",
              style: TextStyle(
                  fontFamily: "mulish",
                  fontSize: 11,
                  fontWeight: FontWeight.w700),
            ),
          ),
        ),
      ),
    ),
    Tab(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
        ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
          child: Align(
            alignment: Alignment.center,
            child: Text(
              "Talks",
              style: TextStyle(
                  fontFamily: "mulish",
                  fontSize: 11,
                  fontWeight: FontWeight.w700),
            ),
          ),
        ),
      ),
    ),
    Tab(
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
        child: Padding(
          padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
          child: Align(
            alignment: Alignment.center,
            child: Text(
              "General",
              style: TextStyle(
                fontFamily: "mulish",
                fontSize: 11,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ),
    ),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: tabs.length,
      initialIndex: 0,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      child: Column(
        children: [
          SizedBox(height: 7),
          TabBar(
            tabs: tabs,
            controller: _tabController,
            isScrollable: true,
            unselectedLabelColor: Color.fromARGB(255, 61, 71, 71),
            indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Color.fromARGB(255, 14, 152, 232)),
          ),
          SizedBox(height: 7),
          Expanded(
            child: TabBarView(controller: _tabController, children: [
              AllEvents(),
              WorkshopEvents(),
              TalksEvents(),
              GeneralEvents(),
            ]),
          ),
        ],
      ),
    );
  }
}
