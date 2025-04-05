class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: [
            ListTile(
              title: Text('Difficulty'),
              subtitle: Text('Choose difficulty level'),
              onTap: () {
                // Implement difficulty level selection logic here later
              },
            ),
            Divider(),
            ListTile(
              title: Text('Chord Inversions'),
              subtitle: Text('Include inversions in chords'),
              onTap: () {
                // Implement inversion toggle later
              },
            ),
            Divider(),
            ListTile(
              title: Text('Key'),
              subtitle: Text('Select a key for the chords'),
              onTap: () {
                // Implement key selection later
              },
            ),
            Divider(),
            ListTile(
              title: Text('Time Signature'),
              subtitle: Text('Select a time signature'),
              onTap: () {
                // Implement time signature selection later
              },
            ),
          ],
        ),
      ),
    );
  }
}
