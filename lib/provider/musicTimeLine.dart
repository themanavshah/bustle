import 'package:flutter/material.dart';

class MusicTimeLine extends ChangeNotifier {
  var time = 452;
  var timeSpent = 0;
  var second = 1;
  var isPlaying = false;

  incrementTime() {
    if (timeSpent != time && isPlaying != false) timeSpent++;
    if (timeSpent == time) isPlaying = false;
    notifyListeners();
  }
}
