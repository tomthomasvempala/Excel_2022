import 'package:flutter/material.dart';

import '../Models/event_card.dart';

class EventsAndCompetitionsProvider with ChangeNotifier{

  List<Event> _dataList;

  get dataList => _dataList;

  setData(List<Event> data){
    _dataList = data;
    notifyListeners();
  }
}