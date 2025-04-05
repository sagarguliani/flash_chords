import 'package:flutter/material.dart';
import '../logic/chord_logic.dart';

class FlashcardScreen extends StatefulWidget {
  @override
  _FlashcardScreenState createState() => _FlashcardScreenState();
}

class _FlashcardScreenState extends State<FlashcardScreen> {
  late ChordLogic chordLogic;
  String currentChord = "";

  @override
  void initState() {
    super.initState();
    chordLogic = ChordLogic(useFlats: false, includeInversions: true);
    generateNewChord();
  }

  void generateNewChord() {
    setState(() {
      currentChord = chordLogic.generateChord();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flash Chords'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              currentChord,
              style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: generateNewChord,
              child: Text('Next Chord'),
            ),
          ],
        ),
      ),
    );
  }
}
