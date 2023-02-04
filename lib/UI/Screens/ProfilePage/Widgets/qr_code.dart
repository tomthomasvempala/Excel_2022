import 'package:cached_network_image/cached_network_image.dart';
import 'package:excelapp/UI/Screens/ProfilePage/Widgets/updateImage.dart';
import 'package:excelapp/UI/Themes/profile_themes.dart';
import 'package:excelapp/UI/constants.dart';
import 'package:flutter/material.dart';

class QrCode extends StatelessWidget {
  // final String imageUrl, qrUrl, name;
  // QrCode(this.imageUrl, this.qrUrl, this.name);

  @override
  Widget build(BuildContext context) {
    // return Card(
    //   elevation: 3,
    //   child: Center(
    //     child: Container(
    //       padding: EdgeInsets.symmetric(vertical: 10),
    //       child: Column(
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         children: <Widget>[
    //           // Profile pic
    //           Stack(
    //             alignment: Alignment.bottomRight,
    //             children: [
    //               CircleAvatar(
    //                 backgroundColor: Colors.transparent,
    //                 radius: MediaQuery.of(context).size.height / 14,
    //                 backgroundImage: CachedNetworkImageProvider(
    //                   imageUrl,
    //                 ),
    //               ),
    //               InkWell(
    //                 onTap: () {
    //                   Navigator.push(
    //                     context,
    //                     MaterialPageRoute(
    //                         builder: (context) => ImgUpload(imgUrl: imageUrl)),
    //                   );
    //                 },
    //                 child: CircleAvatar(
    //                   radius: 15,
    //                   backgroundColor: Colors.black45,
    //                   child: Icon(
    //                     Icons.camera_alt,
    //                     color: Colors.white,
    //                     size: 17,
    //                   ),
    //                 ),
    //               ),
    //             ],
    //           ),

    //           // User name
    //           SizedBox(height: 5),
    //           Text(
    //             name,
    //             style: ProfileTheme.nameStyle,
    //           ),
    //           // QR code
    //           SizedBox(height: 7),
    //           ElevatedButton(
    //               style: ElevatedButton.styleFrom(
    //                 padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    //                 backgroundColor: primaryColor,
    //               ),
    //               child: Text(
    //                 'SHOW QR CODE',
    //                 style: ProfileTheme.buttonTextStyle,
    //               ),
    //               onPressed: () => qrDialog(context, qrUrl)),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 236, 244, 245),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 236, 244, 245),
        shadowColor: null,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: secondaryColor,
          onPressed: () {},
        ),
        titleTextStyle: TextStyle(
          color: secondaryColor,
          fontFamily: pfontFamily,
          fontSize: 18,
          fontWeight: FontWeight.w700,
        ),
        title: Text("View QR Code"),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(32, 20, 32, 20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Center(
            child: Container(
              padding: EdgeInsets.fromLTRB(31, 15, 31, 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(24)),
                  color: Color.fromARGB(255, 251, 255, 255)),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/qrcode.png',
                      height: 250,
                      width: 250,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Tom Thomas Vempala',
                      style: TextStyle(
                        color: Color.fromARGB(255, 28, 31, 32),
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Excel ID : 123456',
                      style: TextStyle(
                          fontFamily: pfontFamily,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(255, 119, 133, 133)),
                    )
                  ]),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Container(
              height: 66,
              width: 155,
              decoration: BoxDecoration(
                  color: Color(0xFFFBFFFF),
                  borderRadius: BorderRadius.circular(24)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(15, 5.23, 0, 0),
                    child: Icon(
                      Icons.person_2_outlined,
                      size: 20.0,
                      color: Color(0xFF0E99E8),
                    ),
                  ),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.fromLTRB(11, 0, 0, 0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Gender',
                            style: TextStyle(
                              color: Color(0xFF778585),
                              fontSize: 11,
                              fontFamily: pfontFamily,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Male',
                            style: TextStyle(
                              color: Color(0xFF3D4747),
                              fontSize: 14,
                              fontFamily: pfontFamily,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ))
                ],
              ),
            ),
            Container(
              height: 66,
              width: 155,
              decoration: BoxDecoration(
                  color: Color(0xFFFBFFFF),
                  borderRadius: BorderRadius.circular(24)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(15, 5.23, 0, 0),
                    child: Icon(
                      Icons.phone_in_talk_outlined,
                      size: 20.0,
                      color: Color(0xFF0E99E8),
                    ),
                  ),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.fromLTRB(11, 0, 0, 0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Phone',
                            style: TextStyle(
                              color: Color(0xFF778585),
                              fontSize: 11,
                              fontFamily: pfontFamily,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            '9876543210',
                            style: TextStyle(
                              color: Color(0xFF3D4747),
                              fontSize: 14,
                              fontFamily: pfontFamily,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ))
                ],
              ),
            )
          ]),
          SizedBox(height: 20),
          Container(
            height: 66,
            decoration: BoxDecoration(
                color: Color(0xFFFBFFFF),
                borderRadius: BorderRadius.circular(24)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(15, 5.23, 0, 0),
                  child: Icon(
                    Icons.email_outlined,
                    size: 20.0,
                    color: Color(0xFF0E99E8),
                  ),
                ),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.fromLTRB(11, 0, 0, 0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Email',
                          style: TextStyle(
                            color: Color(0xFF778585),
                            fontSize: 11,
                            fontFamily: pfontFamily,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'vempala@gmail.com',
                          style: TextStyle(
                            color: Color(0xFF3D4747),
                            fontSize: 14,
                            fontFamily: pfontFamily,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ))
              ],
            ),
          ),
          SizedBox(height: 20),
          Container(
            constraints: BoxConstraints(
              minHeight: 66,
              maxHeight: 80,
            ),
            decoration: BoxDecoration(
                color: Color(0xFFFBFFFF),
                borderRadius: BorderRadius.circular(24)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(15, 5.23, 0, 0),
                  child: Icon(
                    Icons.location_on_outlined,
                    size: 20.0,
                    color: Color(0xFF0E99E8),
                  ),
                ),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.fromLTRB(11, 0, 7, 0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'College',
                          style: TextStyle(
                            color: Color(0xFF778585),
                            fontSize: 11,
                            fontFamily: pfontFamily,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Govt. Model Engineering College , Cochin',
                          style: TextStyle(
                            color: Color(0xFF3D4747),
                            fontSize: 14,
                            fontFamily: pfontFamily,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ))
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

// qrDialog(BuildContext context, String qrUrl) {
//   showModalBottomSheet(
//     context: context,
//     builder: (BuildContext bc) {
//       return Container(
//         margin: EdgeInsets.only(bottom: 60),
//         child: Center(
//           child: CachedNetworkImage(
//             imageUrl: qrUrl,
//             width: MediaQuery.of(context).size.width * .60,
//             placeholder: (context, str) =>
//                 Center(child: CircularProgressIndicator()),
//           ),
//         ),
//       );
//     },
//   );
// }
