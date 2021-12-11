import 'dart:convert';

import 'Weather.dart';

class Params{
  static Place selectedPlace = new Place("St Petersburg", "30.31413", "59.93863");
  static List<Place> favoritePlace = [selectedPlace];
  static bool temp = true;
  static bool speed = true;
  static bool pressure = true;
  static late Weather weather;
  static bool theme = true;


  Params();

  Map<String, dynamic> toJson(){
    return{
      'selectedPlace' : selectedPlace.toJson(),
      'favoritePlace' : jsonEncode(favoritePlace) ,
      'temp' : temp,
      'speed' : speed,
      'pressure' : pressure,
      'theme' : theme,
    };
  }
}

