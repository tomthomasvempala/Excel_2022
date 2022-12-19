import 'package:excelapp/Accounts/auth_service.dart';
import 'package:excelapp/Models/user_model.dart';
import 'package:excelapp/UI/Components/Appbar/appbar.dart';
import 'package:excelapp/UI/Components/LoadingUI/alertDialog.dart';

// import 'package:excelapp/UI/Screens/ProfilePage/Widgets/referal.dart';
import 'package:excelapp/UI/Screens/ProfilePage/Widgets/qr_code.dart';
import 'package:excelapp/UI/Screens/ProfilePage/Widgets/update_profile.dart';
import 'package:excelapp/UI/Screens/ProfilePage/Widgets/view_profile.dart';
import 'package:excelapp/UI/Screens/ProfilePage/profile_main.dart';
import 'package:excelapp/UI/Themes/profile_themes.dart';
import 'package:excelapp/UI/constants.dart';
import 'package:flutter/material.dart';
import 'package:excelapp/Services/API/registration_api.dart';
import 'package:excelapp/UI/Screens/ProfilePage/Registration/registration.dart';

import '../../Components/EventCard/event_card.dart';
import '../../../Models/event_card.dart';

class ProfilePage extends StatefulWidget {
  // final User user;
  //  final bool isProfileUpdated;
  //  ProfilePage(this.user, this.isProfileUpdated);
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with SingleTickerProviderStateMixin {
  User _user;
  bool _isProfileUpdated;
  AuthService authService;

  @override
  TabController tabController;

  List registeredEvents = [
    Event(
      name: "Issue!",
      desc: "Lorem ipsum dolor sit amet, conse ctetur adi piscing elit.",
      date: "Nov 03",
      icon:
          'https://lh3.googleusercontent.com/u/0/drive-viewer/AFDK6gP3FNEz9-xW8xi_kZbWIUttbFoQqfnPk3eO74LqnnSWiauhn13FG4lZisLh09HKgAG6GsvqimyRU2eVapzdthT0PJHlEQ=w1920-h892',
    ),
    Event(
      name: "Issue!",
      desc: "Lorem ipsum dolor sit amet, conse ctetur adi piscing elit.",
      date: "Nov 03",
      icon:
          'https://lh3.googleusercontent.com/u/0/drive-viewer/AFDK6gP3FNEz9-xW8xi_kZbWIUttbFoQqfnPk3eO74LqnnSWiauhn13FG4lZisLh09HKgAG6GsvqimyRU2eVapzdthT0PJHlEQ=w1920-h892',
    )
  ];
  List favoriteEvents = [
    Event(
      name: "Issue!",
      desc: "Lorem ipsum dolor sit amet, conse ctetur adi piscing elit.",
      date: "Nov 03",
      icon:
          'https://lh3.googleusercontent.com/u/0/drive-viewer/AFDK6gP3FNEz9-xW8xi_kZbWIUttbFoQqfnPk3eO74LqnnSWiauhn13FG4lZisLh09HKgAG6GsvqimyRU2eVapzdthT0PJHlEQ=w1920-h892',
    ),
    Event(
      name: "Issue!",
      desc: "Lorem ipsum dolor sit amet, conse ctetur adi piscing elit.",
      date: "Nov 03",
      icon:
          'https://lh3.googleusercontent.com/u/0/drive-viewer/AFDK6gP3FNEz9-xW8xi_kZbWIUttbFoQqfnPk3eO74LqnnSWiauhn13FG4lZisLh09HKgAG6GsvqimyRU2eVapzdthT0PJHlEQ=w1920-h892',
    )
  ];

  List savedNews = [
    Event(
      name: "Issue!",
      desc: "Lorem ipsum dolor sit amet, conse ctetur adi piscing elit.",
      date: "Nov 03",
      icon:
          'https://lh3.googleusercontent.com/u/0/drive-viewer/AFDK6gP3FNEz9-xW8xi_kZbWIUttbFoQqfnPk3eO74LqnnSWiauhn13FG4lZisLh09HKgAG6GsvqimyRU2eVapzdthT0PJHlEQ=w1920-h892',
    ),
    Event(
      name: "Issue!",
      desc: "Lorem ipsum dolor sit amet, conse ctetur adi piscing elit.",
      date: "Nov 03",
      icon:
          'https://lh3.googleusercontent.com/u/0/drive-viewer/AFDK6gP3FNEz9-xW8xi_kZbWIUttbFoQqfnPk3eO74LqnnSWiauhn13FG4lZisLh09HKgAG6GsvqimyRU2eVapzdthT0PJHlEQ=w1920-h892',
    )
  ];

  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
    //   _user = widget.user;
    //   _isProfileUpdated = widget.isProfileUpdated;
    //   authService = AuthService();
    //   RegistrationAPI.fetchRegisteredEvents();
  }

