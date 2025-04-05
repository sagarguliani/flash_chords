import 'package:flutter/material.dart';
import 'screens/flash_card_screen.dart';

void main() {
  runApp(FlashChordsApp());
}

class FlashChordsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flash Chords',
      theme: ThemeData.dark(),
      home: FlashcardScreen(),
    );
  }
}
