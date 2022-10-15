import 'dart:async';
import 'package:excelapp/Models/event_card.dart';
import 'package:excelapp/UI/Screens/ExplorePage/Widgets/cardBody.dart';
import 'package:excelapp/UI/Screens/ExplorePage/Widgets/data.dart';
import 'package:excelapp/UI/constants.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class AllEvents extends StatefulWidget {
  @override
  State<AllEvents> createState() => _AllEventsState();
  final String category;
  const AllEvents({Key key, this.category}) : super(key: key);
}

class _AllEventsState extends State<AllEvents> {
  StreamController<dynamic> estream;
  List<Event> events;
  filerbyCategory() {
    if (widget.category == 'all') {
      events = CompetitionsData.where((i) => i.isCompetition == false).toList();
    }
    if (widget.category == 'workshops') {
      events =
          CompetitionsData.where((i) => i.category == "Workshops").toList();
    }
    if (widget.category == 'talks') {
      events = CompetitionsData.where((i) => i.category == "Talks").toList();
    }
    if (widget.category == 'general') {
      events = CompetitionsData.where((i) => i.category == "General").toList();
    }
    estream.add(events);
  }

  bool dataLoaded = false;
  fetchfromNet() async {
    // var dataFromNet = await fetchAndStoreEventsFromNet();
    // if (!dataLoaded || dataFromNet != "error") {
    //estream.add(dataFromNet);
    estream.add(events);
    dataLoaded = true;
  }

  // }

  // initialisePage() async {
  //   var datafromStorage = await fetchHighlightsFromStorage();
  //   if (datafromStorage != null) {
  //     estream.add(datafromStorage);
  //     dataLoaded = true;
  //   }
  //   await fetchfromNet();
  // }

  @override
  void initState() {
    estream = StreamController<dynamic>();
    // initialisePage();
    fetchfromNet();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    filerbyCategory();
    return (Container(
      child: Column(
        children: [
          StreamBuilder(
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
                print(snapshot.data);
                if (snapshot.hasData)
                  return CardBody(eventsMap: snapshot.data);
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
              }),
        ],
      ),
    ));
  }
}
