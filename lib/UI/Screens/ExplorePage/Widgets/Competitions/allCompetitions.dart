import 'dart:async';

import 'package:excelapp/Models/event_card.dart';
import 'package:excelapp/Providers/eventsAndCompetitonsProvider.dart';
import 'package:excelapp/UI/Screens/ExplorePage/Widgets/cardBody.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AllCompetitions extends StatefulWidget {
  @override
  State<AllCompetitions> createState() => _AllCompetitionsState();
  final String category;
  final String txtQuery;
  const AllCompetitions({Key key, this.category, this.txtQuery})
      : super(key: key);
}

class _AllCompetitionsState extends State<AllCompetitions> {
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

  filterbyTxtQuery() {
    if (widget.txtQuery != null) {
      competitions = competitions
          .where((i) => i.name.toLowerCase().contains(widget.txtQuery))
          .toList();
    }
  }

  @override
  void initState() {
    final _myProvider =
        Provider.of<EventsAndCompetitionsProvider>(context, listen: false);
    CompetitionsData = _myProvider.dataList.where((element) => element.isCompetition).toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    filerbyCategory();
    filterbyTxtQuery();

    return (Container(
      child: Column(
        children: [CardBody(eventsMap: competitions)],
      ),
    ));
  }
}
