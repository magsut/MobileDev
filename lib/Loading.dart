import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'Constants.dart';
import 'Params.dart';

class Load extends StatelessWidget {
  const Load({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Params.theme ? LightTheme.mainColor : DarkTheme.mainColor,
          ),
          Column(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 125),
                  child: Text(
                    "Weather App",
                    style: TextStyle(
                      color: Params.theme ? LightTheme.textColor : DarkTheme.textColor,
                      fontSize: 35
                    ),
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 125),
                  child: SpinKitRing(
                    color: Params.theme ? LightTheme.textColor : DarkTheme.textColor,
                    size: 42,
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
