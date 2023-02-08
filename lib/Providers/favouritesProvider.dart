import 'package:flutter/foundation.dart';

import '../Services/API/favourites_api.dart';

class FavoritesProvider with ChangeNotifier {
  List<int> _favorites = [];

  List<int> get favorites => _favorites;

  FavoritesProvider(){
  }

  void addToFavorites(int eventId) {
    _favorites.add(eventId);
    notifyListeners();
  }

  void removeFromFavorites(int eventId) {
    _favorites.remove(eventId);
    notifyListeners();
  }
}