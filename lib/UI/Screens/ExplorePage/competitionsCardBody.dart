import 'package:excelapp/Models/event_card.dart';
import 'package:excelapp/UI/Components/EventCard/event_card.dart';
import 'package:excelapp/UI/Screens/ExplorePage/Widgets/data.dart';
import 'package:flutter/material.dart';

class CompetitionsCardBody extends StatelessWidget {
  final List<Event> eventsMap;
  CompetitionsCardBody({Key key, @required this.eventsMap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (eventsMap.length == 0)
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 45),
        child: Center(
            child: Text(
          "No Events",
          style: TextStyle(color: Colors.black54),
        )),
      );
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: eventsMap.length,
        itemBuilder: (context, index) {
          return EventCard(eventsMap[index]);
        },
      ),
    );
  }
}
