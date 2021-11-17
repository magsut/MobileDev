import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

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
          colors: [
            Color(0xFFCDDAF5),
            Color(0xFF9CBCFF),
          ],
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
                color: Colors.black,
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
                  color: Color(0xff5A5A5A),
                ),
              ),
              Padding(padding: EdgeInsets.only(left: 5)),
              Text(
                temperature.toString(),
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
              Text(
                '˚c',
                style: TextStyle(
                  color: Color(0xff5A5A5A),
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
                  color: Color(0xff5A5A5A),
                ),
              ),
              Padding(padding: EdgeInsets.only(left: 5)),
              Text(
                speed.toString(),
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
              Text(
                'м/с',
                style: TextStyle(
                  color: Color(0xff5A5A5A),
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
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
              Text(
                '%',
                style: TextStyle(
                  color: Color(0xff5A5A5A),
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
                  color: Color(0xff5A5A5A),
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(
                      left: 5)),
              Text(
                pressure.toString(),
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
              Text(
                'мм.рт.ст',
                style: TextStyle(
                  color: Color(0xff5A5A5A),
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
