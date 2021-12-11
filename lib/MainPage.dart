import 'package:expandable_bottom_sheet/expandable_bottom_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Params.dart';
import 'package:flutter_app/WeeklyForecast.dart';
import 'package:flutter_app/search.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:intl/intl.dart';

import 'Constants.dart';
import 'DayForecast.dart';

// ignore: camel_case_types
class mainPage extends StatefulWidget {
  const mainPage({Key? key}) : super(key: key);

  @override
  State<mainPage> createState() => _mainPageState();
}

// ignore: camel_case_types
class _mainPageState extends State<mainPage> {
  bool barOpen = false;
  var date = DateFormat.yMMMMd('ru').format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return LimitedBox(
      maxHeight: MediaQuery.of(context).size.height * .2,
      child: ExpandableBottomSheet(
        background: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              child: Image(
                image: Params.theme ? AssetImage('assets/fone1.png') : AssetImage('assets/fone2.png'),
                fit: BoxFit.fill,
              ),
            ),
            SafeArea(
              child: AnimatedPadding(
                duration: Duration(milliseconds: 500),
                padding: const EdgeInsets.only(left: 8, top: 10, right: 8),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        NeumorphicButton(
                            onPressed: () {
                              Scaffold.of(context).openDrawer();
                            },
                            style: NeumorphicStyle(
                              shape: NeumorphicShape.flat,
                              boxShape: NeumorphicBoxShape.circle(),
                              depth: 2,
                              lightSource: LightSource.topLeft,
                              color: Colors.transparent,
                            ),
                            child: NeumorphicIcon(
                              Icons.menu,
                              size: 30,
                              style: NeumorphicStyle(
                                color: Colors.white,
                              ),
                            )),
                        Column(
                          children: [
                            Visibility(
                              visible: barOpen,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 12.0),
                                child: Text(
                                  Params.selectedPlace.name,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                            Visibility(
                              visible: !barOpen,
                              child: Text(
                                Params.temp
                                    ? Params.weather.current.temp
                                        .toInt()
                                        .toString()
                                    : (Params.weather.current.temp.toInt() *
                                                1.8 +
                                            32)
                                        .toInt()
                                        .toString(),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 70,
                                ),
                              ),
                            ),
                          ],
                        ),
                        NeumorphicButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (_) => SearchPage()));
                          },
                          style: NeumorphicStyle(
                            shape: NeumorphicShape.flat,
                            boxShape: NeumorphicBoxShape.circle(),
                            depth: 2,
                            lightSource: LightSource.topLeft,
                            color: Colors.transparent,
                          ),
                          child: NeumorphicIcon(
                            Icons.add_circle_outline,
                            size: 30,
                            style: NeumorphicStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Visibility(
                      visible: !barOpen,
                      child: Text(
                        date,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Visibility(
                      visible: barOpen,
                      child: Text(
                        Params.temp
                            ? Params.weather.current.temp.toInt().toString()
                            : (Params.weather.current.temp.toInt() * 1.8 + 32)
                                .toInt()
                                .toString(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 70,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        onIsContractedCallback: () {
          setState(() {
            barOpen = false;
          });
          print(barOpen);
        },
        onIsExtendedCallback: () {
          setState(() {
            barOpen = true;
          });
          print(barOpen);
        },
        enableToggle: true,
        persistentContentHeight: 300,
        persistentHeader: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              color: Params.theme ? LightTheme.mainColor : DarkTheme.mainColor,
              ),
          height: 40,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Column(
                children: [
                  Visibility(
                    visible: !barOpen,
                    child: Icon(
                      Icons.arrow_drop_up_outlined,
                      color: Params.theme
                          ? LightTheme.iconsColor
                          : DarkTheme.iconsColor,
                    ),
                  ),
                  Visibility(
                    visible: barOpen,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 6.0),
                      child: Icon(
                        Icons.arrow_drop_down_outlined,
                        color: Params.theme
                            ? LightTheme.iconsColor
                            : DarkTheme.iconsColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        expandableContent: Stack(children: [
          Container(
            color: Params.theme ? LightTheme.mainColor : DarkTheme.mainColor,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * .6,
          ),
          Column(
            children: [
              Visibility(
                visible: barOpen,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    date,
                    style: TextStyle(
                      color: Params.theme
                          ? LightTheme.textColor
                          : DarkTheme.textColor,
                      fontSize: 17,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(29.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TimeBlock(
                        image: Params.weather.timeBlocks[0].image,
                        time: DateFormat.Hm().format(
                            DateTime.fromMillisecondsSinceEpoch(
                                Params.weather.timeBlocks[0].time.toInt() *
                                    1000)),
                        temperature: Params.temp
                            ? Params.weather.timeBlocks[0].temperature
                                .toInt()
                                .toString()
                            : (Params.weather.timeBlocks[0].temperature
                                            .toInt() *
                                        1.8 +
                                    32)
                                .toInt()
                                .toString()),
                    TimeBlock(
                        time: DateFormat.Hm().format(
                            DateTime.fromMillisecondsSinceEpoch(
                                Params.weather.timeBlocks[6].time.toInt() *
                                    1000)),
                        image: Params.weather.timeBlocks[6].image,
                        temperature: Params.temp
                            ? Params.weather.timeBlocks[6].temperature
                                .toInt()
                                .toString()
                            : (Params.weather.timeBlocks[6].temperature
                                            .toInt() *
                                        1.8 +
                                    32)
                                .toInt()
                                .toString()),
                    TimeBlock(
                        time: DateFormat.Hm().format(
                            DateTime.fromMillisecondsSinceEpoch(
                                Params.weather.timeBlocks[12].time.toInt() *
                                    1000)),
                        image: Params.weather.timeBlocks[12].image,
                        temperature: Params.temp
                            ? Params.weather.timeBlocks[12].temperature
                                .toInt()
                                .toString()
                            : (Params.weather.timeBlocks[12].temperature
                                            .toInt() *
                                        1.8 +
                                    32)
                                .toInt()
                                .toString()),
                    TimeBlock(
                        time: DateFormat.Hm().format(
                            DateTime.fromMillisecondsSinceEpoch(
                                Params.weather.timeBlocks[18].time.toInt() *
                                    1000)),
                        image: Params.weather.timeBlocks[18].image,
                        temperature: Params.temp
                            ? Params.weather.timeBlocks[18].temperature
                                .toInt()
                                .toString()
                            : (Params.weather.timeBlocks[18].temperature
                                            .toInt() *
                                        1.8 +
                                    32)
                                .toInt()
                                .toString()),
                  ],
                ),
              ),
              Visibility(
                visible: !barOpen,
                child: Container(
                  height: 35,
                  child: Center(
                    // ignore: deprecated_member_use
                    child: RaisedButton(
                      onPressed: () {
                        List<DayForecast> days = [];
                        for (var day in Params.weather.weekForecast) {
                          days.add(DayForecast(
                              day: DateFormat.MMMMd('ru').format(
                                  DateTime.fromMillisecondsSinceEpoch(
                                      day.day.toInt() * 1000)),
                              image: 'assets/' + day.image + '.png',
                              temperature: Params.temp
                                  ? (day.maxTemperature.toInt() +
                                          day.minTemperature.toInt()) ~/
                                      2
                                  : ((day.maxTemperature.toInt() +
                                                  day.minTemperature.toInt()) ~/
                                              2 *
                                              1.8 +
                                          32)
                                      .toInt(),
                              speed: day.speed.toInt(),
                              humidity: day.humidity.toInt(),
                              pressure: day.pressure.toInt()));
                        }
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => WeeklyForecast(
                                  days: days,
                                )));
                      },
                      child: Text(
                        "Прогноз на неделю",
                        style: TextStyle(
                          color: Params.theme
                              ? LightTheme.textColor
                              : DarkTheme.textColor,
                          fontSize: 14,
                        ),
                      ),
                      color: Params.theme
                          ? Color(0xFFEAF0FF)
                          : Color(0xff0D182C),
                      shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(10.0),
                        side: BorderSide(
                          color: Params.theme
                              ? Color(0xff038CFE)
                              : Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: barOpen,
                child: Container(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 29.0, right: 29.0, top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Neumorphic(
                              child: Container(
                                width: 150,
                                height: 65,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 52.0),
                                  child: Row(children: [
                                    Container(
                                      width: 12,
                                      height: 24,
                                      child: NeumorphicIcon(
                                        Icons.thermostat_sharp,
                                        style: NeumorphicStyle(
                                          color: Params.theme ? LightTheme.iconsColor : DarkTheme.iconsColor,
                                        ),
                                      ),
                                    ),
                                    Padding(padding: EdgeInsets.only(left: 5)),
                                    Text(
                                      Params.temp
                                          ? Params.weather.current.temp
                                              .toInt()
                                              .toString()
                                          : (Params.weather.current.temp
                                                          .toInt() *
                                                      1.8 +
                                                  32)
                                              .toInt()
                                              .toString(),
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
                              ),
                              style: NeumorphicStyle(
                                color: Colors.transparent,
                                depth: 2,
                              ),
                            ),
                            Neumorphic(
                              child: Container(
                                width: 150,
                                height: 65,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 42.0),
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
                                      Params.weather.current.humidity
                                          .toInt()
                                          .toString(),
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
                              ),
                              style: NeumorphicStyle(
                                color: Colors.transparent,
                                depth: 2,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 29.0, right: 29.0, top: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Neumorphic(
                              child: Container(
                                width: 150,
                                height: 65,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 38.0),
                                  child: Row(children: [
                                    Container(
                                      width: 19,
                                      height: 24,
                                      child: NeumorphicIcon(
                                        Icons.air,
                                        style: NeumorphicStyle(
                                          color: Params.theme ? LightTheme.iconsColor : DarkTheme.iconsColor,
                                        ),
                                      ),
                                    ),
                                    Padding(padding: EdgeInsets.only(left: 5)),
                                    Text(
                                      Params.speed
                                          ? Params.weather.current.windSpeed
                                              .toInt()
                                              .toString()
                                          : (Params.weather.current.windSpeed
                                                      .toInt() *
                                                  3.6)
                                              .toInt()
                                              .toString(),
                                      style: TextStyle(
                                        color: Params.theme ? LightTheme.textColor : DarkTheme.textColor,
                                        fontSize: 16,
                                      ),
                                    ),
                                    Text(
                                      Params.speed ? 'м/с' : " км/ч",
                                      style: TextStyle(
                                        color: Params.theme ? LightTheme.iconsColor : DarkTheme.iconsColor,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ]),
                                ),
                              ),
                              style: NeumorphicStyle(
                                color: Colors.transparent,
                                depth: 2,
                              ),
                            ),
                            Neumorphic(
                              child: Container(
                                width: 150,
                                height: 65,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 15.0),
                                  child: Row(children: [
                                    Container(
                                      width: 19,
                                      height: 24,
                                      child: NeumorphicIcon(
                                        Icons.speed,
                                        style: NeumorphicStyle(
                                          color: Params.theme ? LightTheme.iconsColor : DarkTheme.iconsColor,
                                        ),
                                      ),
                                    ),
                                    Padding(padding: EdgeInsets.only(left: 5)),
                                    Text(
                                      Params.pressure
                                          ? Params.weather.current.pressure
                                              .toInt()
                                              .toString()
                                          : (Params.weather.current.pressure
                                                      .toInt() ~/
                                                  0.75)
                                              .toString(),
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
                              ),
                              style: NeumorphicStyle(
                                color: Colors.transparent,
                                depth: 2,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}

class MenuBarWidget extends StatelessWidget {
  final IconData i;
  final String title;
  final Widget page;

  const MenuBarWidget({
    Key? key,
    required this.i,
    required this.title,
    required this.page,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(this.i),
        Padding(
          padding: EdgeInsets.only(left: 20.5),
          child: GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => page));
            },
            child: Text(
              title,
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class TimeBlock extends StatelessWidget {
  final String time;
  final String image;
  final String temperature;

  const TimeBlock(
      {Key? key,
      required this.time,
      required this.image,
      required this.temperature})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Neumorphic(
      child: Container(
        height: 122,
        width: 65,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              time,
              style: TextStyle(
                color: Params.theme ? LightTheme.textColor : DarkTheme.textColor,
                fontSize: 16,
              ),
            ),
            Container(
              height: 40,
              width: 40,
              child: Image(
                image: AssetImage('assets/' + image + '.png'),
              ),
            ),
            Text(
              temperature + (Params.temp ? "˚c" : "˚f"),
              style: TextStyle(
                color: Params.theme ? LightTheme.textColor : DarkTheme.textColor,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
      style: NeumorphicStyle(
        color: Colors.transparent,
        depth: 2,
      ),
    );
  }
}
