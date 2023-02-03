import 'package:excelapp/Accounts/account_services.dart';
import 'package:excelapp/Models/user_model.dart';
import 'package:excelapp/UI/Components/AlertDialog/alertDialog.dart';
import 'package:excelapp/UI/Components/Appbar/appbar.dart';
import 'package:excelapp/UI/Components/LoadingUI/alertDialog.dart';
import 'package:excelapp/UI/Components/LoadingUI/snackBar.dart';
import 'package:excelapp/UI/Screens/ProfilePage/profile_main.dart';
import 'package:excelapp/UI/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:searchable_dropdown/searchable_dropdown.dart';

class UpdateProfile extends StatefulWidget {
  final User user;
  UpdateProfile(this.user);

  @override
  _UpdateProfileState createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  List<Institution> institutions = [];

  // Form Fields
  final _formKey = GlobalKey<FormState>();
//int _id;
  String _firstName;
  String _lastName;
  String _mobile;
  int _categoryId;
  int _institutionId;
  String _institutionName;
  String _gender;
  String _emailId;
  List<String> _categories = <String>['College', 'School', 'Other'];
  List<String> _genders = <String>['Male', 'Female', 'Other'];
  String notInListOptionName = "NOT IN THIS LIST";
  String _customInstitutionName = "";

// Category id's & their values:
// 0: College
// 1: School
// 2: Other

  @override
  void initState() {
    super.initState();
    initialiseUserDetails(widget.user);
    //initialiseUserDetails();
  }

  // Initialize form fields
  initialiseUserDetails(
    User user,
  ) async {
    //_id = user.id;
    _firstName = user.name;
    _lastName = "Thomas Vempala";
    _mobile = user.mobileNumber;
    //_category = user.category != "Not Registered" ? user.category : "college";
    _institutionId = user.institutionId;
    _institutionName = user.institutionName;
    _gender = user.gender;
    _emailId = user.email;
    _categoryId = user.categoryId;
    if (_categoryId == 1 || _categoryId == 0) {
      await getInstitutions(loading: false);
      _institutionName = await getInstitutionName(_institutionId);
      setState(() {
        _institutionName = _institutionName;
      });
    }
  }

  // Fetch institutions based on category
  getInstitutions({loading = true}) async {
    await Future.delayed(Duration(microseconds: 1));
    String category;
    if (_categoryId == 0)
      category = "College";
    else if (_categoryId == 1)
      category = "School";
    else
      category = "Other";
    final loadingDialog = alertBox("Fetching Institutions");
    if (loading)
      showDialog(
        context: context,
        builder: (BuildContext context) => loadingDialog,
        barrierDismissible: false,
      );

    try {
      List<Institution> res = await AccountServices.fetchInstitutions(category);
      Institution notInListOption =
          Institution(id: 0, name: notInListOptionName);
      res.insert(0, notInListOption);
      setState(() {
        institutions.clear();
        institutions.addAll(res);
      });
      if (loading) Navigator.of(context, rootNavigator: true).pop();
    } catch (_) {
      if (loading) Navigator.of(context, rootNavigator: true).pop();
      alertDialog(
        text: "Failed to fetch institutions\nTry again",
        context: context,
      );
    }
  }

