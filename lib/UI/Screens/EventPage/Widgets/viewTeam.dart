import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:excelapp/Accounts/getAuthorisedData.dart';
import 'package:excelapp/Models/event_details.dart';
import 'package:excelapp/Services/API/api_config.dart';
import 'package:excelapp/UI/Components/Appbar/appbar.dart';
import 'package:excelapp/UI/Components/LoadingUI/loadingAnimation.dart';
import 'package:excelapp/UI/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class ViewTeam extends StatefulWidget {
  final EventDetails eventDetails;
  final int teamID;
  ViewTeam({@required this.eventDetails, @required this.teamID});
  @override
  _ViewTeamState createState() => _ViewTeamState();
}

class _ViewTeamState extends State<ViewTeam> {
  bool dataFetched = false;
  Map<String, dynamic> teamDetails = {};

  fetchData() async {
    teamDetails["id"] = widget.teamID.toString();
    // teamDetails["name"] = "Team Name";
    String teamID = widget.teamID.toString();
    print(teamID);
    String requestUrl = APIConfig.teamUrl + "getTeamDetails";
    var response = await http.post(Uri.parse(requestUrl), body: {
      "teamId": teamID,
    });
    setState(() {
      dataFetched = true;
      teamDetails["members"] = jsonDecode(response.body);
    });
    print(teamDetails);
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        title: Text("Team Information"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: dataFetched
            ? SingleChildScrollView(
                child: Column(
                  children: [
                        SizedBox(height: 30),
                        Center(
                          child: Container(
                            height: 100,
                            child: Card(
                              color: primaryColor,
                              elevation: 8,
                              child: Container(
                                padding: EdgeInsets.all(20),
                                child: CachedNetworkImage(
                                  imageUrl: widget.eventDetails.icon,
                                ),
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(80),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 15),
                        // Text(
                        //   "Team: " + teamDetails["name"].toString(),
                        //   style: TextStyle(fontSize: 19, color: primaryColor),
                        //   textAlign: TextAlign.center,
                        // ),

                        SizedBox(height: 30),
                        // SizedBox(height: 20),
                        Text(
                          "ID: " + teamDetails["id"].toString(),
                          style: TextStyle(
                            fontSize: 15,
                            color: lightTextColor,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Event name: " + widget.eventDetails.name.toString(),
                          style: TextStyle(
                            fontSize: 14,
                            color: lightTextColor,
                            fontStyle: FontStyle.italic,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 10),
                        Text(
                            new DateFormat("dd MMMM yyyy")
                                .format(DateTime.parse(widget.eventDetails.datetime)).toString(),
                          style: TextStyle(
                            fontSize: 14,
                            color: lightTextColor,
                            fontStyle: FontStyle.italic,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 20),
                        RotatedBox(
                          quarterTurns: 0,
                          child: Image(
                            height: 40,
                            image: AssetImage("assets/divider_design.png"),
                          ),
                        ),
                        SizedBox(height: 25),
                        Text(
                          "Team Members",
                          style: TextStyle(fontSize: 21, color: lightTextColor),
                        ),
                        SizedBox(height: 20),
                      ] +
                      List.generate(
                        teamDetails["members"].length,
                        (index) => Padding(
                          padding: EdgeInsets.symmetric(vertical: 5),
                          child: ListTile(
                            dense: true,
                            // leading: CircleAvatar(
                            //   radius: 15.5,
                            //   backgroundColor: primaryColor,
                            //   backgroundImage: CachedNetworkImageProvider(
                            //     teamDetails["members"][index]["picture"],
                            //   ),
                            // ),
                            title: Text(teamDetails["members"][index]["name"]),
                            subtitle:
                                Text(teamDetails["members"][index]["email"]),
                          ),
                        ),
                      ) +
                      [SizedBox(height: 100)],
                ),
              )
            : LoadingAnimation(),
      ),
    );
  }
}
