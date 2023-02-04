import 'package:excelapp/Models/user_model.dart';
import 'package:excelapp/Providers/loginStatusProvider.dart';
import 'package:excelapp/Services/Database/hive_operations.dart';
import 'package:excelapp/UI/Components/LoadingUI/loadingAnimation.dart';
import 'package:excelapp/UI/Components/LoginScreen/login_screen.dart';
import 'package:excelapp/UI/Screens/ProfilePage/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CheckUserLoggedIn extends StatefulWidget {
  @override
  _CheckUserLoggedInState createState() => _CheckUserLoggedInState();
}

class _CheckUserLoggedInState extends State<CheckUserLoggedIn> {
  bool isProfileUpdated;
  Future userData;

  Future<dynamic> checkUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print("In check user");
    if (prefs.getBool('isLogged') == false ||
        prefs.getBool('isLogged') == null) {
      print(prefs.getBool('isLogged'));
      return 'login';
    } else {
      print('In else of check user');
      // Fetch user details from database
      isProfileUpdated = prefs.getBool('isProfileUpdated') ?? false;
      var user = await HiveDB.retrieveData(valueName: "user");
      if (user == null) return "login";
      return User.fromJson(user);
    }
  }

  bool isInit;
  @override
  void initState() {
    isInit = true;
    super.initState();
  }

  void didChangeDependencies() async {
    if (isInit) {
      isInit = false;
      final loginStatus = Provider.of<LoginStatus>(context);
      await checkUser().then((value) {
        loginStatus.setData(value);
      });
    }
    // final loginStatus = Provider.of<LoginStatus>(context);
    // loginStatus.setDataFuture(checkUser());
    super.didChangeDependencies();

    // userData = checkUser();
  }

  @override
  Widget build(BuildContext context) {
    final loginStatus = Provider.of<LoginStatus>(context);
    return Material(
      child: StreamBuilder(
        stream: loginStatus.data.stream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data == 'login') {
              return LoginScreen();
            } else {
              return ProfilePage(snapshot.data, isProfileUpdated);
            }
          } else {
            return LoadingAnimation();
          }
        },
      ),
    );
  }
}
