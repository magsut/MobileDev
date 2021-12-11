import 'package:flutter/material.dart';
import 'package:flutter_app/Constants.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import 'Params.dart';

class AboutApp extends StatelessWidget {
  final Function callback;

  const AboutApp({Key? key, required this.callback}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Params.theme ? LightTheme.mainColor : DarkTheme.mainColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 28.5, top: 10),
                  child: Row(
                    children: [
                      NeumorphicButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: NeumorphicIcon(
                          Icons.arrow_back_ios_outlined,
                          size: 15,
                          style: NeumorphicStyle(
                              color: Params.theme
                                  ? LightTheme.textColor
                                  : DarkTheme.textColor),
                        ),
                        style: NeumorphicStyle(
                          shape: NeumorphicShape.flat,
                          boxShape: NeumorphicBoxShape.circle(),
                          depth: 2,
                          lightSource: LightSource.topLeft,
                          color: Colors.transparent,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 33.0),
                        child: Text(
                          'О разработчике',
                          style: TextStyle(
                            color: Params.theme
                                ? LightTheme.textColor
                                : DarkTheme.textColor,
                            fontSize: 25,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 80),
                  child: Center(
                    child: Neumorphic(
                      child: Container(
                        width: 224,
                        height: 52,
                        color: Colors.transparent,
                        child: Center(
                          child: Text(
                            'Weather app',
                            style: TextStyle(
                              color: Params.theme
                                  ? LightTheme.textColor
                                  : DarkTheme.textColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            ),
                          ),
                        ),
                      ),
                      style: NeumorphicStyle(
                        depth: -2,
                        color: Colors.transparent,
                        boxShape: NeumorphicBoxShape.roundRect(
                            BorderRadius.circular(15)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Neumorphic(
              child: Container(
                height: 346,
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 23),
                        child: Text(
                          "By Mazut",
                          style: TextStyle(
                            color: Params.theme
                                ? LightTheme.textColor
                                : DarkTheme.textColor,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Text(
                          "from ITMO University",
                          style: TextStyle(
                            color: Params.theme
                                ? LightTheme.textColor
                                : DarkTheme.textColor,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Text(
                          "Версия 1.0",
                          style: TextStyle(
                            color: Params.theme
                                ? LightTheme.textColor
                                : DarkTheme.textColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Text(
                          "от 30 сентября 2021",
                          style: TextStyle(
                            color: Params.theme
                                ? LightTheme.textColor
                                : DarkTheme.textColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 200),
                        child: Text(
                          "2021",
                          style: TextStyle(
                              color: Params.theme ? LightTheme.textColor : DarkTheme.textColor,
                              fontSize: 10),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              style: NeumorphicStyle(
                depth: 2,
                color: Colors.transparent,
                lightSource: LightSource.bottom,
                boxShape: NeumorphicBoxShape.roundRect(
                  BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
