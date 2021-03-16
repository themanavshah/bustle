import 'dart:ui';

import 'package:beats/data/genre_data.dart';
import 'package:beats/ui/musicPlayerScreen.dart';
import 'package:flutter/material.dart';
import 'package:swipedetector/swipedetector.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  var _isSelected = 0;
  var _lowerBarSelected = 0;
  var _playing = false;
  var _musicPlaying = true;
  var blurHeight = 180;
  var colors = [
    Colors.amber,
    Colors.blueAccent,
    Colors.greenAccent,
    Colors.indigoAccent,
  ];

  @override
  Widget build(BuildContext context) {
    // final tab = new TabBar(tabs: <Tab>[
    //   new Tab(child: Text("commercial")),
    //   new Tab(child: Text("free license")),
    // ]);
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.only(
          top: 40,
          right: 25,
          left: 25,
          // horizontal: 25.0,
          // vertical: 40,
        ),
        child: Stack(
          children: [
            Container(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        child: Icon(
                          Icons.music_note,
                          color: Color(0xFFF89E63),
                          size: 40,
                        ),
                        backgroundColor: Colors.transparent,
                        //backgroundImage: AssetImage("assets/images/bustle.png"),
                      ),
                      Row(
                        children: [
                          IconButton(
                            color: Colors.white,
                            icon: Icon(Icons.chat_bubble_outline_rounded),
                            onPressed: () {
                              //search bar
                              print("search");
                            },
                          ),
                          Stack(
                            children: [
                              IconButton(
                                color: Colors.white,
                                icon: Icon(Icons.shopping_cart),
                                onPressed: () {
                                  //search bar
                                  print("cart");
                                },
                              ),
                              Positioned(
                                top: 3,
                                right: 5,
                                child: CircleAvatar(
                                  backgroundColor: Colors.red,
                                  radius: 9,
                                  child: Text(
                                    "0",
                                    style: TextStyle(fontSize: 9),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 30.0,
                      top: 15,
                      bottom: 15,
                    ),
                    child: Text(
                      "Find a music according to your requirement.",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 60,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.search,
                            color: Color(0xFFF89E63).withOpacity(0.6),
                          ),
                          SizedBox(width: 10),
                          Text("Search",
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.5),
                                fontSize: 20,
                              ))
                        ],
                      ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey.withOpacity(0.5),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 40.0,
                      left: 40,
                      top: 50,
                      bottom: 20,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _isSelected = 0;
                            });
                          },
                          child: Text(
                            "Commercial",
                            style: TextStyle(
                                color: _isSelected == 0
                                    ? Colors.white
                                    : Colors.grey,
                                fontSize: 20,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _isSelected = 1;
                            });
                          },
                          child: Text(
                            "Free license",
                            style: TextStyle(
                                color: _isSelected == 1
                                    ? Colors.white
                                    : Colors.grey,
                                fontSize: 20,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                  ),
                  //SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Stack(
                      children: [
                        Divider(color: Colors.grey),
                        _isSelected == 0
                            ? Divider(
                                //if (_isSelected == 0)
                                endIndent: 155,
                                color: Color(0xFFF89E63),
                                thickness: 4,
                              )
                            : Divider(
                                //if (_isSelected == 0)
                                indent: 160,
                                color: Color(0xFFF89E63),
                                thickness: 4,
                              )
                      ],
                    ),
                  ),
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      children: List.generate(genreList.length, (index) {
                        return Container(
                            child: Padding(
                          padding: const EdgeInsets.all(13.0),
                          child: Container(
                              child: Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(90),
                                    child:
                                        Image.asset(genreList[index].imageUrl),
                                  ),
                                  Center(
                                    child: Text(
                                      genreList[index].name,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              decoration: BoxDecoration(
                                //color: colors[index],
                                shape: BoxShape.circle,
                              )),
                        ));
                      }),
                    ),
                  ),
                ],
              ),
            ),
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
              child: Container(
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
                          _lowerBarSelected = 0;
                          blurHeight = 180;
                        });
                      },
                      child: Icon(Icons.home,
                          color: _lowerBarSelected == 0
                              ? Color(0xFFF89E63)
                              : Colors.white),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          print("Explore");
                          _lowerBarSelected = 1;
                        });
                      },
                      child: Icon(Icons.explore,
                          color: _lowerBarSelected == 1
                              ? Color(0xFFF89E63)
                              : Colors.white),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          print("profile");
                          _lowerBarSelected = 2;
                        });
                      },
                      child: Icon(Icons.person,
                          color: _lowerBarSelected == 2
                              ? Color(0xFFF89E63)
                              : Colors.white),
                    ),
                  ],
                ),
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
                                        child: Image.asset(
                                            "assets/images/trap.png"),
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
                    : Container(height: 0)
          ],
        ),
      ),
    );
  }
}
