import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class AboutApp extends StatelessWidget {
  const AboutApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Color(0xffE2EBFF),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 28.5, top: 38.5),
                    child: Row(
                      children: [
                        NeumorphicButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: NeumorphicIcon(
                            Icons.arrow_back_ios_outlined,
                            size: 15,
                            style: NeumorphicStyle(color: Colors.black),
                          ),
                          style: NeumorphicStyle(
                            shape: NeumorphicShape.flat,
                            boxShape: NeumorphicBoxShape.circle(),
                            depth: 8,
                            lightSource: LightSource.topLeft,
                            color: Colors.transparent,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 33.0),
                          child: Text(
                            'О разработчике',
                            style: TextStyle(
                              color: Colors.black,
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
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                              ),
                            ),
                          ),
                        ),
                        style: NeumorphicStyle(
                          depth: -5,
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
                              color: Colors.black,
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
                              color: Colors.black,
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
                              color: Colors.black,
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
                              color: Colors.black,
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
                              fontSize: 10
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                style: NeumorphicStyle(
                  depth: 15,
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
          )
        ],
      ),
    );
  }
}
