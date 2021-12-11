import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Constants.dart';
import 'Params.dart';

class DayForecast extends StatelessWidget {
  const DayForecast(
      {Key? key,
        required this.day,
        required this.image,
        required this.temperature,
        required this.speed,
        required this.humidity,
        required this.pressure})
      : super(key: key);

  final String day;
  final String image;
  final int temperature;
  final int speed;
  final int humidity;
  final int pressure;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      height: 387,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: Params.theme ? LightTheme.gradient : DarkTheme.gradient,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16, left: 16),
            child: Text(
              day,
              style: TextStyle(
                fontSize: 24,
                color: Params.theme ? LightTheme.textColor : DarkTheme.textColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16, left: 16),
            child: Container(
              height: 76,
              width: 85,
              child: Image(
                image: AssetImage(image),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 44, left: 22),
            child: Row(children: [
              Container(
                width: 12,
                height: 24,
                child: Icon(
                  Icons.thermostat_sharp,
                  color: Params.theme ? LightTheme.iconsColor : DarkTheme.iconsColor,
                ),
              ),
              Padding(padding: EdgeInsets.only(left: 5)),
              Text(
                temperature.toString(),
                style: TextStyle(
                  color: Params.theme ? LightTheme.textColor : DarkTheme.textColor,
                  fontSize: 16,
                ),
              ),
              Text(
                Params.temp ? "˚c" : "˚f",
                style: TextStyle(
                  color: Params.theme ? LightTheme.iconsColor : DarkTheme.iconsColor,
                  fontSize: 16,
                ),
              ),
            ]),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 28, left: 22),
            child: Row(children: [
              Container(
                width: 19,
                height: 24,
                child: Icon(
                  Icons.air,
                  color: Params.theme ? LightTheme.iconsColor : DarkTheme.iconsColor,
                ),
              ),
              Padding(padding: EdgeInsets.only(left: 5)),
              Text(
                Params.speed ? speed.toString() : (speed * 3.6).toInt().toString(),
                style: TextStyle(
                  color: Params.theme ? LightTheme.textColor : DarkTheme.textColor,
                  fontSize: 16,
                ),
              ),
              Text(
                Params.speed ? 'м/с' : 'км/ч',
                style: TextStyle(
                  color: Params.theme ? LightTheme.iconsColor : DarkTheme.iconsColor,
                  fontSize: 16,
                ),
              ),
            ]),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 28, left: 22),
            child: Row(children: [
              Container(
                width: 19,
                height: 24,
                child: Image(
                  image: AssetImage(
                    'assets/drop.png',
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(left: 5)),
              Text(
                humidity.toString(),
                style: TextStyle(
                  color: Params.theme ? LightTheme.textColor : DarkTheme.textColor,
                  fontSize: 16,
                ),
              ),
              Text(
                '%',
                style: TextStyle(
                  color: Params.theme ? LightTheme.iconsColor : DarkTheme.iconsColor,
                  fontSize: 16,
                ),
              ),
            ]),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 28, left: 22),
            child: Row(children: [
              Container(
                width: 19,
                height: 24,
                child: Icon(
                  Icons.speed,
                  color: Params.theme ? LightTheme.iconsColor : DarkTheme.iconsColor,
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(
                      left: 5)),
              Text(
                Params.pressure ? pressure.toString() : (pressure ~/ 0.75).toString(),
                style: TextStyle(
                  color: Params.theme ? LightTheme.textColor : DarkTheme.textColor,
                  fontSize: 16,
                ),
              ),
              Text(
                Params.pressure ? 'мм.рт.ст' : 'гПа',
                style: TextStyle(
                  color: Params.theme ? LightTheme.iconsColor : DarkTheme.iconsColor,
                  fontSize: 16,
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}