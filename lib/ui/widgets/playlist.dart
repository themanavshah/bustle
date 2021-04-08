import 'dart:ui';

import 'package:beats/provider/bottomController.dart';
import 'package:beats/provider/musicTimeLine.dart';
import 'package:beats/ui/widgets/bottomWidget.dart';
import 'package:flutter/material.dart';

class Playlist extends StatefulWidget {
  MusicTimeLine musicTimeLine;
  BottomController controller;

  Playlist({this.musicTimeLine, this.controller});

  @override
  _PlaylistState createState() => _PlaylistState();
}

class _PlaylistState extends State<Playlist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.only(
            top: 50.0,
          ),
          child: Stack(
            children: [
              Container(
                child: Center(
                  child: Column(
                    children: [
                      Text(
                        'List',
                        style: TextStyle(color: Colors.white),
                      ),
                      IconButton(
                          icon: Icon(
                            Icons.arrow_back_ios_rounded,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          })
                    ],
                  ),
                ),
              ),
              BottomNavigator(
                musicTimeLine: widget.musicTimeLine,
                controller: widget.controller,
              ),
            ],
          ),
        ));
  }
}
