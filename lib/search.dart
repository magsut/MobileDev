import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_app/ApiFunc.dart';
import 'package:flutter_app/Params.dart';
import 'package:flutter_app/Weather.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class SearchPage extends StatefulWidget {
  SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<SearchPlace> sPlaces = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE2EBFF),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 28.5, top: 16),
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
                  Container(
                    width: MediaQuery.of(context).size.width * 0.7,
                    height: 30,
                    child: Neumorphic(
                      child: TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Введите населенный пункт",
                            fillColor: Colors.black12,
                            filled: true),
                        onSubmitted: (text) async {
                          List<Place> places = await Api.getPlaces(text);
                          setState(() {
                            sPlaces.clear();
                            sPlaces = places
                                .map((element) =>
                                    SearchPlace(place: element.name))
                                .toList();
                          });
                        },
                      ),
                      style: NeumorphicStyle(color: Color(0xffE2EBFF)),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                // height: 300,
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  semanticChildCount: sPlaces.length,
                  children: sPlaces,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SearchPlace extends StatefulWidget {
  final String place;
  SearchPlace({Key? key, required this.place}) : super(key: key);

  @override
  State<SearchPlace> createState() => _SearchPlaceState();
}

class _SearchPlaceState extends State<SearchPlace> {
  var icon = Icons.star_border;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 56,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    widget.place,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: IconButton(
                    onPressed: () async {
                      if (icon == Icons.star_border) {
                        Place newFavoritePlace = await Api.getPos(widget.place);
                        Params.favoritePlace.add(newFavoritePlace);
                        setState(() {
                          icon = Icons.star;
                        });
                      } else {
                        Params.favoritePlace.removeWhere(
                            (element) => element.name == widget.place);
                        setState(() {
                          icon = Icons.star_border;
                        });
                      }
                    },
                    icon: Icon(icon),
                  ),
                )
              ],
            ),
          ),
          Divider(
            height: 4,
          ),
        ],
      ),
    );
  }
}
