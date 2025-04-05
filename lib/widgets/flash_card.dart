import 'package:flutter/material.dart';

class FlashCard extends StatelessWidget {
  final String chordName;

  FlashCard({required this.chordName});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        width: 250,
        height: 200,
        alignment: Alignment.center,
        padding: EdgeInsets.all(20),
        child: Text(
          chordName,
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
