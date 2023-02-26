import 'package:excelapp/UI/Screens/HomePage/Widgets/Drawer/drawer.dart';
import 'package:excelapp/UI/Themes/colors.dart';
import 'package:excelapp/UI/constants.dart';
import 'package:flutter/material.dart';

class CampusAmbassador extends StatelessWidget {
  const CampusAmbassador({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20,10,20,12),
          child: Divider(
            color: white400,
            thickness: 2,
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32),
            border: Border.all(color: white300, width: 1.2),
            color: white100,
          ),
          margin: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(32),
            child: Stack(
              alignment: Alignment.topLeft,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 112),
                  child: Image(
                    // image: NetworkImage(news.image),
                    image: AssetImage("assets/ca_bg.png"),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Campus Ambassador",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: primaryColor,
                                  fontWeight: FontWeight.w900),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              "Become the face of Excel in your campus and win rewards upto ₹12K",
                              style: TextStyle(
                                  fontSize: 14,
                                  height: 1.5,
                                  color: Color(0xFF3D4747),
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      ButtonTheme(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16)),
                        child: TextButton(
                          style: ButtonStyle(
                              padding: MaterialStateProperty.all(
                                  EdgeInsets.fromLTRB(30, 16, 30, 16)),
                              backgroundColor:
                                  MaterialStatePropertyAll(Color(0xffD7F5F5)),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(30)))),
                          onPressed: () async {
                            launchURL("https://ca.excelmec.org/");
                          },
                          child: Text(
                            "Join now",
                            style: TextStyle(
                                fontSize: 14,
                                color: primaryColor,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20,12,20,2),
          child: Divider(
            color: white400,
            thickness: 2,
          ),
        ),
      ],
    );
  }
}
