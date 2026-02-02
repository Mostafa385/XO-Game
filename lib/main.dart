import 'package:flutter/material.dart';
import 'package:xo_game/screens/gmae_board.dart';
import 'package:xo_game/screens/pickFirst.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        GmaeBoard.routeName: (_) => GmaeBoard(),
        Pickfirst.routeName: (_) => Pickfirst(),
      },
      initialRoute: Pickfirst.routeName,
    );
  }
}
