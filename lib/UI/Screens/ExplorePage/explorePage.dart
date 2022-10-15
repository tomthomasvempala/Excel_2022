import 'package:excelapp/UI/Screens/ExplorePage/Widgets/Competitions/competitionsCardList.dart';
import 'package:excelapp/UI/Screens/ExplorePage/Widgets/Events/eventsCardList.dart';
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
  TextEditingController txtQuery = new TextEditingController();
  @override
  void initState() {
    super.initState();
    _tabcontroller = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(237, 245, 246, 1),
      body: Padding(
        padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
        child: Container(
          child: Column(
            children: [
              Container(
                color: Colors.white,
                child: ClipRRect(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(30, 7, 30, 7),
                        child: TextField(
                          controller: txtQuery,
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
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50.0))),
                            isDense: true,
                            contentPadding: EdgeInsets.all(15),
                            hintText: 'Search for Events',
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(30, 3, 30, 3),
                        child: TabBar(
                          indicatorColor: Color.fromARGB(255, 14, 152, 232),
                          controller: _tabcontroller,
                          indicatorPadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          labelColor: Color.fromARGB(255, 14, 152, 232),
                          labelStyle: TextStyle(
                            decorationColor: Color.fromARGB(255, 14, 152, 232),
                          ),
                          unselectedLabelColor:
                              Color.fromARGB(235, 119, 133, 133),
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
                      ),
                    ],
                  ),
                ),
              ),
              Flexible(
                child: TabBarView(
                    controller: _tabcontroller,
                    physics: BouncingScrollPhysics(),
                    children: const [CompetitionsCardList(), EventsCardList()]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
