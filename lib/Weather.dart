import 'dart:developer';

class Weather {
  late List<WeatherToTime> timeBlocks;
  late Current current;
  late List<DayWeather> weekForecast;

  @override
  String toString() {
    return 'Weather{timeBlocks: $timeBlocks, current: $current, weekForecast: $weekForecast}';
  }
}

class Current {
  late num temp;
  late num humidity;
  late num windSpeed;
  late num pressure;

  Current(
      {required this.pressure,
        required this.humidity,
        required this.temp,
        required this.windSpeed});

  factory Current.fromJson(Map<String, dynamic> json) {
    return Current(
        pressure: json['current']['pressure'].toDouble(),
        humidity: json['current']['humidity'].toDouble(),
        temp: json['current']['temp'].toDouble(),
        windSpeed: json['current']['wind_speed'].toDouble());
  }

  @override
  String toString() {
    return 'Current{temp: $temp, humidity: $humidity, windSpeed: $windSpeed, pressure: $pressure}';
  }
}

class WeatherToTime {
  late num time;
  late String image;
  late num temperature;

  WeatherToTime(
      {required this.time, required this.image, required this.temperature});

  factory WeatherToTime.fromJson(Map<String, dynamic> json) {
    return WeatherToTime(
        time: json['dt'],
        image: json['weather'][0]['main'],
        temperature: json['temp']);
  }

  @override
  String toString() {
    return 'WeatherToTime{time: $time, image: $image, temperature: $temperature}';
  }
}

class DayWeather {
  late num day;
  late String image;
  late num maxTemperature;
  late num minTemperature;
  late num speed;
  late num humidity;
  late num pressure;

  DayWeather(
      {required this.day,
        required this.image,
        required this.maxTemperature,
        required this.minTemperature,
        required this.speed,
        required this.humidity,
        required this.pressure});

  factory DayWeather.fromJson(Map<String, dynamic> json) {
    return DayWeather(
        day: json['dt'],
        image: json['weather'][0]['main'],
        minTemperature: json['temp']['min'],
        maxTemperature: json['temp']['max'],
        speed: json['wind_speed'],
        humidity: json['humidity'],
        pressure: json['pressure']);
  }

  @override
  String toString() {
    return 'DayWeather{day: $day, image: $image, maxTemperature: $maxTemperature, minTemperature: $minTemperature, speed: $speed, humidity: $humidity, pressure: $pressure}';
  }
}

class Place{
  late String name;
  late String lng;
  late String lat;

  Place(this.name, this.lng, this.lat);

  @override
  String toString() {
    return 'Place{lng: $lng, lat: $lat}';
  }
}
