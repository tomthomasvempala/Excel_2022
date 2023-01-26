import 'package:flutter/material.dart';

import '../Models/event_card.dart';

class EventsAndCompetitionsProvider with ChangeNotifier{

  List<Event> _dataList;

  get dataList => _dataList;

  EventsAndCompetitionsProvider(List<Event> data){
    _dataList=data;
  }

  setData(List<Event> data){
    _dataList = data;
    notifyListeners();
  }
}