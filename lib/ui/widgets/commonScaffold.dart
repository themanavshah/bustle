import 'dart:async';
import 'dart:ui';

import 'package:beats/provider/musicTimeLine.dart';
import 'package:beats/ui/pages/dashboardPage.dart';
import 'package:beats/oldWidget/bottomWidget.dart';
import 'package:beats/ui/pages/explorePage.dart';
import 'package:beats/ui/pages/profilePage.dart';
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Stack(children: [
              Positioned(
                bottom: 0,
                left: 0,
                height: double.parse("$blurHeight"),
                width: MediaQuery.of(context).size.width - 50,
                child: SwipeDetector(
                  onSwipeDown: () {
                    if (blurHeight >= 600) {
                      setState(() {
                        blurHeight = 180;
                      });
                    } else {
                      print("extend");
                    }
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50)),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.1),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50),
                              topRight: Radius.circular(50),
                            )),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 40,
                left: 23,
                child: Row(
                  children: [
                    SizedBox(height: 30),
                    Container(
                      height: 65,
                      width: MediaQuery.of(context).size.width - 100,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Consumer<BottomController>(
                            builder: (ctx, data, ch) {
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    print("Home");
                                    data.pageSelected = 0;
                                    blurHeight = 180;
                                  });
                                },
                                child: Icon(Icons.home,
                                    color: data.pageSelected == 0
                                        ? Color(0xFFF89E63)
                                        : Colors.white),
                              );
                            },
                          ),
                          Consumer<BottomController>(
                            builder: (ctx, data, ch) {
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    data.pageSelected = 1;
                                    print("Explore");
                                  });
                                },
                                child: Icon(Icons.explore,
                                    color: data.pageSelected == 1
                                        ? Color(0xFFF89E63)
                                        : Colors.white),
                              );
                            },
                          ),
                          Consumer<BottomController>(
                            builder: (ctx, data, ch) {
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    print("profile");
                                    data.pageSelected = 2;
                                  });
                                },
                                child: Icon(Icons.person,
                                    color: data.pageSelected == 2
                                        ? Color(0xFFF89E63)
                                        : Colors.white),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              blurHeight > 600
                  ? SwipeDetector(
                      onSwipeDown: () {
                        setState(() {
                          blurHeight = 180;
                        });
                      },
                      child: MusicPlayerScreen())
                  : Positioned(
                      bottom: 90,
                      left: 30,
                      child: Container(
                        height: 100,
                        width: MediaQuery.of(context).size.width - 105,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  blurHeight = 880;
                                });
                                print("Will extend.");
                              },
                              child: Row(
                                children: [
                                  RotationTransition(
                                    turns: Tween(begin: 0.0, end: 1.0)
                                        .animate(rotationController),
                                    child: CircleAvatar(
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Image.asset(
                                            "assets/images/trap.png"),
                                      ),
                                      radius: 20,
                                      backgroundColor: Colors.red,
                                    ),
                                  ),
                                  SizedBox(width: 20),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 27.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Insomania",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 22,
                                          ),
                                        ),
                                        Text(
                                          "value beats",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Consumer<MusicTimeLine>(
                                  builder: (ctx, data, ch) {
                                    return IconButton(
                                        icon: Icon(
                                          Icons.speaker_rounded,
                                          size: 25,
                                          color: Colors.white.withOpacity(0.5),
                                        ),
                                        onPressed: () {
                                          print("play in diffrent device?");
                                        });
                                  },
                                ),
                                Consumer<MusicTimeLine>(
                                  builder: (ctx, data, ch) {
                                    return IconButton(
                                        icon: Icon(
                                          data.isPlaying
                                              ? Icons.pause
                                              : Icons.play_arrow_rounded,
                                          color: Colors.white,
                                          size: data.isPlaying ? 35 : 30,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            if (data.isPlaying)
                                              rotationController.stop();
                                            else
                                              rotationController.repeat();
                                            data.isPlaying = !data.isPlaying;
                                          });
                                          print("play/pause");
                                        });
                                  },
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    )
            ]),
          ),
        ],
      ),
    );
  }
}
