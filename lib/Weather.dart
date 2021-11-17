class Weather {
  late List<WeatherToTime> timeBlocks;
  late Current current;
  late List<DayWeather> weekForecast;
}

class Current {
  late double temp;
  late int humidity;
  late int windSpeed;
  late int pressure;

  Current(
      {required this.pressure,
      required this.humidity,
      required this.temp,
      required this.windSpeed});

  factory Current.fromJson(Map<String, dynamic> json) {
    return Current(
        pressure: json['current']['pressure'],
        humidity: json['current']['humidity'],
        temp: json['current']['temp'],
        windSpeed: json['current']['wind_speed']);
  }
}

class WeatherToTime {
  late String time;
  late String image;
  late String temperature;

  WeatherToTime(
      {required this.time, required this.image, required this.temperature});

  factory WeatherToTime.fromJson(Map<String, dynamic> json) {
    return WeatherToTime(
        time: json['dt'],
        image: json['weather']['main'],
        temperature: json['temp']);
  }
}

class DayWeather {
  late String day;
  late String image;
  late int maxTemperature;
  late int minTemperature;
  late int speed;
  late int humidity;
  late int pressure;

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
        image: json['weather']['main'],
        minTemperature: json['temp']['min'],
        maxTemperature: json['temp']['max'],
        speed: json['wind_speed'],
        humidity: json['humidity'],
        pressure: json['pressure']);
  }
}
