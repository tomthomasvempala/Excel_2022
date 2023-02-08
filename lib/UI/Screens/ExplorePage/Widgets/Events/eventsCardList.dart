import 'package:excelapp/Providers/navigationProvider.dart';
import 'package:excelapp/UI/Screens/ExplorePage/Widgets/Components/tabs.dart';
import 'package:excelapp/UI/Screens/ExplorePage/Widgets/Events/allEvents.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EventsCardList extends StatefulWidget {
  @override
  State<EventsCardList> createState() => _EventsCardListState();
  final String selectedTab;
  final String txtQuery;
  const EventsCardList({Key key, this.selectedTab, this.txtQuery})
      : super(key: key);
}

class _EventsCardListState extends State<EventsCardList>
    with SingleTickerProviderStateMixin {
  String selectedCategory;
  List<String> tabs = ["All", "Workshops", "Talks", "General"];

  @override
  void initState() {
    super.initState();
    // selectedCategory = widget.selectedTab ?? "all";
  }

  @override
  Widget build(BuildContext context) {
    final _myNavIndex = Provider.of<MyNavigationIndex>(context);
    selectedCategory = _myNavIndex.getExplorerCategory;
    print("I want this " + _myNavIndex.getExplorerCategory);
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
                              _myNavIndex
                                  .setJustCategory(tabItem.toLowerCase());
                            });
                          },
                        ))
                    .toList()),
          ),
          SizedBox(height: 10),
          Flexible(
            child: AllEvents(category: selectedCategory,txtQuery: widget.txtQuery),
          ),
        ],
      ),
    );
  }
}
