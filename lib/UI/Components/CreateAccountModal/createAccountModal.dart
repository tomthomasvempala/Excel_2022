import 'package:flutter/material.dart';


void showCreateAccountModal(context) {
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
      builder: (context) => Wrap(children: <Widget>[CreateAccountModal()]));
}

class CreateAccountModal extends StatefulWidget {
   CreateAccountModal({Key key}) : super(key: key);

  @override
  State<CreateAccountModal> createState() => _CreateAccountModalState();
}

class _CreateAccountModalState extends State<CreateAccountModal> {
  final items = ['Select','Male','Female','Decline to State'];
  String selectedItem = 'Select';
  final types = ['Select','College'];
  String selectedType = 'Select';

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
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
            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
            SizedBox(
              height: 50,
              width: 316,
              child: TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      color: Color(0xDD000000),
                    )),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                    color: Color.fromARGB(255, 14, 152, 232),
                    width: 2,
                  )),
                icon:Icon(Icons.person_outline_rounded,
                   color: Color(0xDD000000),),
                labelText: "First Name",
                labelStyle: TextStyle(
                  color: Color.fromARGB(255, 61, 71, 71),
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  fontFamily: 'Mulish',
                ),
                ),
              ),
            ),
                SizedBox(height: 18),
                Padding(
                  padding: EdgeInsets.fromLTRB(75, 0, 32, 0),
                  child: SizedBox(
                    height: 50,
                    width: 284,
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              color: Color.fromARGB(255, 61, 71, 71),
                            )),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              color: Color.fromARGB(255, 14, 152, 232),
                              width: 2,
                            )),
                        labelText: "Last Name",
                        labelStyle: TextStyle(
                          color: Color.fromARGB(255, 61, 71, 71),
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          fontFamily: 'Mulish',
                        ),

                      ),
                    ),
                  ),
                ),
                SizedBox(height: 18),
                Padding(
                  padding: EdgeInsets.fromLTRB(85, 0, 130, 0),
                  child: SizedBox(
                    height: 54,
                    width: 284,
                    child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              color: Color.fromARGB(255, 61, 71, 71),
                            )),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              color: Color.fromARGB(255, 14, 152, 232),
                              width: 2,
                            )),
                        labelText: "Gender",
                        labelStyle: TextStyle(
                          color: Color.fromARGB(255, 61, 71, 71),
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          fontFamily: 'Mulish',
                        ),
                      ),
                      value:selectedItem,
                      items: items.map(buildMenuItem).toList(),
                      onChanged: (item) =>   setState(() => selectedItem = item),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  height: 50,
                  width: 316,
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 61, 71, 71),
                          )),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 14, 152, 232),
                            width: 2,
                          )),
                      icon:Icon(Icons.call_outlined,
                      color: Color(0xDD000000),),
                      labelText: "Contact",
                      labelStyle: TextStyle(
                        color: Color.fromARGB(255, 61, 71, 71),
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        fontFamily: 'Mulish',
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  height: 50,
                  width: 316,
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 61, 71, 71),
                          )),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 14, 152, 232),
                            width: 2,
                          )),
                      icon: Icon(Icons.mail_outline_rounded,
                          color: Color(0xDD000000),),
                      labelText: "E-mail",
                      labelStyle: TextStyle(
                      color: Color.fromARGB(255, 61, 71, 71),
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      fontFamily: 'Mulish',
                    ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  height: 50,
                  width: 316,
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 61, 71, 71),
                          )),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 14, 152, 232),
                            width: 2,
                          )),
                      icon: Icon(Icons.location_on_outlined,
                        color: Color(0xDD000000),),
                      labelText: "Institution Name",
                      labelStyle: TextStyle(
                        color: Color.fromARGB(255, 61, 71, 71),
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        fontFamily: 'Mulish',
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 18),
                Padding(
                  padding: EdgeInsets.fromLTRB(85, 0, 130, 0),
                  child: SizedBox(
                    height: 54,
                    width: 284,
                    child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              color: Color.fromARGB(255, 61, 71, 71),
                            )),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              color: Color.fromARGB(255, 14, 152, 232),
                              width: 2,
                            )),
                        labelText: "Institution Type",
                        labelStyle: TextStyle(
                          color: Color.fromARGB(255, 61, 71, 71),
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          fontFamily: 'Mulish',
                        ),

                      ),
                      value:selectedType,
                      items: types.map(buildMenuItem).toList(),
                      onChanged: (item) =>   setState(() => selectedType = item),
                    ),
                  ),
                ),
                SizedBox(height: 18),
                Center(
                  child: InkWell(
                    onTap: () {
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
        ],
      ),
    );
  }

  DropdownMenuItem<String> buildMenuItem(String item) =>
      DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: TextStyle(
            fontFamily: 'Mulish',
            fontWeight: FontWeight.w400,
            fontSize: 14,),
        ),
  );
}

