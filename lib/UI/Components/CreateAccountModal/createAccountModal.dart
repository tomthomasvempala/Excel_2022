import 'package:excelapp/Accounts/account_services.dart';
import 'package:excelapp/Models/user_model.dart';
import 'package:excelapp/Providers/navigationProvider.dart';
import 'package:excelapp/UI/Components/AlertDialog/alertDialog.dart';
import 'package:excelapp/UI/Components/LoadingUI/alertDialog.dart';
import 'package:flutter/material.dart';
import 'package:excelapp/UI/constants.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:searchable_paginated_dropdown/searchable_paginated_dropdown.dart';

import '../../Themes/colors.dart';

void showCreateAccountModal(context, User user) {
  showModalBottomSheet<dynamic>(
      isScrollControlled: true,
      useRootNavigator: true,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40), topRight: Radius.circular(40))),
      constraints: BoxConstraints(
        minWidth: MediaQuery.of(context).size.width,
      ),
      context: context,
      builder: (context) =>
          Wrap(children: <Widget>[CreateAccountModal(user, context)]));
}

class CreateAccountModal extends StatefulWidget {
  final User user;
  final BuildContext context;
  CreateAccountModal(this.user, this.context);
  @override
  State<CreateAccountModal> createState() => _CreateAccountModalState();
}

class _CreateAccountModalState extends State<CreateAccountModal> {
  List<Institution> collegeInstitutions = [];
  List<Institution> schoolInstitutions = [];

  // Form Fields
  final _formKey = GlobalKey<FormState>();
//int _id;
  String _name;
  // ignore: unused_field
  String _picture;
  String _mobileNumber;
  int _categoryId;
  int _institutionId;
  String _institutionName;
  String _gender;
  String _emailId;
  List<String> _categories = <String>['College', 'School'];
  List<String> _genders = <String>['Male', 'Female', 'Other'];
  String notInListOptionName = "NOT IN THIS LIST";
  String _customInstitutionName = "";

  @override
  void initState() {
    super.initState();
    initialiseUserDetails(widget.user);
    //initialiseUserDetails();
  }

  initialiseUserDetails(
    User user,
  ) async {
    //_id = user.id;
    _name = user.name;
    _mobileNumber = user.mobileNumber;
    _picture = user.picture;
    //_category = user.category != "Not Registered" ? user.category : "college";
    _institutionId = user.institutionId;
    _institutionName = user.institutionName;
    _gender = user.gender;
    _emailId = user.email;
    _categoryId = user.categoryId;
    if (_categoryId == 1 || _categoryId == 0) {
      await getInstitutions(loading: false);
      _institutionName = await getInstitutionName(_institutionId);
      print("Institution Name: $_institutionName");
      setState(() {
        _institutionName = _institutionName;
      });
    }
  }

