import 'dart:developer';
import 'package:expandable_bottom_sheet/expandable_bottom_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/aboutApp.dart';
import 'package:flutter_app/favorites.dart';
import 'package:flutter_app/search.dart';
import 'package:flutter_app/settings.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'dart:math' hide log;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool barOpen = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        canvasColor: Color(0xFFE2EBFF),
      ),
      home: Scaffold(
        drawer: Drawer(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.only(top : 32, left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Weather app',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 27,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 42),
                    height: 160,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MenuBarWidget(i: Icons.settings, title: 'Настройки',page:  SettingsPage()),
                        MenuBarWidget(i: Icons.favorite_outline, title: 'Избранное',page: Favorites(),),
                        MenuBarWidget(i: Icons.account_circle_outlined, title: 'О приложении',page: AboutApp(),),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        body: Builder(builder: (context) {
          return Stack(children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              child: Image(
                image: AssetImage('assets/fone1.png'),
                fit: BoxFit.fill,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AnimatedPadding(
                  duration: Duration(milliseconds: 500),
                  padding: const EdgeInsets.only(left: 8, top: 20.0, right: 8),
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
                                depth: 8,
                                lightSource: LightSource.topLeft,
                                color: Colors.transparent,
                              ),
                              child: NeumorphicIcon(
                                Icons.menu,
                                size: 30,
                              )),
                          Column(
                            children: [
                              Visibility(
                                visible: barOpen,
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 12.0),
                                  child: Text(
                                    'Санкт-Петербург',
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
                                  '10˚c',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 70,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          NeumorphicButton(
                            onPressed: () {Navigator.of(context).push(MaterialPageRoute(builder: (_) => SearchPage()));},
                            style: NeumorphicStyle(
                              shape: NeumorphicShape.flat,
                              boxShape: NeumorphicBoxShape.circle(),
                              depth: 8,
                              lightSource: LightSource.topLeft,
                              color: Colors.transparent,
                            ),
                            child: NeumorphicIcon(
                              Icons.add_circle_outline,
                              size: 30,
                            ),
                          ),
                        ],
                      ),
                      Visibility(
                        visible: !barOpen,
                        child: Text(
                          '16 октября 2021',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Visibility(
                        visible: barOpen,
                        child: Text(
                          '10˚c',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 70,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                LimitedBox(
                  maxHeight: MediaQuery.of(context).size.height * .7 + 40,
                  child: ExpandableBottomSheet(
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
                      persistentContentHeight: 250,
                      persistentHeader: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                          color: Color(0xFFE2EBFF),
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
                                    ),
                                  ),
                                  Visibility(
                                    visible: barOpen,
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 6.0),
                                      child: Icon(
                                        Icons.arrow_drop_down_outlined,
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
                          color: Color(0xFFE2EBFF),
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * .7,
                        ),
                        Column(
                          children: [
                            Visibility(
                              visible: barOpen,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  '16 октября 2021',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 17,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(29.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  TimeBlock(
                                      time: '06:00',
                                      image: 'assets/sun.png',
                                      temperature: '10'),
                                  TimeBlock(
                                      time: '12:00',
                                      image: 'assets/sun.png',
                                      temperature: '12'),
                                  TimeBlock(
                                      time: '18:00',
                                      image: 'assets/sun.png',
                                      temperature: '14'),
                                  TimeBlock(
                                      time: '00:00',
                                      image: 'assets/sun.png',
                                      temperature: '11'),
                                ],
                              ),
                            ),
                            Visibility(
                              visible: !barOpen,
                              child: Container(
                                width: 161,
                                height: 35,
                                child: Center(
                                  child: RaisedButton(
                                    onPressed: () {},
                                    child: Text(
                                      "Прогноз на неделю",
                                      style: TextStyle(
                                        color: Color(0xff038CFE),
                                        fontSize: 14,
                                      ),
                                    ),
                                    color: Color(0xFFEAF0FF),
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          new BorderRadius.circular(10.0),
                                      side:
                                          BorderSide(color: Color(0xFF038CFE)),
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Neumorphic(
                                            child: Container(
                                              width: 150,
                                              height: 65,
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 52.0),
                                                child: Row(children: [
                                                  Container(
                                                    width: 12,
                                                    height: 24,
                                                    child: NeumorphicIcon(
                                                      Icons.thermostat_sharp,
                                                      style: NeumorphicStyle(
                                                        color:
                                                            Color(0xff5A5A5A),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 5)),
                                                  Text(
                                                    '8',
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
                                            ),
                                            style: NeumorphicStyle(
                                              color: Colors.transparent,
                                            ),
                                          ),
                                          Neumorphic(
                                            child: Container(
                                              width: 150,
                                              height: 65,
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 42.0),
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
                                                  Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 5)),
                                                  Text(
                                                    '87',
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
                                            ),
                                            style: NeumorphicStyle(
                                              color: Colors.transparent,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 29.0, right: 29.0, top: 15),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Neumorphic(
                                            child: Container(
                                              width: 150,
                                              height: 65,
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 38.0),
                                                child: Row(children: [
                                                  Container(
                                                    width: 19,
                                                    height: 24,
                                                    child: NeumorphicIcon(
                                                      Icons.air,
                                                      style: NeumorphicStyle(
                                                        color:
                                                            Color(0xff5A5A5A),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 5)),
                                                  Text(
                                                    '9',
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
                                            ),
                                            style: NeumorphicStyle(
                                              color: Colors.transparent,
                                            ),
                                          ),
                                          Neumorphic(
                                            child: Container(
                                              width: 150,
                                              height: 65,
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 15.0),
                                                child: Row(children: [
                                                  Container(
                                                    width: 19,
                                                    height: 24,
                                                    child: NeumorphicIcon(
                                                      Icons.speed,
                                                      style: NeumorphicStyle(
                                                        color:
                                                            Color(0xff5A5A5A),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 5)),
                                                  Text(
                                                    '761',
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
                                            ),
                                            style: NeumorphicStyle(
                                              color: Colors.transparent,
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
                      background: Container()),
                )
              ],
            )
          ]);
        }),
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
    required this.title, required this.page,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(this.i),
        Padding(
            padding: EdgeInsets.only(left: 20.5),
          child: GestureDetector(
            onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (_) => page));},
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

  const TimeBlock({Key? key, required this.time, required this.image, required this.temperature}) : super(key: key);

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
                color: Colors.black,
                fontSize: 16,
              ),
            ),
            Container(
              height: 40,
              width: 40,
              child: Image(
                image: AssetImage(image),
              ),
            ),
            Text(
              "$temperature˚c",
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
      style: NeumorphicStyle(
        color: Colors.transparent,
      ),
    );
  }
}
