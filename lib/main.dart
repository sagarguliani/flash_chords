import 'package:flutter/material.dart';
import 'screens/flash_card_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flash Chords',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: FlashCardScreen(),
    );
  }
}
