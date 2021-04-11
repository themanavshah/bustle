import 'dart:math';

import 'package:beats/data/genre_data.dart';
import 'package:beats/data/language_list.dart';
import 'package:beats/data/your_genre_data.dart';
import 'package:flutter/material.dart';

class Explore extends StatelessWidget {
  // generate a random index based on the list length
  // and use it to retrieve the element

  Color element = colorsy[Random().nextInt(colorsy.length)];

  @override
  Widget build(BuildContext context) {
    //print(element);
    return Container(
        child: Center(
      child: Padding(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0, top: 60),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                      Text("Search for music, artist...",
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
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                SizedBox(height: 40),
                Text(
                  "Top Genres",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Container(
                  height: 470,
                  child: GridView.count(
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    children: List.generate(yourGenreList.length, (index) {
                      return Padding(
                        padding: const EdgeInsets.only(
                          right: 15.0,
                          bottom: 15,
                        ),
                        child: Container(
                            width: 40,
                            height: 10,
                            child: Center(
                              child: Text(
                                yourGenreList[index].name,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              color: colorsy[index].withOpacity(0.8),
                              //color: colors[index],
                              //shape: BoxShape.circle,
                            )),
                      );
                    }),
                  ),
                ),
                Text(
                  "Languages",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Container(
                  height: 470,
                  child: GridView.count(
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    children: List.generate(yourLanguageList.length, (index) {
                      return Padding(
                        padding: const EdgeInsets.only(
                          right: 15.0,
                          bottom: 15,
                        ),
                        child: Container(
                            width: 40,
                            height: 10,
                            child: Center(
                              child: Text(
                                yourLanguageList[index].name,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              color: colorsz[index].withOpacity(0.8),
                              //color: colors[index],
                              //shape: BoxShape.circle,
                            )),
                      );
                    }),
                  ),
                ),
              ]),
            ],
          ),
        ),
      ),
    ));
  }
}
