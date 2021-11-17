import 'dart:convert';

import 'package:flutter_app/Weather.dart';
import 'package:http/http.dart' as http;

class Api {
  static Future<Weather> getCurrentWeather(double lat, double lon) async {
    final response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/onecall?lat=$lat&lon=$lon&exclude=minutely,alerts&units=metric&appid=554d2df688ae78c03c2bd6bc40f382b3'));
    if(response.statusCode == 200){
      var json = jsonDecode(response.body);
      Weather weather = new Weather();
      weather.current = Current.fromJson(json);

      for(var h in json["hourly"]){
        weather.timeBlocks.add(WeatherToTime.fromJson(h));
      }

      for(var d in json['daily']) {
        weather.weekForecast.add(DayWeather.fromJson(d));
      }

      return weather;
    } else {
      throw Exception('Failed to load weather');
    }
  }

  static Future<List<double>> getPos(String name) async {
    final response = await http.get(Uri.parse('http://api.geonames.org/searchJSON?q=$name&maxRows=1&username=mazutik'));
    if(response.statusCode == 200){
      var json = jsonDecode(response.body);
      if(json['totalResultsCount'] > 0){
        return [json['geonames']['lng'], json['geonames']['lat']];
      } else {
        throw Exception('Place not found');
      }
    } else {
      throw Exception('Failed to load place');
    }
  }
}
