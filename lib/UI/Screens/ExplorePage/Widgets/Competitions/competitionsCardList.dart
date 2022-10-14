import 'package:excelapp/UI/Screens/ExplorePage/Widgets/Competitions/allCompetitions.dart';
import 'package:flutter/material.dart';

class CompetitionsCardList extends StatefulWidget {
  const CompetitionsCardList({Key key}) : super(key: key);

  @override
  State<CompetitionsCardList> createState() => _CompetitionsCardListState();
}

class _CompetitionsCardListState extends State<CompetitionsCardList>
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
              "CS-Tech",
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
              "Gen-Tech",
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
              "Non-Tech",
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
          SizedBox(height: 10),
          Flexible(
            child: TabBarView(controller: _tabController, children: [
              AllCompetitions(category: "all"),
              AllCompetitions(category: "cs"),
              AllCompetitions(category: "gen"),
              AllCompetitions(category: "non"),
            ]),
          ),
        ],
      ),
    );
  }
}
