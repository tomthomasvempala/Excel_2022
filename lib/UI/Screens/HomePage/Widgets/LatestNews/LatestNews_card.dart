import 'package:excelapp/Models/latest_news.dart';
import 'package:excelapp/UI/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LastestNewsCard extends StatelessWidget {
  final News news;
  LastestNewsCard(this.news);
  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: Color(0xfffbffff),
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child:
                      // Image.network('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
                      Stack(
                    alignment: Alignment.topRight,
                    children: [
                      // Image(
                      //   image: NetworkImage(news.image),
                      // ),
                      //commented due to some tag error
                      //
                      //
                      // Padding(
                      //   padding: EdgeInsets.all(15),
                      //   child: Container(
                      //     width: 40,
                      //     height: 40,
                      //     child: FloatingActionButton(
                      //       heroTag: 'btn1',
                      //       elevation: 0,
                      //       shape: RoundedRectangleBorder(
                      //         borderRadius: BorderRadius.circular(60),
                      //       ),
                      //       child: FaIcon(Icons.bookmark_outline_rounded),
                      //       foregroundColor: Colors.white,
                      //       backgroundColor: Color.fromARGB(155, 251, 255, 255),
                      //     ),
                      //   ),
                      // ),
                    ],
                  )),
              SizedBox(
                height: 16,
              ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    news.title,
                    style: headingStyle,
                    textAlign: TextAlign.left,
                  )),
              SizedBox(
                height: 8,
              ),
              Text(
                news.desc,
                textAlign: TextAlign.left,
                style: pStyle,
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    news.button,
                    style: TextStyle(
                        color: primaryColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        fontFamily: pfontFamily),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        news.date,
                        style: TextStyle(
                            color: Color(0xff778585),
                            fontSize: 10,
                            fontWeight: FontWeight.w800,
                            fontFamily: pfontFamily),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      SizedBox(
                        child: Container(
                          height: 5,
                          width: 5,
                          decoration: BoxDecoration(
                              color: Color(0xff778585),
                              borderRadius: BorderRadius.circular(50)),
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        news.time,
                        style: TextStyle(
                            color: Color(0xff778585),
                            fontSize: 10,
                            fontWeight: FontWeight.w800,
                            fontFamily: pfontFamily),
                      )
                    ],
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
