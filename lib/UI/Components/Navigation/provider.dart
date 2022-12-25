import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class MyNavigationIndex with ChangeNotifier{
  int _index =0;
  int _explorePageNumber=0;
  String _exploreCategory = 'talks';
  int get getIndex=> _index;
  int get getExplorePageNumber => _explorePageNumber;
  String get getExplorerCategory => _exploreCategory;
  set setIndex(int ind){
    _index= ind;
    notifyListeners();
  }

  void setIndextoExplore(int pageNumber,String category){
    _exploreCategory = category;
    _explorePageNumber = pageNumber;
    _index = 1;
    notifyListeners();
  }
}

