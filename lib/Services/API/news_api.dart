import 'dart:convert';
import 'package:excelapp/Models/latest_news.dart';
import 'package:excelapp/Services/API/api_config.dart';
import 'package:excelapp/Services/Database/hive_operations.dart';
import 'package:http/http.dart' as http;

fetchNewsFromStorage() async {
  print("-    News: Storage Fetch    -");
  var newsData = await HiveDB.retrieveData(valueName: "news");
  if (newsData == null) return;
  return newsData.map<News>((news) => News.fromJson(news)).toList();
}

fetchAndStoreNewsFromNet() async {
  print("-    News: Network Fetch    -");
  try {
    var response = await http.get(Uri.parse(APIConfig.newsbaseUrl));
    List responseData = json.decode(response.body); //
    // List responseData = [{"id":100,"name":"Event Name","image":"url"}];
    await HiveDB.storeData(valueName: "news", value: responseData);
    return responseData.map<News>((news) => News.fromJson(news)).toList();
  } catch (_) {
    return ("error");
  }
}
