import 'package:excelapp/Models/event_details.dart';
import 'package:excelapp/Services/API/favourites_api.dart';
import 'package:excelapp/UI/Components/AlertDialog/alertDialog.dart';
import 'package:excelapp/UI/Themes/colors.dart';
import 'package:excelapp/UI/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LikeButton extends StatefulWidget {
  final EventDetails eventDetails;
  LikeButton({@required this.eventDetails});
  @override
  State<StatefulWidget> createState() {
    return _LikeButton();
  }
}

class _LikeButton extends State<LikeButton> {
  bool likeState = false;
  bool isLoading = false;
  EventDetails eventDetails;

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
    String response =
        await FavouritesAPI.addEventToFavourites(eventDetails: eventDetails);
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
    String response = await FavouritesAPI.deleteFavourite(id: eventDetails.id);
    handleError(response);
    setState(() {
      isLoading = false;
    });
  }

  getFavouritedStatus() async {
    bool isFavourited = await FavouritesAPI.isFavourited(eventDetails.id);
    setState(() {
      likeState = isFavourited;
    });
  }

  @override
  void initState() {
    eventDetails = widget.eventDetails;
    getFavouritedStatus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    
    return Container(
      height: 25,
      width: 25,
      color: white200,
      child: isLoading
          ? Container(
              color: Color(0xffECF4F5),
              height: 25,
              width: 25,
              padding: const EdgeInsets.all(2.0),
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: new AlwaysStoppedAnimation<Color>(primaryColor),
              ),
            )
          : InkWell(
              child: !likeState
                  ? Center(
                      child: FaIcon(FontAwesomeIcons.heart,
                          color: Color.fromARGB(255, 179, 193, 197), size: 20),
                    )
                  : Center(
                      child: FaIcon(FontAwesomeIcons.solidHeart,
                          color: Colors.redAccent, size: 20),
                    ),
              onTap: () {
                // final myProvider = Provider.of<FavoritesProvider>(context,listen: false);
                if (likeState) {
                  deleteFromFavourites();
                  // myProvider.removeFromFavorites(widget.eventDetails.id);
                } else {
                  addToFavourites();
                  // myProvider.addToFavorites(widget.eventDetails.id);
                }
                getFavouritedStatus();
              },
            ),
    );
  }
}
