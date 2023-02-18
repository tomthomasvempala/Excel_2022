import 'package:excelapp/UI/Screens/HomePage/Widgets/Drawer/drawer.dart';
import 'package:excelapp/UI/constants.dart';
import 'package:flutter/material.dart';

class CampusAmbassador extends StatelessWidget {
  const CampusAmbassador({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Image.asset(
            "assets/icons/divider.png",
            width: MediaQuery.of(context).size.width * 0.8,
            height: 2,
            fit: BoxFit.fill,
          ),
        ),
        Container(
          padding: EdgeInsets.all(8),
          child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              color: Color(0xfffbffff),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
                    child: Text(
                      "Campus Ambassador",
                      style: TextStyle(
                          fontSize: 20,
                          color: primaryColor,
                          fontWeight: FontWeight.w900),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: Text(
                        "Become the face of Excel in your campus and win rewards upto ₹12K",
                        style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFF3D4747),
                            fontWeight: FontWeight.w400)),
                  ),
                  ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child:
                          // Image.network('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
                          Stack(
                        alignment: Alignment.topLeft,
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 20),
                            child: Image(
                              // image: NetworkImage(news.image),
                              image: AssetImage("assets/ca_bg.png"),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: ButtonTheme(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16)),
                              child: TextButton(
                                  style: ButtonStyle(
                                    padding:MaterialStateProperty.all( EdgeInsets.fromLTRB(30,16,30,16)),
                                    backgroundColor:
                                        MaterialStatePropertyAll(Color(0xffD7F5F5)),
                                        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)))
                                  ),
                                  onPressed: ()async {

                                    launchURL("https://ca.excelmec.org/");
                                  },
                                  child: Text(
                                    "Join now",
                                    style: TextStyle(fontSize: 14, color: primaryColor,fontWeight: FontWeight.w700),
                                  )),
                            ),
                          ),
                        ],
                      )),
                ],
              )),
        ),
      ],
    );
  }
}
