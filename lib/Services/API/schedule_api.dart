import 'dart:convert';
import 'package:excelapp/Models/schedule_model.dart';
import 'package:http/http.dart' as http;
import 'package:excelapp/Services/API/api_config.dart';
import 'package:excelapp/Services/Database/hive_operations.dart';

fetchScheduleFromStorage() async {
  print("-    Schedule: Storage Fetch    -");
  var scheduleData = await HiveDB.retrieveData(valueName: "schedule");
  if (scheduleData == null) return;
  return scheduleJSONtoModel(scheduleData);
}

fetchAndStoreScheduleFromNet() async {
  print("-    Schedule: Network Fetch    -");
  try {
    var response = await http.get(Uri.parse(APIConfig.baseUrl + "schedule"));
    await HiveDB.storeData(valueName: "schedule", value: response.body);
    return scheduleJSONtoModel(response.body);
  } catch (err) {
    print(err);
    return 'error';
  }
}

scheduleJSONtoModel(data) {
  dynamic responseData = json.decode(data);
  Map<String, List<ScheduleModel>> scheduleData = {"day0": [],"day1": [], "day2": [], "day3": []};
  for (var i in responseData) {
    if (i["day"] == 0)
      scheduleData["day0"] = i["events"].map<ScheduleModel>((event) => ScheduleModel.fromJson(event)).toList();
    else if (i["day"] == 1)
      scheduleData["day1"] = i["events"].map<ScheduleModel>((event) => ScheduleModel.fromJson(event)).toList();
    else if (i["day"] == 2)
      scheduleData["day2"] = i["events"].map<ScheduleModel>((event) => ScheduleModel.fromJson(event)).toList();
    else if (i["day"] == 3) 
      scheduleData["day3"] = i["events"].map<ScheduleModel>((event) => ScheduleModel.fromJson(event)).toList();
  }
  return scheduleData;
}
