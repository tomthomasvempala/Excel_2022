import 'dart:async';

import 'package:excelapp/Models/event_card.dart';
import 'package:excelapp/Providers/eventsAndCompetitonsProvider.dart';
import 'package:excelapp/UI/Components/EventCard/event_card.dart';
import 'package:excelapp/UI/Screens/ExplorePage/Widgets/cardBody.dart';
// import 'package:excelapp/UI/Screens/ExplorePage/Widgets/data.dart';
import 'package:excelapp/UI/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class AllCompetitions extends StatefulWidget {
  @override
  State<AllCompetitions> createState() => _AllCompetitionsState();
  final String category;
  const AllCompetitions({Key key, this.category}) : super(key: key);
}

class _AllCompetitionsState extends State<AllCompetitions> {
  StreamController<dynamic> estream;
  bool dataLoaded = false;
  List<Event> competitions;
  List<Event> CompetitionsData;
  filerbyCategory() {
    if (widget.category == 'all') {
      competitions =
          CompetitionsData.where((i) => i.isCompetition == true).toList();
    }
    if (widget.category == 'cs-tech') {
      competitions =
          CompetitionsData.where((i) => i.category == "cs_tech").toList();
    }
    if (widget.category == 'gen-tech') {
      competitions =
          CompetitionsData.where((i) => i.category == "general_tech").toList();
    }
    if (widget.category == 'non-tech') {
      competitions =
          CompetitionsData.where((i) => i.category == "non_tech").toList();
    }
  }

  // fetchfromNet() async {
  //   // var dataFromNet = await fetchAndStoreEventsFromNet();
  //   // if (!dataLoaded || dataFromNet != "error") {
  //   //estream.add(dataFromNet);

  //   dataLoaded = true;
  // }
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
    final _myProvider =
        Provider.of<EventsAndCompetitionsProvider>(context, listen: false);
    CompetitionsData = _myProvider.dataList.where((element) => element.isCompetition).toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    filerbyCategory();

    return (Container(
      child: Column(
        children: [CardBody(eventsMap: competitions)],
      ),
    ));
  }
}
