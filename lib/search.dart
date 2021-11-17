import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

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
          Padding(
            padding: const EdgeInsets.only(left: 28.5, top: 38.5),
            child: Row(
              children: [
                NeumorphicButton(
                  onPressed: () {Navigator.of(context).pop();},
                  child: NeumorphicIcon(
                    Icons.arrow_back_ios_outlined,
                    size: 15,
                    style: NeumorphicStyle(
                      color: Colors.black
                    ),
                  ),
                  style: NeumorphicStyle(
                    shape: NeumorphicShape.flat,
                    boxShape: NeumorphicBoxShape.circle(),
                    depth: 8,
                    lightSource: LightSource.topLeft,
                    color: Colors.transparent,
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  height: 30,
                  child: Neumorphic(
                    child: TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Введите населенный пункт",
                            fillColor: Colors.black12,
                            filled: true
                        ),
                    ),
                    style: NeumorphicStyle(
                        color : Color(0xffE2EBFF)
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
