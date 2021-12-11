import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_app/Params.dart';
import 'package:flutter_app/Weather.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import 'Constants.dart';
import 'SaveFunc.dart';

class Favorites extends StatefulWidget {
  const Favorites({Key? key, required this.callback}) : super(key: key);

  final Function callback;

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Params.theme ? LightTheme.mainColor : DarkTheme.mainColor,
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
                      widget.callback(() {});
                      Func.saveParamsToSharedPref();
                      Navigator.of(context).pop();
                    },
                    child: NeumorphicIcon(
                      Icons.arrow_back_ios_outlined,
                      size: 15,
                      style: NeumorphicStyle(
                        color: Params.theme ? LightTheme.textColor : DarkTheme.textColor,
                      ),
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
                      'Избранное',
                      style: TextStyle(
                        color: Params.theme ? LightTheme.textColor : DarkTheme.textColor,
                        fontSize: 25,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                // height: 300,
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) =>
                      FavoritePlace(
                    key: ValueKey(Params.favoritePlace[index].name),
                    place: Params.favoritePlace[index],
                    callback: () {
                      setState(() {
                        Params.favoritePlace
                            .remove(Params.favoritePlace[index]);
                      });
                    },
                  ),
                  itemCount: Params.favoritePlace.length,
                  semanticChildCount: Params.favoritePlace.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FavoritePlace extends StatelessWidget {
  final Place place;
  final Function callback;

  const FavoritePlace({Key? key, required this.place, required this.callback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
        child: GestureDetector(
          onTap: () {
            log(place.toString());
            Params.selectedPlace = place;
          },
          child: Neumorphic(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Center(
                    child: Text(
                      place.name,
                      style: TextStyle(
                        fontSize: 13,
                        color: Params.theme ? LightTheme.textColor : DarkTheme.textColor,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  child: NeumorphicButton(
                    onPressed: () {
                      callback();
                    },
                    child: Center(
                      child: Icon(
                        Icons.close,
                        size: 13,
                        color: Params.theme ? LightTheme.iconsColor : DarkTheme.iconsColor,
                      ),
                    ),
                    style: NeumorphicStyle(
                      shape: NeumorphicShape.concave,
                      depth: 1,
                      color: Params.theme ? Color(0xffC8DAFF): Color(0xff152A53),
                      boxShape: NeumorphicBoxShape.roundRect(
                          BorderRadius.circular(15)),
                    ),
                  ),
                )
              ],
            ),
            style: NeumorphicStyle(
                shape: NeumorphicShape.flat,
                depth: -2,
                boxShape:
                    NeumorphicBoxShape.roundRect(BorderRadius.circular(15)),
                color: Colors.transparent,
                lightSource: LightSource.top),
          ),
        ),
      ),
    );
  }
}
