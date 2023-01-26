import 'package:excelapp/Models/event_card.dart';
import 'package:excelapp/UI/Screens/ExplorePage/Widgets/cardBody.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../Providers/eventsAndCompetitonsProvider.dart';

class AllEvents extends StatefulWidget {
  @override
  State<AllEvents> createState() => _AllEventsState();
  final String category;
  const AllEvents({Key key, this.category}) : super(key: key);
}

class _AllEventsState extends State<AllEvents> {
  bool dataLoaded = false;
  List<Event> events;
  List<Event> EventsData;
  filerbyCategory() {
    if (widget.category == 'all') {
      events = EventsData.where((i) => i.isCompetition == false).toList();
    }
    if (widget.category == 'workshops') {
      events =
          EventsData.where((i) => i.eventType == "workshop").toList();
    }
    if (widget.category == 'talks') {
      events = EventsData.where((i) => i.category == "talks").toList();
    }
    if (widget.category == 'general') {
      events = EventsData.where((i) => i.category == "general").toList();
    }
  }

  fetchfromNet() async {
    // var dataFromNet = await fetchAndStoreEventsFromNet();
    // if (!dataLoaded || dataFromNet != "error") {
    //estream.add(dataFromNet);
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
       final _myProvider =
        Provider.of<EventsAndCompetitionsProvider>(context, listen: false);
    EventsData = _myProvider.dataList.where((element) => !element.isCompetition).toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    filerbyCategory();
    return (Container(
      child: Column(
        children: [CardBody(eventsMap: events)
        ],
      ),
    ));
  }
}
