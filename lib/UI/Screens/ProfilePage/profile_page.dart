import 'package:cached_network_image/cached_network_image.dart';
import 'package:excelapp/Accounts/account_services.dart';
import 'package:excelapp/Accounts/auth_service.dart';
import 'package:excelapp/Models/user_model.dart';
import 'package:excelapp/Providers/navigationProvider.dart';
import 'package:excelapp/Services/API/favourites_api.dart';
import 'package:excelapp/UI/Components/LoadingUI/alertDialog.dart';
import 'package:excelapp/UI/Components/LoadingUI/loadingAnimation.dart';

import 'package:excelapp/UI/Screens/ProfilePage/Widgets/qr_code.dart';
import 'package:excelapp/UI/Screens/ProfilePage/Widgets/update_profile.dart';
import 'package:excelapp/UI/Themes/profile_themes.dart';
import 'package:excelapp/UI/constants.dart';
import 'package:flutter/material.dart';
import 'package:excelapp/Services/API/registration_api.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Providers/loginStatusProvider.dart';
import '../../Components/EventCard/event_card.dart';
import '../../../Models/event_card.dart';

class ProfilePage extends StatefulWidget {
  final User user;
  final bool isProfileUpdated;
  ProfilePage(this.user, this.isProfileUpdated);
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with SingleTickerProviderStateMixin {
  User _user;
  bool _isProfileUpdated;
  AuthService authService;
  List<Event> _favouritedEvents = [];
  List<Event> _registeredEvents = [];

  
  TabController tabController;  

  var userDetails;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
    _user = widget.user;
    userDetails = viewUserProfile();
    _isProfileUpdated = widget.isProfileUpdated;
    authService = AuthService();
    fetchFavourites();
    fetchRegistrations();
    RegistrationAPI.fetchRegisteredEvents();
  }

  Future fetchFavourites() async {
    List<Event> events = await FavouritesAPI.fetchFavourites();
    setState(() {
      _favouritedEvents = events;
    });
  }

  Future fetchRegistrations() async {
    List<Event> registrations = await RegistrationAPI.fetchRegistrations();
    setState(() {
      _registeredEvents = registrations;
    });
  }

  Future<dynamic> viewUserProfile() async {
    print("netpoi");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getBool('isProfileUpdated') == false ||
        prefs.getBool('isProfileUpdated') == null) {
      return "Not Updated";
    } else {
      User user = await AccountServices.viewProfile();
      if (user == null) return "error";
      return user;
    }
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
    final myProvider = Provider.of<MyNavigationIndex>(context, listen: false);
    myProvider.setIndex = 3;

