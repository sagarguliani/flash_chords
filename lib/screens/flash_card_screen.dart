import 'package:flutter/material.dart';
import '../logic/chord_logic.dart';
import '../models/chord_model.dart';
import 'settings_screen.dart';

class FlashCardScreen extends StatefulWidget {
  @override
  _FlashCardScreenState createState() => _FlashCardScreenState();
}

class _FlashCardScreenState extends State<FlashCardScreen> {
  late Chord currentChord;

  @override
  void initState() {
    super.initState();
    currentChord = ChordLogic.generateRandomChord();
  }

  void _generateNewChord() {
    setState(() {
      currentChord = ChordLogic.generateRandomChord();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flash Chords'),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsScreen()),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: GestureDetector(
          onTap: _generateNewChord,
          child: Card(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            elevation: 8.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Container(
              padding: EdgeInsets.all(20),
              height: 200,
              width: 300,
              alignment: Alignment.center,
              child: Text(
                currentChord.toString(),
                style: TextStyle(fontSize: 24),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
