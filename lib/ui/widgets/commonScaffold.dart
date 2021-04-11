import 'dart:async';
import 'dart:ui';

import 'package:beats/provider/musicTimeLine.dart';
import 'package:beats/ui/pages/dashboardPage.dart';
import 'package:beats/oldWidget/bottomWidget.dart';
import 'package:beats/ui/pages/explorePage.dart';
import 'package:beats/ui/pages/profilePage.dart';
import 'package:beats/ui/widgets/bottomWidget.dart';
import 'package:swipedetector/swipedetector.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provider/bottomController.dart';
import 'musicPlayerScreen.dart';

class CommonScaffold extends StatefulWidget {
  @override
  _CommonScaffoldState createState() => _CommonScaffoldState();
}

class _CommonScaffoldState extends State<CommonScaffold>
    with TickerProviderStateMixin {
  AnimationController rotationController;
  var blurHeight = 180;

  @override
  void initState() {
    var musicTimeLine = Provider.of<MusicTimeLine>(context, listen: false);
    Timer.periodic(Duration(seconds: 1), (timer) {
      musicTimeLine.incrementTime();
    });
    rotationController = new AnimationController(
      vsync: this,
      duration: new Duration(milliseconds: 5000),
    );
    rotationController.forward();
    rotationController.addListener(() {
      setState(() {
        if (rotationController.status == AnimationStatus.completed) {
          rotationController.repeat();
        }
        if (musicTimeLine.timeSpent == musicTimeLine.time) {
          rotationController.stop();
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var musicTimeLine2 = Provider.of<MusicTimeLine>(context, listen: false);
    final controller = Provider.of<BottomController>(context);
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          if (controller.pageSelected == 0)
            Dashboard(musicTimeLine: musicTimeLine2, controller: controller),
          if (controller.pageSelected == 1) Explore(),
          if (controller.pageSelected == 2) Profile(),
          // BottomNavigator(
          //   musicTimeLine: musicTimeLine2,
          //   controller: controller,
          // )
        ],
      ),
    );
  }
}
