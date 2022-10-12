import 'package:excelapp/UI/Screens/ExplorePage/Widgets/competitionsCardList.dart';
import 'package:excelapp/UI/Screens/ExplorePage/Widgets/eventsCardList.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({Key key}) : super(key: key);

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage>
    with SingleTickerProviderStateMixin {
  TabController _tabcontroller;

  @override
  void initState() {
    super.initState();
    _tabcontroller = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(237, 245, 246, 1),
      body: Container(
        margin: EdgeInsets.fromLTRB(0, 50, 0, 0),
        child: Padding(
          padding: EdgeInsets.fromLTRB(30, 7, 30, 7),
          child: Column(
            children: [
              TextField(
                style: TextStyle(
                  fontFamily: "mulish",
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color.fromARGB(70, 208, 224, 231),
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50.0))),
                  isDense: true,
                  contentPadding: EdgeInsets.all(15),
                  hintText: 'Search for Events',
                ),
              ),
              SizedBox(height: 6),
              TabBar(
                indicatorColor: Color.fromARGB(255, 14, 152, 232),
                controller: _tabcontroller,
                labelColor: Color.fromARGB(255, 14, 152, 232),
                labelStyle: TextStyle(
                  decorationColor: Color.fromARGB(255, 14, 152, 232),
                ),
                unselectedLabelColor: Color.fromARGB(235, 119, 133, 133),
                tabs: const [
                  Tab(
                    child: Text(
                      "Competitions",
                      style: TextStyle(
                        fontFamily: "mulish",
                        fontSize: 14,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Events",
                      style: TextStyle(
                        fontFamily: "mulish",
                        fontSize: 14,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(
                    controller: _tabcontroller,
                    children: const [CompetitionsCardList(), EventsCardList()]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