  // Fetch institutions based on category
  getInstitutions({loading = true}) async {
    print("Fetching Institutions for category: $_categoryId");
    await Future.delayed(Duration(microseconds: 1));
    String category;
    if (_categoryId == 0)
      category = "college";
    else if (_categoryId == 1)
      category = "school";
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
        if (_categoryId == 0)
          collegeInstitutions = res;
        else if (_categoryId == 1) schoolInstitutions = res;
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

    // // get institutionId only if category is school or college & not in list
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

    if (finalInstitutionName == null || finalInstitutionName == "") {
      Navigator.of(context, rootNavigator: true).pop();
      return "Enter/Select institution name";
    }

    print("Institution Name: $finalInstitutionName");

    Map<String, dynamic> userInfo = {
      "name": _name,
      "institutionId": _institutionId,
      "institutionName": finalInstitutionName,
      "gender": _gender,
      "mobileNumber": _mobileNumber.toString(),
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
    if (_categoryId == 0)
      collegeInstitutions.forEach((e) {
        if (institutionName == e.name) {
          id = e.id;
        }
      });
    else if (_categoryId == 1)
      schoolInstitutions.forEach((e) {
        if (institutionName == e.name) {
          id = e.id;
        }
      });
    return id;
  }

  // Method to get institution name
  Future<String> getInstitutionName(int institutionId) async {
    String name;
    if (_categoryId == 0)
      collegeInstitutions.forEach((e) {
        if (institutionId == e.id) {
          name = e.name;
        }
      });
    else if (_categoryId == 1)
      schoolInstitutions.forEach((e) {
        if (institutionId == e.id) {
          name = e.name;
        }
      });
    return name;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(children: [
      SizedBox(height: 30),
      Padding(
        padding: EdgeInsets.fromLTRB(0, 0, 32, 10),
        child: Center(
          child: RichText(
            text: TextSpan(
              text: 'Create Account ',
              style: TextStyle(
                color: Color(0xDD000000),
                fontWeight: FontWeight.w800,
                fontSize: 20,
                fontFamily: "mulish",
              ),
              children: const <TextSpan>[
                TextSpan(
                  text:
                      "\n\nSeems like you are new here. Let’s get you \nstarted with a new Excel account.",
                  style: TextStyle(
                    color: Color.fromARGB(255, 61, 71, 71),
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    fontFamily: 'Mulish',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      SizedBox(height: 10),
      Padding(
        padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 30),
                // Name
                TextFormField(
                  initialValue: _name,
                  style: TextStyle(fontFamily: pfontFamily, fontSize: 15),
                  onSaved: (String value) {
                    setState(() {
                      _name = value.trim();
                    });
                  },
                  onChanged: (String value) {
                    setState(() {
                      _name = value.trim();
                    });
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Please enter your Name";
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
                    labelText: "Name",
                    icon: Icon(Icons.person),
                    contentPadding: EdgeInsets.all(16),
                  ),
                ),
                SizedBox(height: 20),
                //second name
                // Padding(
                //   padding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
                //   child: TextFormField(
                //     initialValue: _lastName,
                //     style: TextStyle(fontFamily: pfontFamily, fontSize: 15),
                //     onSaved: (String value) {
                //       setState(() {
                //         _lastName = value.trim();
                //       });
                //     },
                //     validator: (value) {
                //       if (value.isEmpty) {
                //         return "Please enter your name";
                //       }
                //       return null;
                //     },
                //     decoration: InputDecoration(
                //       border: OutlineInputBorder(
                //         borderSide: BorderSide(color: primaryColor),
                //         borderRadius: BorderRadius.circular(20),
                //       ),
                //       enabledBorder: OutlineInputBorder(
                //         borderSide: BorderSide(color: secondaryColor),
                //         borderRadius: BorderRadius.circular(20),
                //       ),
                //       labelText: "Last Name",
                //       //icon: Icon(Icons.person),
                //       contentPadding: EdgeInsets.all(16),
                //     ),
                //   ),
                // ),
                // SizedBox(
                //   height: 30,
                // ),
                // Select Gender

                Padding(
                  padding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
                  child: Container(
                    width: MediaQuery.of(context).size.width / 2,
                    child: DropdownButtonFormField(
                        icon: Icon(Icons.keyboard_arrow_down),
                        decoration: InputDecoration(
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
                  initialValue: (_mobileNumber == null) ? "" : _mobileNumber,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp("[0-9]"))
                  ],
                  style: TextStyle(fontFamily: pfontFamily, fontSize: 15),
                  onSaved: (String value) {
                    setState(() {
                      _mobileNumber = value;
                    });
                  },
                  onChanged: (value) {
                    setState(() {
                      _mobileNumber = value;
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
                // Select Category
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: DropdownButtonFormField(
                      decoration: InputDecoration(
                        icon: Icon(Icons.location_on_outlined),
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
                      icon: Icon(Icons.keyboard_arrow_down),
                      //border: OutlineInputBorder()),
                      items: _categories.map<DropdownMenuItem<String>>((val) {
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
                        _categories[_categoryId] ?? "Select Category",
                        style: TextStyle(color: Colors.black),
                      ),
                      onChanged: (value) {
                        setState(() {
                          _categoryId = _categories.indexOf(value);

                          //measureList.add(measure);
                        });
                        getInstitutions();
                      },
                      onSaved: (value) {
                        setState(() {
                          _categoryId = _categories.indexOf(value);
                        });
                      }),
                ),
                SizedBox(height: 30),
                // Select Institution

                (_categoryId != null &&
                        _categoryId != 2 &&
                        ((_categoryId == 0)
                            ? (collegeInstitutions.length > 0)
                            : (schoolInstitutions.length > 0)))
                    ? Container(
                        margin: EdgeInsets.fromLTRB(40, 0, 0, 0),
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          border: Border.all(color: black200),
                          borderRadius: BorderRadius.circular(24),
                        ),
                        // child: SearchableDropdown.single(
                        //   underline: Center(),
                        //   readOnly: _categoryId == null || _categoryId == 2,
                        //   items: institutions
                        //       .map<DropdownMenuItem<String>>((val) {
                        //     return DropdownMenuItem<String>(
                        //       value: val.name,
                        //       child: Text(
                        //         val.name.toString(),
                        //         style: TextStyle(
                        //           color: Colors.black87,
                        //           fontSize: 14,
                        //         ),
                        //       ),
                        //     );
                        //   }).toList(),
                        //   displayClearIcon: false,
                        //   hint: _institutionName ?? 'Select Institution',
                        //   style: TextStyle(fontSize: 14),
                        //   icon: Icon(Icons.keyboard_arrow_down),
                        //   searchHint: 'Enter Institution Name',
                        //   onChanged: (value) {
                        //     setState(() {
                        //       _institutionName = value;
                        //     });
                        //   },
                        //   isExpanded: true,
                        // ),
                        child: SearchableDropdown(
                          hintText:
                              Text(_institutionName ?? 'Select Institution'),
                          searchHintText: 'Enter Institution Name',
                          items: (_categoryId == 0)
                              ? collegeInstitutions
                                  .map<SearchableDropdownMenuItem<String>>(
                                      (val) {
                                  return SearchableDropdownMenuItem<String>(
                                    value: val.id.toString(),
                                    label: val.name,
                                    child: Text(
                                      val.name.toString(),
                                      style: TextStyle(
                                        color: Colors.black87,
                                        fontSize: 14,
                                      ),
                                    ),
                                  );
                                }).toList()
                              : schoolInstitutions
                                  .map<SearchableDropdownMenuItem<String>>(
                                      (val) {
                                  return SearchableDropdownMenuItem<String>(
                                    value: val.id.toString(),
                                    label: val.name,
                                    child: Text(
                                      val.name,
                                      style: TextStyle(
                                        color: Colors.black87,
                                        fontSize: 14,
                                      ),
                                    ),
                                  );
                                }).toList(),
                          onChanged: (value) {
                            print(int.parse(value));
                            setState(() {
                              _institutionId = int.parse(value);
                              _institutionName = (_categoryId == 0)
                                  ? collegeInstitutions
                                      .firstWhere((element) =>
                                          element.id == _institutionId)
                                      .name
                                  : schoolInstitutions
                                      .firstWhere((element) =>
                                          element.id == _institutionId)
                                      .name;
                            });
                          },
                        ))
                    : Center(),

                (_institutionName == notInListOptionName && _categoryId != 2)
                    ? Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: TextFormField(
                          style:
                              TextStyle(fontFamily: pfontFamily, fontSize: 15),
                          onSaved: (String value) {
                            setState(() {
                              _customInstitutionName = value.trim();
                            });
                          },
                          onChanged: (String value) {
                            setState(() {
                              _customInstitutionName = value.trim();
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
                      )
                    : Center(),

                SizedBox(height: _categoryId != null ? 25 : 90),
                // Submit button
                SizedBox(height: 18),
                Center(
                  child: InkWell(
                    onTap: () {
                      print("Saved");
                      _formKey.currentState.validate()
                          ? submitForm().then((value) {
                              if (value == "Submitted") {
                                // Navigator.pushAndRemoveUntil(
                                //   context,
                                //   MaterialPageRoute(
                                //     builder: (context) => CheckUserLoggedIn(),
                                //   ),
                                //   (Route<dynamic> route) => false,
                                // );

                                Navigator.pop(context);
                                final myProvider =
                                    Provider.of<MyNavigationIndex>(context,
                                        listen: false);
                                myProvider.setIndex = 3;
                              } else {
                                // _formKey.currentState.save();
                                alertDialog(text: value, context: context);
                              }
                            }).catchError((e) => print(e))
                          : print("Not valid");
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: Color.fromARGB(255, 14, 152, 232),
                      ),
                      height: 50,
                      width: 301,
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Create Account',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: "mulish",
                                fontWeight: FontWeight.w700,
                                fontSize: 14),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(Icons.arrow_forward,
                              size: 19, color: Colors.white)
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 19,
                ),
              ],
            ),
          ),
        ),
      )
    ]));
  }
}
