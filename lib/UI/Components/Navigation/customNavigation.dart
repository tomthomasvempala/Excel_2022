import 'package:excelapp/Providers/navigationProvider.dart';
import 'package:excelapp/UI/Screens/ExplorePage/explorePage.dart';
import 'package:excelapp/UI/Screens/HomePage/Widgets/aboutExcel.dart';
import 'package:excelapp/UI/Screens/HomePage/homePage.dart';
import 'package:excelapp/UI/Screens/ProfilePage/profile_main.dart';
import 'package:excelapp/UI/Screens/Schedule/schedule.dart';
import 'package:excelapp/UI/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './bottom_navigation.dart';
import './tab_navigator.dart';
import './BottomNavigationBarWidget/layout.dart';

// To add pages to Bottom Navigation Bar, import & add them to /lib/UI/Components/Navigation/pageNavigator.dart

// To hide bottom navigatiom bar, import this file and call hideBottomNav()
// To show bottom navigatiom bar, import this file and call showBottomNav()

Function hideBottomNav;
Function showBottomNav;

class CustomNavigator extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CustomNavigatorState();
}

class CustomNavigatorState extends State<CustomNavigator> {
  int selectedTab;
  TabItem _currentTab = TabItem.page1;
  Map<TabItem, GlobalKey<NavigatorState>> _navigatorKeys = {
    TabItem.page1: GlobalKey<NavigatorState>(),
    TabItem.page2: GlobalKey<NavigatorState>(),
    TabItem.page3: GlobalKey<NavigatorState>(),
    TabItem.page4: GlobalKey<NavigatorState>(),
  };

  bool bottonNavHidden = false;
  // ExplorePage explorePage = ExplorePage(key: Key('A'), selectedPage: 1,selectedCategory: 'talks',);
  ExplorePage explorePage = ExplorePage(key: Key('A'),);
  @protected
  void initState() {
    selectedTab=0;
    hideBottomNav = () {
      setState(() {
        bottonNavHidden = true;
      });
    };
    showBottomNav = () {
      setState(() {
        bottonNavHidden = false;
      });
    };
    super.initState();
  }

  void _selectTab(TabItem tabItem) {
    if (tabItem == _currentTab) {
      // pop to first route
      _navigatorKeys[tabItem].currentState.popUntil((route) => route.isFirst);
    } else {
      setState(() => _currentTab = tabItem);
    }
  }


  @override
  Widget build(BuildContext context) {
    final _myNavIndex = Provider.of<MyNavigationIndex>(context);
    return WillPopScope(
      onWillPop: () async {
        if(_myNavIndex.getIndex!=0){
          _myNavIndex.setIndex=0;
          return false;
        }
        return true;
        // final isFirstRouteInCurrentTab =
        //     !await _navigatorKeys[_currentTab].currentState.maybePop();
        // if (isFirstRouteInCurrentTab) {
        //   // if not on the 'main' tab
        //   if (_currentTab != TabItem.page1) {
        //     // select 'main' tab
        //     _selectTab(TabItem.page1);
        //     // back button handled by app
        //     return false;
        //   }
        // }
        // // let system handle back button if we're on the first route
        // return isFirstRouteInCurrentTab;
      },
      child: Scaffold(
          extendBody: true,
          body: 
          IndexedStack(
            index: _myNavIndex.getIndex,
            children: [
              HomePage(),
              explorePage,
              Schedule(),
              CheckUserLoggedIn()
          ],
          
          ),
          // Stack(children: <Widget>[
          //   _buildOffstageNavigator(TabItem.page1),
          //   _buildOffstageNavigator(TabItem.page2),
          //   _buildOffstageNavigator(TabItem.page3),
          //   _buildOffstageNavigator(TabItem.page4),
          // ]),
          bottomNavigationBar: Visibility(
            maintainState: true,
            visible: bottonNavHidden ? false : true,
            child: BottomNavigation(
              selectedIndex: selectedTab,
              onSelect: (i){
                _myNavIndex.setIndex = i;
                // selectedTab=i;
                // setState(() {
                // });
              },
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          floatingActionButton: _buildFab(context, bottonNavHidden),
        ),
    );
  }

  Widget _buildOffstageNavigator(TabItem tabItem) {
    return Offstage(
      offstage: _currentTab != tabItem,
      child: TabNavigator(
        navigatorKey: _navigatorKeys[tabItem],
        tabItem: tabItem,
      ),
    );
  }
}

Widget _buildFab(BuildContext context, bottonNavHidden) {
  return Visibility(
    maintainState: true,
    visible: bottonNavHidden ? false : true,
    child: AnchoredOverlay(
      showOverlay: false,
      child: FloatingActionButton(
        backgroundColor: primaryColor,
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            useRootNavigator: true,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40))),
            constraints: BoxConstraints(
              minWidth: MediaQuery.of(context).size.width,
            ),
            context: context,
            builder: (BuildContext context) {
              return Wrap(children: <Widget>[AboutExcelPopUp()]);
            },
          );
        },
        child: Image.asset(
          'assets/excel logo.png',
          height: 90,
          color: Colors.white,
        ),
        elevation: 2.0,
      ),
    ),
  );
}
