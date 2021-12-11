import 'dart:convert';

import 'package:flutter_app/Params.dart';
import 'package:flutter_app/Weather.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Func {
  static void getParamsFromSharedPref() async {
    final prefs = await SharedPreferences.getInstance();
    final json = prefs.getString('Params');
    if (json != null) {
      var params = jsonDecode(json);
      List<Place> favoritePlace = [];
      var listPlaces = jsonDecode(params['favoritePlace']);
      for (var p in listPlaces) {
        favoritePlace.add(Place.fromJson(p));
      }
      Params.selectedPlace = Place.fromJson(params['selectedPlace']);
      Params.favoritePlace = favoritePlace;
      Params.temp = params['temp'];
      Params.speed = params['speed'];
      Params.pressure = params['pressure'];
      Params.theme = params['theme'];
    }
  }

  static void clearData() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  static void saveParamsToSharedPref() async {
    final prefs = await SharedPreferences.getInstance();
    Params params = Params();
    String json = jsonEncode(params);
    prefs.setString('Params', json);
  }
}
