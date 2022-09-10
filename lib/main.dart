import 'package:first_app/screens/calculator_screen.dart';
import 'package:flutter/material.dart';
import 'screens/intro_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.brown),
      routes: {
        '/': (context) => const IntroScreen(),
        '/calculator': (context) => const Calculator(),
      },
      initialRoute: '/',
    );
  }
}