  logoutUser() async {
    final alertDialog = alertBox("Please Wait");
    showDialog(
      context: context,
      builder: (BuildContext context) => alertDialog,
      barrierDismissible: false,
    );

    await authService.logout();
    Navigator.of(context, rootNavigator: true).pop();
    print("Logout");
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => CheckUserLoggedIn()),
    );
  }

  logOutConfirmation() async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Do you want to Logout ?',
            style: TextStyle(fontSize: 16, color: primaryColor),
          ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          actions: <Widget>[
            TextButton(
              child: Text(
                "Yes",
                style: TextStyle(fontSize: 14.5, color: primaryColor),
              ),
              onPressed: () {
                // Logout
                logoutUser();
                Navigator.pop(context);
              },
            ),
            TextButton(
              child: Text(
                "Cancel",
                style: TextStyle(fontSize: 14.5, color: primaryColor),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // print(widget.user.referrerAmbassadorId);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xDBE4E7),
        body: Container(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 100,
                padding: EdgeInsets.fromLTRB(22, 20, 22, 0),
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 42.5,
                          backgroundImage: AssetImage("assets/Tom ser.jpg"),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.all(10),
                            backgroundColor: Color(0xd0fcd1cc),
                            shape: CircleBorder(
                              side: BorderSide(
                                color: Color(0xd0fcd1cc),
                                width: 2,
                              ),
                            ),
                          ),
                          child: Icon(
                            Icons.logout,
                            size: 25,
                            color: Color(0xffFD7B69),
                          ),
                          onPressed: () {},
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Tom Thomas Vempala",
                      style: TextStyle(
                        fontFamily: pfontFamily,
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      "Govt. Model Engineering College, Thrikkakara",
                      style: TextStyle(
                        fontFamily: pfontFamily,
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        showQRButton(context),
                        SizedBox(
                          width: 12,
                        ),
                        editProfileButton(context),
                      ],
                    ),
                    TabBar(
                        indicatorColor: Color.fromARGB(255, 14, 152, 232),
                        indicatorPadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        labelColor: Color.fromARGB(255, 14, 152, 232),
                        labelStyle: TextStyle(
                          decorationColor: Color.fromARGB(255, 14, 152, 232),
                        ),
                        unselectedLabelColor:
                            Color.fromARGB(235, 119, 133, 133),
                        controller: tabController,
                        tabs: [
                          Tab(
                            child: Text(
                              "Registered",
                              style: TextStyle(
                                fontFamily: "mulish",
                                fontSize: 14,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                          Tab(
                            child: Text(
                              "Favorites",
                              style: TextStyle(
                                fontFamily: "mulish",
                                fontSize: 14,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                          Tab(
                            child: Text(
                              "Saved News",
                              style: TextStyle(
                                fontFamily: "mulish",
                                fontSize: 14,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                        ]),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                  child: TabBarView(
                    controller: tabController,
                    children: [
                      Registered(),
                      Favorites(),
                      SavedNews(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget Registered() {
    return ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: registeredEvents.length,
        shrinkWrap: true,
        itemBuilder: (_, index) {
          return EventCard(registeredEvents[index]);
        });
  }

  Widget Favorites() {
    return ListView.builder(
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (_, index) {
          return EventCard(favoriteEvents[index]);
        });
  }

  Widget SavedNews() {
    return ListView.builder(
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (_, index) {
          return EventCard(savedNews[index]);
        });
  }

  Widget showQRButton(BuildContext context) {
    return ButtonTheme(
      //minWidth: MediaQuery.of(context).size.width / 2,
      child: TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.fromLTRB(24, 12, 24, 12),
          backgroundColor: primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
        ),
        child: Text(
          "Show QR Code",
          style: TextStyle(
              color: Colors.white,
              fontFamily: pfontFamily,
              fontWeight: FontWeight.w700,
              fontSize: 11),
        ),
        onPressed: () {},
      ),
    );
  }

  Widget editProfileButton(BuildContext context) {
    return ButtonTheme(
      //minWidth: MediaQuery.of(context).size.width / 2,
      child: TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.fromLTRB(24, 12, 24, 12),
          backgroundColor: Color(0xffE4EDEF),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
        ),
        child: Text(
          "Edit Profile",
          style: TextStyle(
              color: Colors.black,
              fontFamily: pfontFamily,
              fontWeight: FontWeight.w700,
              fontSize: 11),
        ),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return UpdateProfile();
          }));
        },
      ),
    );
  }
}

Widget cardBuilder(String name, bool check) {
  return Card(
    margin: EdgeInsets.symmetric(vertical: 4, horizontal: 4),
    elevation: 2,
    child: ListTile(
      // dense: true,
      title: Row(
        children: <Widget>[
          Text(
            name,
            style: ProfileTheme.detailsTextStyle,
          ),
          SizedBox(width: 5),
          check != true
              ? Icon(Icons.info_outline, color: Colors.green)
              : Container(),
        ],
      ),
      trailing: Icon(Icons.arrow_forward_ios, color: primaryColor),
    ),
  );
}
