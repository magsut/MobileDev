import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_app/Params.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class SettingsPage extends StatefulWidget {

  final Function callback;

  const SettingsPage({Key? key, required this.callback}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE2EBFF),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                      'Настройки',
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
              padding: const EdgeInsets.only(top: 32.0, left: 20),
              child: Text(
                'Единицы измерения',
                style: TextStyle(
                  color: Color(0xff828282),
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Neumorphic(
                child: Container(
                  width: double.infinity,
                  height: 200,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 16, left: 20, right: 20),
                        child: SettingsRow(
                          title: 'Температура',
                          fParam: '˚C',
                          sParam: '˚F',
                        ),
                      ),
                      Divider(
                        height: 3,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: SettingsRow(
                          title: 'Сила ветра',
                          fParam: 'м/с',
                          sParam: 'км/ч',
                        ),
                      ),
                      Divider(
                        height: 3,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            bottom: 16, left: 20, right: 20),
                        child: SettingsRow(
                          title: 'Давление',
                          fParam: 'мм.рт.ст',
                          sParam: 'гПа',
                        ),
                      ),
                    ],
                  ),
                ),
                style: NeumorphicStyle(
                  shape: NeumorphicShape.concave,
                  boxShape:
                      NeumorphicBoxShape.roundRect(BorderRadius.circular(30)),
                  depth: 8,
                  lightSource: LightSource.topLeft,
                  color: Colors.transparent,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SettingsRow extends StatelessWidget {
  final String title;
  final String fParam;
  final String sParam;

  const SettingsRow({
    Key? key,
    required this.title,
    required this.fParam,
    required this.sParam,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.normal,
          ),
        ),
        Toggle(
          fParam: fParam,
          sParam: sParam,
          title: title,
        ),
      ],
    );
  }
}

class Toggle extends StatefulWidget {
  final String fParam;
  final String sParam;
  String title;

  Toggle({Key? key, required this.fParam, required this.sParam, required this.title})
      : super(key: key);

  @override
  State<Toggle> createState() => _ToggleState();
}

class _ToggleState extends State<Toggle> {
  String fParam = '';
  String sParam = '';
  String title = '';
  var selected = 0;

  @override
  void initState() {
    title = widget.title;

    switch(title){
      case 'Температура':
        selected = Params.temp ? 0 : 1;
        break;
      case 'Сила ветра':
        selected = Params.speed ? 0 : 1;
        break;
      case 'Давление' :
        selected = Params.pressure ? 0 : 1;
    }

    fParam = widget.fParam;
    sParam = widget.sParam;
  }


  @override
  Widget build(BuildContext context) {
    log('$fParam $sParam', name: 'toggle_state');
    return LimitedBox(
      maxWidth: 122,
      child: NeumorphicToggle(
        onChanged: (val) {
          setState(() {
            selected = val;
            switch(title){
              case 'Температура':
                if(val == 0)
                  Params.temp = true;
                else
                  Params.temp = false;
                break;
              case 'Сила ветра':
                if(val == 0)
                  Params.speed = true;
                else
                  Params.speed = false;
                break;
              case 'Давление' :
                if(val == 0)
                  Params.pressure = true;
                else
                  Params.pressure = false;
            }
          });
        },
        selectedIndex: selected,
        thumb: Container(
          color: Color(0xff4B5F88),
        ),
        children: [
          ToggleElement(
            background: Center(
              child: Text(
                fParam,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                ),
              ),
            ),
            foreground: Center(
              child: Text(
                fParam,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                ),
              ),
            ),
          ),
          ToggleElement(
            background: Center(
              child: Text(
                sParam,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                ),
              ),
            ),
            foreground: Center(
              child: Text(
                sParam,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                ),
              ),
            ),
          ),
        ],
        style: NeumorphicToggleStyle(
          backgroundColor: Colors.transparent,
          depth: 6,
        ),
      ),
    );
  }
}
