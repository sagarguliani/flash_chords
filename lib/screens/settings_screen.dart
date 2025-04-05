import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool showInversions = false;
  bool showSharps = true;
  bool showFlats = true;
  String selectedKey = 'C'; // Default selected key
  String chordType = 'maj'; // Default chord type

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            // Chord Type Selector
            ListTile(
              title: Text('Chord Type'),
              trailing: DropdownButton<String>(
                value: chordType,
                onChanged: (String? newValue) {
                  setState(() {
                    chordType = newValue!;
                  });
                },
                items: <String>['maj', 'min', '7', 'maj7', '6', '9', 'dim']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
            // Show Inversions
            ListTile(
              title: Text('Show Inversions'),
              trailing: Switch(
                value: showInversions,
                onChanged: (bool value) {
                  setState(() {
                    showInversions = value;
                  });
                },
              ),
            ),
            // Show Sharps
            ListTile(
              title: Text('Show Sharps'),
              trailing: Switch(
                value: showSharps,
                onChanged: (bool value) {
                  setState(() {
                    showSharps = value;
                  });
                },
              ),
            ),
            // Show Flats
            ListTile(
              title: Text('Show Flats'),
              trailing: Switch(
                value: showFlats,
                onChanged: (bool value) {
                  setState(() {
                    showFlats = value;
                  });
                },
              ),
            ),
            // Key Selection
            ListTile(
              title: Text('Key'),
              trailing: DropdownButton<String>(
                value: selectedKey,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedKey = newValue!;
                  });
                },
                items: <String>['C', 'D', 'E', 'F', 'G', 'A', 'B']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
