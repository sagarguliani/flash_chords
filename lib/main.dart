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

class FlashCardScreen extends StatelessWidget {
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
            height: 200, // Set a fixed height to control the size of the card
            width: 300,  // Set a fixed width for the card
            alignment: Alignment.center,
            child: Text(
              'Chord Name Here', // This will display your chord name
              style: TextStyle(fontSize: 24),
            ),
          ),
        ),
      ),
    );
  }
}
