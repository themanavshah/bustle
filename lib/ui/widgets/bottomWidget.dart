import 'dart:ui';

import 'package:beats/provider/bottomController.dart';
import 'package:beats/provider/musicTimeLine.dart';
import 'package:swipedetector/swipedetector.dart';
import 'package:flutter/material.dart';

import 'musicPlayerScreen.dart';

class BottomNavigator extends StatefulWidget {
  MusicTimeLine musicTimeLine;
  BottomController controller;

  BottomNavigator({
    this.musicTimeLine,
    this.controller,
  });

  @override
  _BottomNavigatorState createState() => _BottomNavigatorState();
}

class _BottomNavigatorState extends State<BottomNavigator>
    with TickerProviderStateMixin {
  AnimationController rotationController;
  var blurHeight = 180;

  @override
  void initState() {
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
        if (!widget.musicTimeLine.isPlaying) {
          rotationController.stop();
        }
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    rotationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 50.0,
        left: 25,
        right: 25,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0.0),
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
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            print("Home");
                            widget.controller.pageSelected = 0;
                            blurHeight = 180;
                          });
                        },
                        child: Icon(Icons.home,
                            color: widget.controller.pageSelected == 0
                                ? Color(0xFFF89E63)
                                : Colors.white),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            widget.controller.pageSelected = 1;
                            print("Explore");
                          });
                        },
                        child: Icon(Icons.explore,
                            color: widget.controller.pageSelected == 1
                                ? Color(0xFFF89E63)
                                : Colors.white),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            print("profile");
                            widget.controller.pageSelected = 2;
                          });
                        },
                        child: Icon(Icons.person,
                            color: widget.controller.pageSelected == 2
                                ? Color(0xFFF89E63)
                                : Colors.white),
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
                  child: MusicPlayerScreen(
                    musicTimeLine: widget.musicTimeLine,
                    controller: widget.controller,
                  ))
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
                                    child:
                                        Image.asset("assets/images/trap.png"),
                                  ),
                                  radius: 20,
                                  backgroundColor: Colors.red,
                                ),
                              ),
                              SizedBox(width: 20),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 27.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                            IconButton(
                                icon: Icon(
                                  Icons.speaker_rounded,
                                  size: 25,
                                  color: Colors.white.withOpacity(0.5),
                                ),
                                onPressed: () {
                                  print("play in diffrent device?");
                                }),
                            IconButton(
                                icon: Icon(
                                  widget.musicTimeLine.isPlaying
                                      ? Icons.pause
                                      : Icons.play_arrow_rounded,
                                  color: Colors.white,
                                  size:
                                      widget.musicTimeLine.isPlaying ? 35 : 30,
                                ),
                                onPressed: () {
                                  setState(() {
                                    if (widget.musicTimeLine.isPlaying)
                                      rotationController.stop();
                                    else
                                      rotationController.repeat();
                                    widget.musicTimeLine.isPlaying =
                                        !widget.musicTimeLine.isPlaying;
                                  });
                                  print("play/pause");
                                })
                          ],
                        )
                      ],
                    ),
                  ),
                )
        ]),
      ),
    );
  }
}
