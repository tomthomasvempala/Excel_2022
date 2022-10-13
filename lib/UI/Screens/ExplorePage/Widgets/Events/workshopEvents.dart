import 'dart:async';

import 'package:excelapp/Models/event_card.dart';
import 'package:excelapp/UI/Components/EventCard/event_card.dart';
import 'package:excelapp/UI/Screens/ExplorePage/Widgets/data.dart';
import 'package:excelapp/UI/constants.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:excelapp/UI/Screens/ExplorePage/Widgets/eventCardBody.dart';

class WorkshopEvents extends StatefulWidget {
  @override
  State<WorkshopEvents> createState() => _WorkshopEventsState();
}

class _WorkshopEventsState extends State<WorkshopEvents> {
  StreamController<dynamic> estream;
  bool dataLoaded = false;
  List<Event> events =
      CompetitionsData.where((i) => i.category == "Workshops").toList();
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
                  return EventCardBody(eventsMap: snapshot.data);
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
