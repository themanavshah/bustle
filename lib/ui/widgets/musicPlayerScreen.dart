import 'dart:async';

import 'package:beats/provider/bottomController.dart';
import 'package:beats/provider/musicTimeLine.dart';
import 'package:beats/ui/widgets/seconds_to_minutes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MusicPlayerScreen extends StatefulWidget {
  MusicTimeLine musicTimeLine;
  BottomController controller;

  MusicPlayerScreen({this.musicTimeLine, this.controller});

  @override
  _MusicPlayerScreenState createState() => _MusicPlayerScreenState();
}

class _MusicPlayerScreenState extends State<MusicPlayerScreen> {
  var _isLiked = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragDown: (_) {},
      child: Container(
          child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 40),
          child: Column(
            children: [
              Divider(
                indent: 90,
                endIndent: 90,
                thickness: 4,
                color: Colors.grey,
              ),
              SizedBox(height: 50),
              Container(
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(150),
                      child: Image.asset("assets/images/trap.png")),
                  height: 270,
                  width: 270,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                  )),
              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Insomania",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          )),
                      SizedBox(height: 4),
                      Row(
                        children: [
                          Text("value beats",
                              style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                              )),
                          SizedBox(width: 9),
                          Text("\$30",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                              )),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(
                          _isLiked
                              ? Icons.favorite_rounded
                              : Icons.favorite_border,
                          color: _isLiked ? Colors.red : Colors.white,
                        ),
                        onPressed: () {
                          setState(() {
                            _isLiked = !_isLiked;
                          });
                        },
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.more_horiz,
                          color: Colors.white,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(height: 40),
              Stack(
                children: [
                  Divider(
                    color: Colors.grey,
                    thickness: 1,
                  ),
                  Divider(
                    endIndent: 300 -
                        double.parse(
                            '${(widget.musicTimeLine.timeSpent * 300) / widget.musicTimeLine.time}'),
                    color: Colors.white,
                    thickness: 3,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    secondsToMinute(widget.musicTimeLine.timeSpent),
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    secondsToMinute(widget.musicTimeLine.time),
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
              SizedBox(height: 50),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.share,
                      size: 20,
                      color: Colors.white,
                    ),
                    onPressed: () {},
                  ),
                  SizedBox(width: 10),
                  IconButton(
                    icon: Icon(
                      Icons.skip_previous_rounded,
                      size: 40,
                      color: Colors.white,
                    ),
                    onPressed: () {},
                  ),
                  SizedBox(width: 5),
                  IconButton(
                    icon: Icon(
                      widget.musicTimeLine.isPlaying
                          ? Icons.pause_circle_filled
                          : Icons.play_circle_fill_rounded,
                      size: 60,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      setState(() {
                        widget.musicTimeLine.isPlaying =
                            !widget.musicTimeLine.isPlaying;
                      });
                      print("pause/play");
                    },
                  ),
                  SizedBox(width: 22),
                  IconButton(
                    icon: Icon(
                      Icons.skip_next_rounded,
                      size: 40,
                      color: Colors.white,
                    ),
                    onPressed: () {},
                  ),
                  SizedBox(width: 10),
                  IconButton(
                    icon: Icon(
                      Icons.more_vert_rounded,
                      size: 20,
                      color: Colors.white,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
              SizedBox(height: 70),
              Center(
                child: Container(
                  height: 55,
                  width: 200,
                  child: Center(
                    child: Text(
                      "Add to cart",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),
                    ),
                    // child: Row(
                    //   children: [
                    //     Icon(
                    //       Icons.add,
                    //       color: Colors.white,
                    //     ),
                    //     Text(
                    //       "Add to cart",
                    //       style: TextStyle(
                    //         color: Colors.white,
                    //         fontWeight: FontWeight.w600,
                    //         fontSize: 15,
                    //       ),
                    //     )
                    //   ],
                    // ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
