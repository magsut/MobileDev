import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class Favorites extends StatelessWidget {
  const Favorites({Key? key}) : super(key: key);

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
                      padding: const EdgeInsets.only(left : 33.0),
                      child: Text(
                        'Избранное',
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
            ],
          )
        ],
      ),
    );
  }
}
