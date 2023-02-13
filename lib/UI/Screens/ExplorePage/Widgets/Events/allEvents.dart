import 'package:excelapp/Models/event_card.dart';
import 'package:excelapp/UI/Screens/ExplorePage/Widgets/cardBody.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../Providers/eventsAndCompetitonsProvider.dart';

class AllEvents extends StatefulWidget {
  @override
  State<AllEvents> createState() => _AllEventsState();
  final String category;
  final String txtQuery;
  const AllEvents({Key key, this.category, this.txtQuery}) : super(key: key);
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
      events = EventsData.where((i) => i.eventType == "talk").toList();
    }
    if (widget.category == 'general') {
      events = EventsData.where((i) => i.eventType == "general").toList();
    }
  }

  filterbyTxtQuery() {
    if (widget.txtQuery != null) {
      events = events
          .where((i) => i.name.toLowerCase().contains(widget.txtQuery))
          .toList();
    }
  }

  @override
  void initState() {
       final _myProvider =
        Provider.of<EventsAndCompetitionsProvider>(context, listen: false);
    EventsData = _myProvider.dataList.where((element) => element.eventType!="competition").toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    filerbyCategory();
    filterbyTxtQuery();
    return (Container(
      child: Column(
        children: [CardBody(eventsMap: events)
        ],
      ),
    ));
  }
}
