import 'package:excelapp/Models/highlights_model.dart';
import 'package:excelapp/UI/Screens/HomePage/Widgets/Highlights/highlight_card.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HighlightsBody extends StatelessWidget {
  final List<Highlights> highLightsMap;
  HighlightsBody({Key key, @required this.highLightsMap}) : super(key: key);

  final int autoplayseconds = 5;

  @override
  Widget build(BuildContext context) {
    if (highLightsMap.length == 0)
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 45),
        child: Center(
            child: Text(
          "No Highlights",
          style: TextStyle(color: Colors.black54),
        )),
      );
    List<Highlights> uniqueHighlightsList = [];

// A Map to track the unique names and the first item for each name
    Map<String, Highlights> uniqueNamesMap = {};
    Map<String, Map<String,dynamic>> fullPage ={};

    for (Highlights highlight in highLightsMap) {
      if (!uniqueNamesMap.containsKey(highlight.name)) {
        // Add the first item with this name to the unique list and to the Map
        uniqueHighlightsList.add(highlight);
        fullPage[highlight.name]={
          'name': highlight.name,
          'thumbnail':
              highlight.image,
          'images': [highlight.image]
        };
        uniqueNamesMap[highlight.name] = highlight;
      } else {
        fullPage[highlight.name]['images'].add(highlight.image);
      }
    }
    List<Map<String,dynamic>> stories = fullPage.values.toList();
    return CarouselSlider.builder(
      itemCount: uniqueHighlightsList.length,
      options: CarouselOptions(
        viewportFraction: .7,
        initialPage: 2,
        height: MediaQuery.of(context).size.width * .9 * (3 / 5.7),
        autoPlay: true,
        autoPlayInterval: Duration(seconds: autoplayseconds),
      ),
      itemBuilder: (BuildContext build, index, pageViewIndex) {
        return GestureDetector(
          child: HighlightsCard(uniqueHighlightsList[index], index,stories),
        );
      },
    );
  }
}
