import 'dart:convert';
import 'dart:developer';

import 'package:flutter_app/Weather.dart';
import 'package:http/http.dart' as http;

class Api {
  static Future<Weather> getWeather(String lat, String lon) async {
    final response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/onecall?lat=$lat&lon=$lon&exclude=minutely,alerts&units=metric&appid=554d2df688ae78c03c2bd6bc40f382b3'));
    if(response.statusCode == 200){
      var json = jsonDecode(response.body);
      Weather weather = new Weather();
      weather.current = Current.fromJson(json);

      List<WeatherToTime> timeBlock = [];
      for(var h in json["hourly"]){
        timeBlock.add(WeatherToTime.fromJson(h));
      }
      weather.timeBlocks = timeBlock;

      List<DayWeather> day = [];
      for(var d in json['daily']) {
        day.add(DayWeather.fromJson(d));
      }
      weather.weekForecast = day;

      //log(weather.toString());

      return weather;
    } else {
      throw Exception('Failed to load weather');
    }
  }

  static Future<Place> getPos(String name) async {
    final response = await http.get(Uri.parse('http://api.geonames.org/searchJSON?q=$name&maxRows=1&username=mazutik'));
    if(response.statusCode == 200){
      var json = jsonDecode(response.body);
      if(json['totalResultsCount'] > 0){
        return Place(json['geonames'][0]['toponymName'], json['geonames'][0]['lng'], json['geonames'][0]['lat']);
      } else {
        throw Exception('Place not found');
      }
    } else {
      throw Exception('Failed to load place');
    }
  }

  static Future<List<Place>> getPlaces(String name) async {
    final response = await http.get(Uri.parse('http://api.geonames.org/searchJSON?q=$name&username=mazutik'));
    if(response.statusCode == 200){
      var json = jsonDecode(response.body);
      if(json['totalResultsCount'] > 0){
        List<Place> places = [];
        json['geonames'].forEach(
            (el){
              places.add(Place(el['toponymName'], el['lng'], el['lat']));
            }
        );
        // for(int i = 0; i < json['totalResultsCount'] - 1; i++){
        //   places.add(Place(json['geonames'][i]['toponymName'], json['geonames'][i]['lng'], json['geonames'][i]['lat']));
        // }
        return places;
      } else {
        throw Exception('Place not found');
      }
    } else {
      throw Exception('Failed to load place');
    }
  }
}

