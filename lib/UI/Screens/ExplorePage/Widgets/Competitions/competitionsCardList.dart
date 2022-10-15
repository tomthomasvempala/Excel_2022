import 'package:excelapp/UI/Screens/ExplorePage/Widgets/Competitions/allCompetitions.dart';
import 'package:excelapp/UI/Screens/ExplorePage/Widgets/Components/tabs.dart';
import 'package:flutter/material.dart';

class CompetitionsCardList extends StatefulWidget {
  const CompetitionsCardList({Key key}) : super(key: key);

  @override
  State<CompetitionsCardList> createState() => _CompetitionsCardListState();
}

class _CompetitionsCardListState extends State<CompetitionsCardList>
    with SingleTickerProviderStateMixin {
  String selectedCategory;
  List<String> tabs = ["All", "CS-Tech", "Gen-Tech", "Non-Tech"];

  @override
  void initState() {
    super.initState();
    selectedCategory = "all";
  }

  @override
  Widget build(BuildContext context) {
    print(selectedCategory);
    return Container(
      alignment: Alignment.topCenter,
      child: Column(
        children: [
          SizedBox(height: 7),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: tabs
                    .map((tabItem) => FilterTab(
                          isSelected: selectedCategory == tabItem.toLowerCase(),
                          text: tabItem,
                          onPressed: () {
                            setState(() {
                              selectedCategory = tabItem.toLowerCase();
                            });
                          },
                        ))
                    .toList()),
          ),
          SizedBox(height: 10),
          Flexible(
            child: AllCompetitions(category: selectedCategory),
          )
        ],
      ),
    );
  }
}