    final loginStatus = Provider.of<LoginStatus>(context, listen: false);
    loginStatus.setData('login');
    // Navigator.pushReplacement(
    //   context,
    //   MaterialPageRoute(builder: (context) => CheckUserLoggedIn()),
    // );
  }

  logOutConfirmation() async {
    await showModalBottomSheet(
      useRootNavigator: true,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40), topRight: Radius.circular(40))),
      constraints: BoxConstraints(
        minWidth: MediaQuery.of(context).size.width,
        maxHeight: 230,
      ),
      context: context,
      builder: (BuildContext bc) {
        return Container(
            child: Column(
          children: [
            SizedBox(height: 8),
            Image.asset(
              "assets/icons/divider.png",
              width: 340,
            ),
            SizedBox(
              height: 20,
            ),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                  padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                  child: Text(
                    "Confirm Log Out",
                    style: TextStyle(
                        fontFamily: "mulish",
                        fontSize: 20,
                        fontWeight: FontWeight.w800),
                  )),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                child: Text(
                  'Are you sure you want to log out?',
                  style: TextStyle(
                      fontFamily: "mulish",
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        logoutUser();
                        print("Logout pressed");
                        Navigator.pop(context);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Color.fromARGB(255, 239, 112, 95),
                        ),
                        width: MediaQuery.of(context).size.width * 0.4,
                        height: 60,
                        child: Center(
                          child: Text(
                            "Log Out",
                            style: TextStyle(
                                fontFamily: "mulish",
                                fontSize: 14,
                                color: Color.fromARGB(255, 251, 255, 255),
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Color.fromARGB(255, 228, 237, 239),
                          border: Border.all(
                            color: Color.fromARGB(255, 211, 225, 228),
                          ),
                        ),
                        width: MediaQuery.of(context).size.width * 0.4,
                        height: 60,
                        child: Center(
                          child: Text(
                            "Cancel",
                            style: TextStyle(
                                fontFamily: "mulish",
                                fontSize: 14,
                                color: Color.fromARGB(255, 61, 71, 71),
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ])
          ],
        ));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // print(widget.user.referrerAmbassadorId);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xDBE4E7),
        body: FutureBuilder(
            future: userDetails,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              print(snapshot.data);
              if (snapshot.hasData) {
                if (snapshot.data == "Not Updated") {
                  return Center(child: Text("Profile not updated"));
                }

                if (snapshot.data == "error") {
                  return Center(child: Text("An error occured, Try again"));
                } else {
                  print(snapshot.data.institutionId.toString());

                  return Container(
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CircleAvatar(
                                    radius: 38,
                                    backgroundImage:
                                        CachedNetworkImageProvider(snapshot.data.picture),
                                  ),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      padding: EdgeInsets.all(10),
                                      elevation: 0,
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
                                    onPressed: () {
                                      logOutConfirmation();
                                    },
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                snapshot.data.name,
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
                                snapshot.data.institutionName
                                    .toString()
                                    .replaceAll("null", "No Institution Name"),
                                style: TextStyle(
                                  fontFamily: pfontFamily,
                                  fontSize: 11,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(
                                height: 14,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  showQRButton(context, snapshot.data),
                                  SizedBox(
                                    width: 12,
                                  ),
                                  editProfileButton(context,snapshot.data),
                                ],
                              ),
                              SizedBox(height: 4),
                              TabBar(
                                  indicatorColor:
                                      Color.fromARGB(255, 14, 152, 232),
                                  indicatorPadding:
                                      EdgeInsets.fromLTRB(0, 0, 0, 0),
                                  labelColor: Color.fromARGB(255, 14, 152, 232),
                                  labelStyle: TextStyle(
                                    decorationColor:
                                        Color.fromARGB(255, 14, 152, 232),
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
                                          fontSize: 13,
                                          fontWeight: FontWeight.w800,
                                        ),
                                      ),
                                    ),
                                    Tab(
                                      child: Text(
                                        "Favorites",
                                        style: TextStyle(
                                          fontFamily: "mulish",
                                          fontSize: 13,
                                          fontWeight: FontWeight.w800,
                                        ),
                                      ),
                                    ),
                                    // Tab(
                                    //   child: Text(
                                    //     "Saved News",
                                    //     style: TextStyle(
                                    //       fontFamily: "mulish",
                                    //       fontSize: 13,
                                    //       fontWeight: FontWeight.w800,
                                    //     ),
                                    //   ),
                                    // ),
                                  ]),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: TabBarView(
                              controller: tabController,
                              physics: BouncingScrollPhysics(),
                              children: [
                                Registered(),
                                Favorites(),
                                // SavedNews(),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }
              } else {
                return LoadingAnimation();
              }
            }),
      ),
    );
  }

  Widget Registered() {
    return Container(
      color: Color(0xffECF4F5),
      child: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: _registeredEvents.length,
          shrinkWrap: true,
          itemBuilder: (_, index) {
            return EventCard(_registeredEvents[index],first: index==0);
          }),
    );
  }

  Widget Favorites() {
    return Container(
      color: Color(0xffECF4F5),
      child: ListView.builder(
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          itemCount: _favouritedEvents.length,
          itemBuilder: (_, index) {
            return EventCard(_favouritedEvents[index],first: index==0);
          }),
    );
  }

  // Widget SavedNews() {
  //   return ListView.builder(
  //       physics: BouncingScrollPhysics(),
  //       shrinkWrap: true,
  //       itemCount: savedNews.length,
  //       itemBuilder: (_, index) {
  //         return EventCard(savedNews[index]);
  //       });
  // }

  Widget showQRButton(BuildContext context, User user) {
    return ButtonTheme(
      //minWidth: MediaQuery.of(context).size.width / 2,
      child: TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.fromLTRB(24, 14, 24, 14),
          backgroundColor: primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
        ),
        child: Text(
          "Show Profile",
          style: TextStyle(
              color: Colors.white,
              fontFamily: pfontFamily,
              fontWeight: FontWeight.w700,
              fontSize: 11),
        ),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => QrCode(
                        ((user.qrCodeUrl != null) ? (user.qrCodeUrl) : ("")),
                        user.name,
                        ((user.institutionName != null)
                            ? (user.institutionName)
                            : ("Not Entered")),
                        user.id,
                        ((user.gender != null)
                            ? (user.gender)
                            : ("Not Entered")),
                        ((user.mobileNumber != null)
                            ? (user.mobileNumber)
                            : ("Not Entered")),
                        user.email,
                      )));
        },
      ),
    );
  }

  Widget editProfileButton(BuildContext context,User user) {
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
        onPressed: () async{
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return UpdateProfile(_user);
          })).then((value) {
            setState((){
              userDetails = viewUserProfile();
            });
          });
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
