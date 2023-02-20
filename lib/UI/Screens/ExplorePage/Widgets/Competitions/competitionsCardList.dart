import 'package:excelapp/UI/Screens/ExplorePage/Widgets/Competitions/allCompetitions.dart';
import 'package:excelapp/UI/Screens/ExplorePage/Widgets/Components/tabs.dart';
import 'package:flutter/material.dart';

class CompetitionsCardList extends StatefulWidget {
  final String txtQuery;
  const CompetitionsCardList({Key key, this.txtQuery}) : super(key: key);

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
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Container(
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
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
                    .toList(),
              ),
            ),
            SizedBox(height: 20),
            AllCompetitions(
              category: selectedCategory,
              txtQuery: widget.txtQuery,
            ),
          ],
        ),
      ),
    );
  }
}
