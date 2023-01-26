import 'dart:async';

import 'package:excelapp/UI/Components/Navigation/provider.dart';
import 'package:excelapp/UI/Screens/ExplorePage/Widgets/Competitions/competitionsCardList.dart';
import 'package:excelapp/UI/Screens/ExplorePage/Widgets/Events/eventsCardList.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import '../../../Models/event_card.dart';
import '../../../Services/API/events_api.dart';
import '../../constants.dart';

class ExplorePage extends StatefulWidget {
  @override
  State<ExplorePage> createState() => _ExplorePageState();
  final int selectedPage;
  final String selectedCategory;
  const ExplorePage({Key key, this.selectedPage, this.selectedCategory})
      : super(key: key);
}

class _ExplorePageState extends State<ExplorePage>
    with SingleTickerProviderStateMixin {
  TabController _tabcontroller;
  TextEditingController txtQuery = new TextEditingController();
  StreamController<dynamic> estream;
  bool dataLoaded = false;
  List<Event> competitionsAndEvents;
  @override
  void initState() {
    estream = StreamController<dynamic>();
    super.initState();
    print("Explore object is created with ${widget.selectedCategory}");
    fetchfromNet();
    _tabcontroller = TabController(
        length: 2, vsync: this, initialIndex: widget.selectedPage ?? 0);
  }

  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  fetchfromNet() async {
    var dataFromNet = await EventsAPI.fetchAndStoreEventsandCompetitionsFromNet();
    if (!dataLoaded || dataFromNet != "error") {
    print('Events And Competitions:');
    print(dataFromNet);
    estream.add(dataFromNet);}
    // estream.add(competitions);
    dataLoaded = true;
  }

  @override
  Widget build(BuildContext context) {
    final _myNavIndex = Provider.of<MyNavigationIndex>(context);
    _tabcontroller.index = _myNavIndex.getExplorePageNumber;
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
                child: StreamBuilder<dynamic>(
                  stream: estream.stream,
                  builder: (context, snapshot) {
                    if (snapshot.data == "error")
                  return Container(
                    color: Color(0xffeeeeee),
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                    child: Center(
                      child: Column(
                        children: <Widget>[
                          Text("Failed to fetch Event"),
                          SizedBox(height: 20),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: primaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                              ),
                            ),
                            onPressed: () {
                              fetchfromNet();
                            },
                            child: Text(
                              "Retry",
                              style: TextStyle(color: Colors.white),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                  if (snapshot.hasData)
                  return TabBarView(
                        controller: _tabcontroller,
                        physics: BouncingScrollPhysics(),
                        children: [
                          CompetitionsCardList(),
                          EventsCardList(
                              selectedTab: _myNavIndex.getExplorerCategory)
                        ]);
                else {
                  return Container(
                    child: Shimmer.fromColors(
                      child: Container(
                        color: Colors.white,
                        height: MediaQuery.of(context).size.height / 4,
                        margin: EdgeInsets.symmetric(horizontal: 15),
                      ),
                      baseColor: Colors.grey[300],
                      highlightColor: Colors.grey[100],
                    ),
                  );
                }
                    
                  }
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}