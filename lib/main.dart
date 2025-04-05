import 'package:flutter/material.dart';
import '../logic/chord_logic.dart'; // Import chord logic
import '../models/chord_model.dart'; // Import chord model
import '../screens/settings_screen.dart'; // Import the settings screen

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flash Chords',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FlashCardScreen(),
    );
  }
}

class FlashCardScreen extends StatefulWidget {
  @override
  _FlashCardScreenState createState() => _FlashCardScreenState();
}

class _FlashCardScreenState extends State<FlashCardScreen> {
  ChordLogic chordLogic = ChordLogic();
  Chord currentChord = Chord(name: 'C', type: 'maj');

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
          onTap: () {
            setState(() {
              currentChord = chordLogic.getRandomChord();
            });
          },
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
                '${currentChord.name} ${currentChord.type}',
                style: TextStyle(fontSize: 24),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
