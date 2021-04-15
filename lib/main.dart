import 'package:beats/provider/bottomController.dart';
import 'package:beats/provider/musicTimeLine.dart';
import 'package:beats/services.dart/auth.dart';
import 'package:beats/ui/pages/authScreen.dart';
import 'package:beats/ui/widgets/commonScaffold.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MusicTimeLine>(
          create: (ctx) => MusicTimeLine(),
        ),
        ChangeNotifierProvider<BottomController>(
          create: (ctx) => BottomController(),
        ),
        ChangeNotifierProvider<Auth>(
          create: (ctx) => Auth(),
        ),
      ],
      child: Consumer<Auth>(builder: (context, auth, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Bustle',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: AuthScreen(),
        );
      }),
    );
  }
}