  // Submit Form
  Future submitForm() async {
    setState(() {});
    final loadingDialog = alertBox("Submitting Form");
    showDialog(
      context: context,
      builder: (BuildContext context) => loadingDialog,
      barrierDismissible: false,
    );
    if (_gender == null || _gender == null) {
      Navigator.of(context, rootNavigator: true).pop();
      return "Gender not selected";
    }

    // get institutionId only if category is school or college & not in list
    if (_categoryId != 2 && _institutionName != notInListOptionName) {
      _institutionId = await getInstitutionId(_institutionName);
    }
    // Set institution if to 0 if its custom entered
    if (_institutionName == notInListOptionName) {
      _institutionId = 0;
    }
    if (_institutionId == null && _categoryId != 2) {
      Navigator.of(context, rootNavigator: true).pop();
      return "One or more fields are invalid!";
    }
    if (_categoryId != 2 && _institutionName == null) {
      Navigator.of(context, rootNavigator: true).pop();
      return "Select institution";
    }
    if (_customInstitutionName == notInListOptionName) {
      Navigator.of(context, rootNavigator: true).pop();
      return "Enter institution name";
    }
    if (_institutionName == null && _categoryId != 2) {
      Navigator.of(context, rootNavigator: true).pop();
      return "Choose institution name";
    }

    String finalInstitutionName = (_institutionName == notInListOptionName)
        ? _customInstitutionName
        : _institutionName;
    Map<String, dynamic> userInfo = {
      "name": _firstName,
      "institutionId": _institutionId,
      "institutionName": finalInstitutionName,
      "gender": _gender,
      "mobileNumber": _mobile,
      "categoryId": _categoryId.toString()
    };
    print(userInfo);
    var res = await AccountServices.updateProfile(userInfo);
    Navigator.of(context, rootNavigator: true).pop();
    if (res == "error")
      alertDialog(text: "Something went wrong", context: context);
    else {
      return "Submitted";
    }
  }

  // Method to get institution Id
  Future<int> getInstitutionId(String institutionName) async {
    int id = -1;
    institutions.forEach((e) {
      if (institutionName == e.name) {
        id = e.id;
      }
    });
    return id;
  }

