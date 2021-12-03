import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

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
            color: Color(0xffE2EBFF),
          ),
          Column(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 125),
                  child: Text(
                    "Weather App",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 35
                    ),
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 125),
                  child: SpinKitRing(
                    color: Colors.black,
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
