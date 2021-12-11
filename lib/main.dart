import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Loading.dart';
import 'package:flutter_app/MainPage.dart';
import 'package:flutter_app/Params.dart';
import 'package:flutter_app/SaveFunc.dart';
import 'package:flutter_app/aboutApp.dart';
import 'package:flutter_app/favorites.dart';
import 'package:flutter_app/settings.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'ApiFunc.dart';
import 'Weather.dart';

void main() {
  initializeDateFormatting('ru', null);
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
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        canvasColor: Color(0xFFE2EBFF),
      ),
      darkTheme: ThemeData(
        canvasColor: Color(0xff0C172B)
      ),
      home: Scaffold(
        drawer: Drawer(
          child: SafeArea(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.only(top: 10, left: 20),
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
                          MenuBarWidget(
                            i: Icons.settings,
                            title: 'Настройки',
                            page: SettingsPage(callback: setState),
                          ),
                          MenuBarWidget(
                            i: Icons.favorite_outline,
                            title: 'Избранное',
                            page: Favorites(callback: setState),
                          ),
                          MenuBarWidget(
                            i: Icons.account_circle_outlined,
                            title: 'О приложении',
                            page: AboutApp(callback: () {} ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        body: Builder(
          builder: (context) {
            Func.getParamsFromSharedPref();
            return FutureBuilder(
                  future: Api.getWeather(Params.selectedPlace.lat, Params.selectedPlace.lng),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return Builder(builder: (context) {
                        Params.weather = snapshot.data as Weather;
                        return mainPage();
                      });
                    } else {
                      return Load();
                    }
                  },
                );
          }
        ),
      ),
    );
  }
}