  // Method to get institution name
  Future<String> getInstitutionName(int institutionId) async {
    String name;
    institutions.forEach((e) {
      if (institutionId == e.id) {
        name = e.name;
      }
    });
    return name;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white70,
        shadowColor: null,
        elevation: 1,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: secondaryColor,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        titleTextStyle: TextStyle(
          color: secondaryColor,
          fontFamily: pfontFamily,
          fontSize: 18,
          fontWeight: FontWeight.w700,
        ),
        title: Text("Edit Profile"),
        actions: [
          saveButton(),
        ],
      ),
      body: Theme(
        data: Theme.of(context).copyWith(
          primaryColor: primaryColor,
        ),
        child: Container(
          padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 30),
                  Center(
                      child: Container(
                    //padding: EdgeInsets.symmetric(horizontal: 10),
                    width: 140,
                    height: 110,
                    //color: Colors.yellow,
                    child: Stack(
                      children: [
                        Positioned(
                          top: 0,
                          left: 10,
                          child: CircleAvatar(
                            radius: 56,
                            backgroundColor: Colors.white38,
                            child: CircleAvatar(
                              radius: 53,
                              backgroundImage: AssetImage("assets/Tom ser.jpg"),
                            ),
                          ),
                        ),
                        Positioned(
                          //alignment: Alignment.topRight,
                          top: 0,
                          right: 0,
                          child: Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.all(10),
                                backgroundColor: primaryColor,
                                shape: CircleBorder(
                                  side: BorderSide(
                                    color: primaryColor,
                                    width: 2,
                                  ),
                                ),
                              ),
                              child: Icon(
                                Icons.camera_alt_outlined,
                                size: 18,
                                color: Colors.white,
                              ),
                              onPressed: () {},
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
                  SizedBox(height: 30),
                  // Name
                  TextFormField(
                    initialValue: _firstName,
                    style: TextStyle(fontFamily: pfontFamily, fontSize: 15),
                    onSaved: (String value) {
                      setState(() {
                        _firstName = value.trim();
                      });
                    },
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Please enter your name";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: primaryColor),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: secondaryColor),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      labelText: "First Name",
                      icon: Icon(Icons.person),
                      contentPadding: EdgeInsets.all(16),
                    ),
                  ),
                  SizedBox(height: 20),
                  //second name
                  Padding(
                    padding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
                    child: TextFormField(
                      initialValue: _lastName,
                      style: TextStyle(fontFamily: pfontFamily, fontSize: 15),
                      onSaved: (String value) {
                        setState(() {
                          _lastName = value.trim();
                        });
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Please enter your name";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: primaryColor),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: secondaryColor),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        labelText: "Last Name",
                        //icon: Icon(Icons.person),
                        contentPadding: EdgeInsets.all(16),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  // Select Gender

                  Padding(
                    padding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
                    child: Container(
                      width: MediaQuery.of(context).size.width / 2,
                      child: DropdownButtonFormField(
                          icon: Icon(Icons.keyboard_arrow_down),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: primaryColor),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: secondaryColor),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            labelText: "Gender",
                            //hintText: _gender ?? "Select Gender",
                            contentPadding: EdgeInsets.all(16),
                          ),
                          //border: OutlineInputBorder()),
                          items: _genders.map<DropdownMenuItem<String>>((val) {
                            return DropdownMenuItem<String>(
                              value: val,
                              child: Text(
                                val,
                                style: TextStyle(
                                  color: secondaryColor,
                                  fontSize: 14,
                                ),
                              ),
                            );
                          }).toList(),
                          hint: Text(_gender ?? "Select Gender",
                              style: TextStyle(color: Colors.black)),
                          onChanged: (value) {
                            setState(() {
                              _gender = value;
                            });
                          },
                          onSaved: (value) {
                            setState(() {
                              _gender = value;
                            });
                          }),
                    ),
                  ),
                  // Container(
                  //   child: DropdownButton<String>(
                  //     isExpanded: true,
                  //     isDense: true,
                  //     style: TextStyle(color: primaryColor),
                  //     underline: Center(),
                  //     icon: Icon(Icons.keyboard_arrow_down),
                  //     hint: Text(_gender ?? "Select Gender"),

                  //   ),
                  // ),
                  SizedBox(height: 30),
                  // Mobile Number
                  TextFormField(
                    initialValue: _mobile ?? "",
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp("[0-9]"))
                    ],
                    style: TextStyle(fontFamily: pfontFamily, fontSize: 15),
                    onSaved: (String value) {
                      setState(() {
                        _mobile = value;
                      });
                    },
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Please enter your mobile number";
                      }
                      if (value.length > 10) {
                        return "Invalid Mobile number";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: "Contact",
                      icon: Icon(Icons.phone),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: primaryColor),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: secondaryColor),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      //icon: Icon(Icons.person),
                      contentPadding: EdgeInsets.all(16),
                    ),
                  ),
                  SizedBox(height: 30),
                  //email
                  TextFormField(
                    initialValue: _emailId ?? "",
                    keyboardType: TextInputType.emailAddress,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(
                          r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                          r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                          r"{0,253}[a-zA-Z0-9])?)*$"))
                    ],
                    style: TextStyle(fontFamily: pfontFamily, fontSize: 15),
                    onSaved: (String value) {
                      setState(() {
                        _emailId = value;
                      });
                    },
                    validator: (value) {
                      String pattern =
                          r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                          r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                          r"{0,253}[a-zA-Z0-9])?)*$";
                      RegExp regex = RegExp(pattern);
                      if (!regex.hasMatch(value))
                        return 'Enter a valid email address';
                      if (value.isEmpty) {
                        return "Please enter your Email Address";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: "E-mail",
                      icon: Icon(Icons.email_outlined),

                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: primaryColor),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: secondaryColor),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      //icon: Icon(Icons.person),
                      contentPadding: EdgeInsets.all(16),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    initialValue: _institutionName,
                    style: TextStyle(fontFamily: pfontFamily, fontSize: 15),
                    onSaved: (String value) {
                      setState(() {
                        _institutionName = value.trim();
                      });
                    },
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Please enter your Institute Name";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: primaryColor),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: secondaryColor),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      labelText: "Institute Name",
                      icon: Icon(Icons.location_on_outlined),
                      contentPadding: EdgeInsets.all(16),
                    ),
                  ),

                  SizedBox(height: 20),
                  // Select Category
                  Padding(
                    padding: EdgeInsets.fromLTRB(40, 0, 0, 0),
                    child: Container(
                      width: MediaQuery.of(context).size.width / 2,
                      child: DropdownButtonFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: primaryColor),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: secondaryColor),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            labelText: "Institute Type",
                            contentPadding: EdgeInsets.all(16),
                          ),
                          //border: OutlineInputBorder()),
                          items:
                              _categories.map<DropdownMenuItem<String>>((val) {
                            return DropdownMenuItem<String>(
                              value: val,
                              child: Text(
                                val,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                ),
                              ),
                            );
                          }).toList(),
                          hint: Text(
                            _categories[_categoryId] ?? "Select Gender",
                            style: TextStyle(color: Colors.black),
                          ),
                          onChanged: (value) {
                            setState(() {
                              _categoryId = value;
                              // measureList.add(measure);
                            });
                          },
                          onSaved: (value) {
                            setState(() {
                              _categoryId = value;
                            });
                          }),
                    ),
                  ),
                  //SizedBox(height: 30),
                  // Select Institution

                  // (_categoryId != null &&
                  //         _categoryId != 2 &&
                  //         institutions.isNotEmpty)
                  //     ? Container(
                  //         margin: EdgeInsets.symmetric(horizontal: 5),
                  //         decoration: BoxDecoration(
                  //           border: Border.all(color: Colors.black12),
                  //           borderRadius: BorderRadius.circular(3),
                  //         ),
                  //       //   child: SearchableDropdown.single(
                  //       //     underline: Center(),
                  //       //     readOnly: _categoryId == null || _categoryId == 2,
                  //       //     items: institutions
                  //       //         .map<DropdownMenuItem<String>>((val) {
                  //       //       return DropdownMenuItem<String>(
                  //       //         value: val.name,
                  //       //         child: Text(
                  //       //           val.name.toString(),
                  //       //           style: TextStyle(
                  //       //             color: Colors.black87,
                  //       //             fontSize: 14,
                  //       //           ),
                  //       //         ),
                  //       //       );
                  //       //     }).toList(),
                  //       //     displayClearIcon: false,
                  //       //     hint: _institutionName ?? 'Select Institution',
                  //       //     style: TextStyle(fontSize: 14),
                  //       //     icon: Icon(Icons.keyboard_arrow_down),
                  //       //     searchHint: 'Enter Institution Name',
                  //       //     onChanged: (value) {
                  //       //       setState(() {
                  //       //         _institutionName = value;
                  //       //       });
                  //       //     },
                  //       //     isExpanded: true,
                  //       //   ),
                  //       )
                  //     : Center(),
                  //
                  // (_institutionName == notInListOptionName && _categoryId != 2)
                  //     ? Padding(
                  //         padding: const EdgeInsets.only(top: 15.0),
                  //         child: TextFormField(
                  //           style: TextStyle(
                  //               fontFamily: pfontFamily, fontSize: 15),
                  //           onSaved: (String value) {
                  //             setState(() {
                  //               _customInstitutionName = value;
                  //             });
                  //           },
                  //           validator: (value) {
                  //             if (value.isEmpty) {
                  //               return "Enter institution name";
                  //             }
                  //             return null;
                  //           },
                  //           decoration: InputDecoration(
                  //             labelText: "Institution Name",
                  //             icon: Icon(Icons.school),
                  //             contentPadding: EdgeInsets.zero,
                  //           ),
                  //         ),
                  //       )
                  //     : Center(),

                  SizedBox(height: _categoryId != null ? 25 : 90),
                  // Submit button

                  SizedBox(height: 120)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget saveButton() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 6, 24, 6),
      child: TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.fromLTRB(24, 8, 24, 8),
          backgroundColor: primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
        ),
        child: Text(
          "Save",
          style: TextStyle(
              color: Colors.white,
              fontFamily: pfontFamily,
              fontWeight: FontWeight.w700,
              fontSize: 12),
        ),
        onPressed: () {
          print("Saved");
          _formKey.currentState.save();
          _formKey.currentState.validate()
              ? submitForm().then((value) {
            if (value == "Submitted") {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => CheckUserLoggedIn(),
                ),
                    (Route<dynamic> route) => false,
              );
            } else {
              ScaffoldMessenger.of(context)
                  .showSnackBar(snackBar(value));
            }
          }).catchError((e) => print(e))
              : print("Not valid");
          
        },
      ),
    );
  }
}
