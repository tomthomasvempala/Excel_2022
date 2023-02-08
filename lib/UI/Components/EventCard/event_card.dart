import 'package:cached_network_image/cached_network_image.dart';
import 'package:excelapp/Models/event_card.dart';
import 'package:excelapp/Services/API/events_api.dart';
import 'package:excelapp/Services/API/favourites_api.dart';
import 'package:excelapp/UI/Components/AlertDialog/alertDialog.dart';
import 'package:excelapp/UI/Components/LoadingUI/loadingAnimation.dart';
import 'package:excelapp/UI/Screens/EventPage/eventPage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:excelapp/UI/constants.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';

class EventCard extends StatefulWidget {
  final Event event;
  EventCard(this.event);

  @override
  State<EventCard> createState() => _EventCardState();
}

class _EventCardState extends State<EventCard> {
  bool likeState = false;
  bool isLoading = false;
  handleError(response) {
    print(response);
    if (response == "added")
      setState(() {
        likeState = true;
      });
    else if (response == "deleted")
      setState(() {
        likeState = false;
      });
    else
      alertDialog(text: response, context: context);
  }

  addToFavourites() async {
    setState(() {
      isLoading = true;
    });
    String response = await FavouritesAPI.addEventToFavourites(
        eventDetails:
            await EventsAPI.fetchAndStoreEventDetailsFromNet(widget.event.id));
    handleError(response);
    setState(() {
      isLoading = false;
    });
    FavouritesStatus.instance.favouritesStatus = 3;
  }

  deleteFromFavourites() async {
    setState(() {
      isLoading = true;
    });
    String response = await FavouritesAPI.deleteFavourite(id: widget.event.id);
    handleError(response);
    setState(() {
      isLoading = false;
    });
  }

  getFavouritedStatus() async {
    bool isFavourited = await FavouritesAPI.isFavourited(widget.event.id);
    setState(() {
      likeState = isFavourited;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: FavouritesAPI.isFavourited(widget.event.id),
        builder: (context, snapshot) => snapshot.hasData
            ? _buildCard(
                context,
                snapshot.data,
                widget.event,
                getFavouritedStatus,
                addToFavourites,
                deleteFromFavourites,
                isLoading,
                likeState)
            : Shimmer.fromColors(
                baseColor: Color.fromARGB(255, 238, 240, 240),
                highlightColor: Color.fromARGB(255, 255, 255, 255),
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white,
                  ),
                ),
              ));
  }
}

_buildCard(
    BuildContext context,
    data,
    Event event,
    Function getFavouritedStatus,
    Function addToFavourites,
    Function deleteFromFavourites,
    bool isLoading,
    bool likeState) {
  return Column(
    children: [
      Container(
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.white,
        ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(15, 20, 0, 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Hero(
                  tag: 'eventIcon${event.id}',
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(21),
                      color: Color.fromARGB(255, 14, 152, 232),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(12.25),
                      child: ClipRRect(
                        //Change this to Image.network when image server is up
                        child: Image.asset(
                          "assets/events/eventLogo.png",
                          //event.icon,
                          width: 31.5,
                          height: 31.5,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        event.name ?? "Event",
                        style: TextStyle(
                            color: Color.fromARGB(255, 28, 31, 32),
                            fontWeight: FontWeight.w800,
                            fontFamily: "mulish",
                            fontSize: 14),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      FutureBuilder(
                          future: Future.delayed(Duration(milliseconds: 1000),(){
                            return "Event description. This was just a fake timer. Not API call.";
                          }),
                          // EventsAPI.fetchAndStoreEventDetailsFromNet(
                          //     event.id),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return SizedBox(
                                width: MediaQuery.of(context).size.width * 0.46,
                                child: Text(
                                  snapshot.data
                                              .toString()
                                              .replaceAll("<br/>", "")
                                              .substring(
                                                  0,
                                                  snapshot.data
                                                              .toString()
                                                              .length >
                                                          50
                                                      ? 50
                                                      : snapshot.data
                                                          .toString()
                                                          .length) +
                                          "..." ??
                                      "Event Description",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 119, 133, 133),
                                      fontWeight: FontWeight.w500,
                                      fontFamily: "mulish",
                                      fontSize: 11),
                                ),
                              );
                            } else {
                              return SizedBox(
                                width: MediaQuery.of(context).size.width * 0.46,
                                child: Shimmer.fromColors(
                                  baseColor: Color.fromARGB(255, 238, 240, 240),
                                  highlightColor:
                                      Color.fromARGB(255, 255, 255, 255),
                                  child: Container(
                                    height: 10,
                                    width: 100,
                                    color: Colors.white,
                                  ),
                                ),
                              );
                            }
                          }),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Color.fromARGB(255, 215, 245, 245),
                              ),
                              child: Padding(
                                  padding: EdgeInsets.fromLTRB(16, 6, 16, 6),
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  EventPage(event.id))).then((value) {

                                                    getFavouritedStatus();
                                                  });
                                    },
                                    child: Container(
                                      child: Text(
                                        'Register',
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 14, 152, 232),
                                            fontWeight: FontWeight.w700,
                                            fontFamily: "mulish",
                                            fontSize: 11),
                                      ),
                                    ),
                                  ))),
                          SizedBox(width: 10),
                          InkWell(
                            onTap: () {
                              data ? deleteFromFavourites() : addToFavourites();
                              getFavouritedStatus();
                            },
                            child: isLoading
                                ? Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: Color(0xffECF4F5),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(10),
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                        valueColor:
                                            new AlwaysStoppedAnimation<Color>(
                                                primaryColor),
                                      ),
                                    ),
                                  )
                                : Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: Color(0xffECF4F5),
                                    ),
                                    child: Padding(
                                        padding: EdgeInsets.all(10),
                                        child: (data)
                                            ? FaIcon(
                                                FontAwesomeIcons.solidHeart,
                                                color: Colors.redAccent,
                                                size: 20)
                                            : FaIcon(FontAwesomeIcons.heart,
                                                color: Color.fromARGB(
                                                    255, 179, 193, 197),
                                                size: 20)),
                                  ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ]),
              Container(
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 230, 255, 234),
                    borderRadius: BorderRadiusDirectional.only(
                        topStart: Radius.circular(24),
                        bottomStart: Radius.circular(24))),
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Text(
                        new DateFormat.MMM().format(
                            DateTime.parse(event.date).add(Duration(days: 1))),
                        style: TextStyle(
                            color: Color.fromARGB(255, 7, 131, 131),
                            fontWeight: FontWeight.w800,
                            fontFamily: "mulish",
                            fontSize: 11),
                      ),
                      Text(
                        new DateFormat.d().format(
                            DateTime.parse(event.date).add(Duration(days: 1))),
                        style: TextStyle(
                            color: Color.fromARGB(255, 18, 221, 197),
                            fontWeight: FontWeight.w800,
                            fontFamily: "mulish",
                            fontSize: 18),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      SizedBox(
        height: 15,
      )
    ],
  );
}
