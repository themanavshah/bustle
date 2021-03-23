import 'package:beats/provider/bottomController.dart';
import 'package:beats/provider/musicTimeLine.dart';
import 'package:beats/ui/widgets/commonScaffold.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bustle',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider<MusicTimeLine>(
              create: (ctx) => MusicTimeLine()),
          ChangeNotifierProvider<BottomController>(
              create: (ctx) => BottomController()),
        ],
        child: CommonScaffold(),
      ),
    );
  }
}
