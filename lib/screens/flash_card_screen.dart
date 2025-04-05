import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flash Chords',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: FlashCardScreen(),
    );
  }
}

class FlashCardScreen extends StatefulWidget {
  @override
  _FlashCardScreenState createState() => _FlashCardScreenState();
}

class _FlashCardScreenState extends State<FlashCardScreen> {
  int currentChordIndex = 0;

  final List<String> chords = [
    'C Major',
    'A Minor',
    'D Major',
    'G7',
    'E7',
    'F Major',
  ];

  void nextChord() {
    setState(() {
      currentChordIndex = (currentChordIndex + 1) % chords.length;
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
        child: Card(
          elevation: 8.0,
          margin: EdgeInsets.all(16.0),
          child: Padding(
            padding: EdgeInsets.all(32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  chords[currentChordIndex],
                  style: TextStyle(
                    fontSize: 48.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: nextChord,
                  child: Text('Next Chord'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
