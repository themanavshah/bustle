import 'package:flutter/material.dart';

class YourGenre {
  String name;

  YourGenre({this.name});
}

List<Color> colorsy = [
  Colors.amber,
  Colors.blueAccent,
  Colors.greenAccent,
  Colors.indigoAccent,
];

List<YourGenre> yourGenreList = [
  YourGenre(
    name: "Trap",
  ),
  YourGenre(
    name: "Chill Wave",
  ),
  YourGenre(
    name: "Lo-Fi",
  ),
  YourGenre(
    name: "Cloud Rap",
  ),
];
