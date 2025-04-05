import 'package:flutter/material.dart';

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
  // Sample chord list (You can later replace this with your dynamic logic)
  List<String> chordNames = [
    "C Major",
    "A Minor",
    "G Major",
    "E Minor",
    "D Major"
  ];

  String currentChord = "";  // Variable to store the current chord to be displayed

  @override
  void initState() {
    super.initState();
    // Initially set a chord name
    currentChord = chordNames[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flash Chords'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              // Implement your settings action here
            },
          ),
        ],
      ),
      body: Center(
        child: Card(
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          elevation: 8.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Container(
            padding: EdgeInsets.all(20),
            height: 200, // Fixed height of the card
            width: 300,  // Fixed width of the card
            alignment: Alignment.center,
            child: Text(
              currentChord, // Display the current chord
              style: TextStyle(fontSize: 24),
            ),
          ),
        ),
      ),
    );
  }
}
