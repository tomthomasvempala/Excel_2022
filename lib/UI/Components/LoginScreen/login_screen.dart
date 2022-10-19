import 'package:excelapp/Accounts/account_services.dart';
import 'package:excelapp/Accounts/auth_service.dart';
import 'package:excelapp/Services/API/favourites_api.dart';
import 'package:excelapp/UI/Components/Appbar/darkAppbar.dart';
import 'package:excelapp/UI/Components/CreateAccountModal/createAccountModal.dart';
import 'package:excelapp/UI/Components/LoadingUI/alertDialog.dart';
import 'package:excelapp/UI/Screens/ProfilePage/profile_main.dart';
import 'package:excelapp/UI/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  AuthService authService;

  @override
  void initState() {
    super.initState();
    authService = AuthService();
  }

  void authentication(BuildContext context) async {
    final alertDialog = alertBox("Please Wait");
    showDialog(
      context: context,
      builder: (BuildContext context) => alertDialog,
      barrierDismissible: false,
    );
    // Logout and  then Login
    await authService.logout();
    String auth = await authService.login();

    if (auth == 'success') {
      // Fetch User details and Update local database - User table
      await AccountServices.fetchUserDetails();
      // Refresh fvourites
      FavouritesStatus.instance.favouritesStatus = 3;
      Navigator.of(context, rootNavigator: true).pop();
    } else {
      print("Authentication went wrong");
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => CheckUserLoggedIn()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: darkAppbar(),
      backgroundColor: Color.fromRGBO(237, 245, 246, 1),
      body: Container(
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              width: 327,
              height: 542,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: Colors.white,
                  border: Border.all(
                    width: 1.2,
                    color: Color.fromRGBO(228, 237, 239, 1.0), //E4EDEF;
                  )),
              padding: EdgeInsets.symmetric(horizontal: 45),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    //height: 197, //MediaQuery.of(context).size.height / 6,
                    child: Image(
                      image: AssetImage("assets/excellogo.png"),
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "Excel Accounts",
                    style: TextStyle(
                      color: secondaryColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      fontFamily: pfontFamily,
                    ),
                  ),
                  SizedBox(height: 8),
                  Container(
                    //width: 228,
                    child: Text(
                      "Manage everything Excel using Excel accounts. Connect your google account to proceed",
                      style: TextStyle(
                        color: lightTextColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        fontFamily: pfontFamily,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 20),
                  ButtonTheme(
                    //minWidth: MediaQuery.of(context).size.width / 2,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.fromLTRB(32, 15, 32, 15),
                        backgroundColor: primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FaIcon(FontAwesomeIcons.google,size: 18,),
                          // CircleAvatar(
                          //   radius: 10,
                          //   backgroundColor: Colors.white,
                          // ),
                          Text(
                            "Continue with Google",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: pfontFamily,
                                fontWeight: FontWeight.w700,
                                fontSize: 14),
                          ),
                        ],
                      ),
                      onPressed: () =>authentication(context),
                      onLongPress: (){
                        showCreateAccountModal(context);
                     },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
