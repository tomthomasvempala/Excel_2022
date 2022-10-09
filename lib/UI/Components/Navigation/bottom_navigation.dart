import 'package:excelapp/UI/Themes/profile_themes.dart';
import 'package:excelapp/UI/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import './BottomNavigationBarWidget/fab_bottom_app_bar.dart';

enum TabItem { page1, page2, page3, page4 }

Map<TabItem, int> tabName = {
  TabItem.page1: 0,
  TabItem.page2: 1,
  TabItem.page3: 2,
  TabItem.page4: 3,
};

class BottomNavigation extends StatelessWidget {
  BottomNavigation({this.currentTab, this.onSelectTab});
  final TabItem currentTab;
  final ValueChanged<TabItem> onSelectTab;

  @override
  Widget build(BuildContext context) {
    return FABBottomAppBar(
      centerItemText: '',
      color: Colors.grey,
      selectedColor: primaryColor,
      notchedShape: CircularNotchedRectangle(),
      onTabSelected: (index) => onSelectTab(
        TabItem.values[index],
      ),
      items: [
        FABBottomAppBarItem(iconData: FontAwesomeIcons.house, text: ''),
        FABBottomAppBarItem(iconData: FontAwesomeIcons.compass, text: ''),
        FABBottomAppBarItem(iconData: FontAwesomeIcons.calendar, text: ''),
        FABBottomAppBarItem(iconData: Icons.account_circle, text: ''),
      ],
    );
  }
}
