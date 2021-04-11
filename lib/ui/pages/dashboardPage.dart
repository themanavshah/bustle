import 'dart:ui';

import 'package:beats/provider/bottomController.dart';
import 'package:beats/provider/musicTimeLine.dart';
import 'package:beats/ui/widgets/playlist.dart';
import 'package:flutter/material.dart';

import 'package:beats/data/genre_data.dart';

class Dashboard extends StatefulWidget {
  MusicTimeLine musicTimeLine;
  BottomController controller;

  Dashboard({this.musicTimeLine, this.controller});

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  var _isSelected = 0;
  var blurHeight = 180;
  var colors = [
    Colors.amber,
    Colors.blueAccent,
    Colors.greenAccent,
    Colors.indigoAccent,
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                    color: Colors.grey.withOpacity(0.3),
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
                              color:
                                  _isSelected == 0 ? Colors.white : Colors.grey,
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
                              color:
                                  _isSelected == 1 ? Colors.white : Colors.grey,
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
                      return GestureDetector(
                        onTap: () {
                          print(genreList[index].name);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Playlist(
                                musicTimeLine: widget.musicTimeLine,
                                controller: widget.controller,
                              ),
                            ),
                          );
                        },
                        child: Container(
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
                        )),
                      );
                    }),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
