import 'dart:async';

import 'package:excelapp/Providers/navigationProvider.dart';
import 'package:excelapp/UI/Components/LoadingUI/loadingAnimation.dart';
import 'package:excelapp/UI/Screens/ExplorePage/Widgets/Competitions/competitionsCardList.dart';
import 'package:excelapp/UI/Screens/ExplorePage/Widgets/Events/eventsCardList.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../Models/event_card.dart';
import '../../../Providers/eventsAndCompetitonsProvider.dart';
import '../../../Services/API/events_api.dart';
import '../../Themes/colors.dart';
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
  bool isInit;
  @override
  void initState() {
    isInit = true;
    estream = StreamController<dynamic>();
    super.initState();
    print("Explore object is created with ${widget.selectedCategory}");
    fetchfromStorage();
    fetchfromNet();
    _tabcontroller = TabController(
        length: 2, vsync: this, initialIndex: widget.selectedPage ?? 0);
  }

  void didChangeDependencies() {
    if (isInit) {
      isInit = false;
      print("setting tab");
      _tabcontroller.addListener(() {
        final provider = Provider.of<MyNavigationIndex>(context, listen: false);
        provider.justsetIndextoExplore(
            _tabcontroller.index, provider.getExplorerCategory);
      });
    }
    super.didChangeDependencies();
  }

  fetchfromNet() async {
    var dataFromNet =
        await EventsAPI.fetchAndStoreEventsandCompetitionsFromNet();
    if (!dataLoaded || dataFromNet != "error") {
      estream.add(dataFromNet ?? "error");
    }
    // estream.add(competitions);
    dataLoaded = true;
  }

  fetchfromStorage() async {
    var dataFromStorage =
        await EventsAPI.fetchAndStoreEventsandCompetitionsFromStorage();
    if (!dataLoaded || dataFromStorage != "error") {
      estream.add(dataFromStorage ?? "error");
    }
    // estream.add(competitions);
    dataLoaded = true;
  }

  var _searchQuery = "";
  @override
  Widget build(BuildContext context) {
    final _myNavIndex = Provider.of<MyNavigationIndex>(context);
    _tabcontroller.index = _myNavIndex.getExplorePageNumber;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: white200,
      body: Container(
        child: Column(
          children: [
            Container(
              color: white100,
              padding: const EdgeInsets.only(top: 16),
              child: ClipRRect(
                child: Column(
                  children: [
                    SafeArea(
                      bottom: false,
                      child: Container(),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(30, 12, 30, 7),
                      child: TextField(
                        controller: txtQuery,
                        onChanged: (value) {
                          setState(() {
                            _searchQuery = txtQuery.text;
                          });
                        },
                        style: TextStyle(
                          fontFamily: "mulish",
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color.fromARGB(70, 208, 224, 231),
                          prefixIcon: Icon(Icons.search),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: white300),
                            borderRadius:
                                BorderRadius.all(Radius.circular(50.0)),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: white300),
                            borderRadius:
                                BorderRadius.all(Radius.circular(50.0)),
                          ),
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
                        color: white200,
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        padding:
                            EdgeInsets.symmetric(vertical: 40, horizontal: 20),
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
                    if (snapshot.hasData) {
                      return ChangeNotifierProvider(
                          create: (context) =>
                              EventsAndCompetitionsProvider(snapshot.data),
                          child: TabBarView(
                              controller: _tabcontroller,
                              physics: BouncingScrollPhysics(),
                              children: [
                                CompetitionsCardList(txtQuery: _searchQuery),
                                EventsCardList(
                                    txtQuery: _searchQuery,
                                    selectedTab:
                                        _myNavIndex.getExplorerCategory)
                              ]));
                    } else {
                      return Container(
                        child: Center(
                          child: LoadingAnimation(),
                        ),
                      );
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
