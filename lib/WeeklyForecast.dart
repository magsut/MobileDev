import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import 'DayForecast.dart';

class WeeklyForecast extends StatelessWidget {
  const WeeklyForecast({Key? key, required this.days}) : super(key: key);

  final List<DayForecast> days;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE2EBFF),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Center(
                child: Text(
                  "Прогноз на неделю",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 32),
              child: Container(
                width: 320,
                height: 387,
                child: Swiper(
                  itemWidth: 320,
                  itemBuilder: (BuildContext context, int index) {
                    return days[index];
                  },
                  itemCount: days.length,
                  layout: SwiperLayout.STACK,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: RaisedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  "Вернуться на главную",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                ),
                color: Color(0xFFEAF0FF),
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(10.0),
                  side: BorderSide(color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
