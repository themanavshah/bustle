import 'dart:async';
import 'dart:ui';

import 'package:beats/provider/bottomController.dart';
import 'package:beats/provider/musicTimeLine.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swipedetector/swipedetector.dart';

import '../ui/widgets/musicPlayerScreen.dart';

class BottomWidget extends StatefulWidget {
  @override
  _BottomWidgetState createState() => _BottomWidgetState();
}

class _BottomWidgetState extends State<BottomWidget> {
  var _isSelected = 0;
  var _playing = false;
  var _musicPlaying = true;
  var blurHeight = 180;

  @override
  void initState() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      var musicTimeLine = Provider.of<MusicTimeLine>(context, listen: false);
      musicTimeLine.incrementTime();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //final controller = Provider.of<BottomController>(context, listen: false);
    return Padding(
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
                  topLeft: Radius.circular(50), topRight: Radius.circular(50)),
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
                      //                     child: GestureDetector(
                      //   onTap: () {
                      //     setState(() {
                      //       print("Home");
                      //       controller.pageSelected = 0;
                      //       blurHeight = 180;
                      //     });
                      //   },
                      //   child: Icon(Icons.home,
                      //       color: controller.pageSelected == 0
                      //           ? Color(0xFFF89E63)
                      //           : Colors.white),
                      // ),
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
                      //                     child: GestureDetector(
                      //   onTap: () {
                      //     setState(() {
                      //       controller.pageSelected = 1;
                      //       print("Explore");
                      //     });
                      //   },
                      //   child: Icon(Icons.explore,
                      //       color: controller.pageSelected == 1
                      //           ? Color(0xFFF89E63)
                      //           : Colors.white),
                      // ),
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
                      //                     child: GestureDetector(
                      //   onTap: () {
                      //     setState(() {
                      //       print("profile");
                      //       controller.pageSelected = 2;
                      //     });
                      //   },
                      //   child: Icon(Icons.person,
                      //       color: controller.pageSelected == 2
                      //           ? Color(0xFFF89E63)
                      //           : Colors.white),
                      // ),
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
            : _musicPlaying
                ? Positioned(
                    bottom: 90,
                    left: 30,
                    child: Container(
                      //color: Colors.amber,
                      height: 100,
                      width: MediaQuery.of(context).size.width - 105,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //mainAxisAlignment: MainAxisAlignment.center,
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
                                CircleAvatar(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child:
                                        Image.asset("assets/images/trap.png"),
                                  ),
                                  radius: 20,
                                  backgroundColor: Colors.red,
                                ),
                                SizedBox(width: 20),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 27.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    //mainAxisAlignment: MainAxisAlignment.start,
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
                                    _playing
                                        ? Icons.play_arrow_rounded
                                        : Icons.pause,
                                    color: Colors.white,
                                    size: _playing ? 35 : 30,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _playing = !_playing;
                                    });
                                    print("play/pause");
                                  }),
                              IconButton(
                                  icon: Icon(
                                    Icons.close,
                                    size: 30,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _musicPlaying = !_musicPlaying;
                                      if (blurHeight == 130) {
                                        blurHeight = 180;
                                      } else {
                                        blurHeight = 130;
                                      }
                                    });
                                    print("stop it!");
                                  }),
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                : Container(height: 0),
      ]),
    );
  }
}
