import 'package:flutter/material.dart';

import '../Models/schedule_model.dart';

class ScheduleProvider with ChangeNotifier{

  Map<String, List<ScheduleModel>> _dataList;

  Map<String, List<ScheduleModel>> get dataList => _dataList;

  ScheduleProvider(Map<String, List<ScheduleModel>> data){
    _dataList=data;
  }

  setData(Map<String, List<ScheduleModel>> data){
    _dataList = data;
    notifyListeners();
  }

}