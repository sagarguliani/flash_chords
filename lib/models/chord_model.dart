import 'dart:math';
import '../models/chord_model.dart';

class ChordLogic {
  final List<String> roots = ["C", "C#", "D", "D#", "E", "F", "F#", "G", "G#", "A", "A#", "B"];
  final List<String> types = [
    "Major", "Minor", "Maj7", "Min7", "7th", "Dim", "Dim7",
    "Aug", "6th", "9th", "11th", "Sus2", "Sus4"
  ];

  /// Generates a random chord based on settings
  Chord getRandomChord({
    bool allowSharps = true,
    bool allowFlats = true,
    bool allowNaturals = true,
    bool allowInversions = false
  }) {
    Random random = Random();

    String root = _getRandomRoot(allowSharps, allowFlats, allowNaturals);
    String type = types[random.nextInt(types.length)];

    int inversion = allowInversions ? random.nextInt(3) : 0; // Root position, 1st, or 2nd inversion

    return Chord(root: root, type: type, inversion: inversion);
  }

  /// Returns a random root note based on settings
  String _getRandomRoot(bool allowSharps, bool allowFlats, bool allowNaturals) {
    List<String> validRoots = [];

    for (String note in roots) {
      if (note.contains("#") && allowSharps) validRoots.add(note);
      else if (note.contains("b") && allowFlats) validRoots.add(note);
      else if (!note.contains("#") && !note.contains("b") && allowNaturals) validRoots.add(note);
    }

    return validRoots.isNotEmpty ? validRoots[Random().nextInt(validRoots.length)] : "C";
  }

  /// Applies inversion to a chord (simplified for now)
  Chord applyInversion(Chord chord) {
    List<String> notes = getChordNotes(chord);
    if (chord.inversion > 0 && chord.inversion < notes.length) {
      // Move the first note to the end for each inversion step
      for (int i = 0; i < chord.inversion; i++) {
        notes.add(notes.removeAt(0));
      }
    }
    return Chord(root: notes[0], type: chord.type, inversion: chord.inversion);
  }

  /// Generates the actual note structure of a chord
  List<String> getChordNotes(Chord chord) {
    Map<String, List<int>> chordIntervals = {
      "Major": [0, 4, 7], "Minor": [0, 3, 7], "Maj7": [0, 4, 7, 11],
      "Min7": [0, 3, 7, 10], "7th": [0, 4, 7, 10], "Dim": [0, 3, 6],
      "Dim7": [0, 3, 6, 9], "Aug": [0, 4, 8], "6th": [0, 4, 7, 9],
      "9th": [0, 4, 7, 10, 14], "11th": [0, 4, 7, 10, 14, 17],
      "Sus2": [0, 2, 7], "Sus4": [0, 5, 7]
    };

    List<int> intervals = chordIntervals[chord.type] ?? [0, 4, 7]; // Default to Major
    return intervals.map((step) => _getNoteFromRoot(chord.root, step)).toList();
  }

  /// Gets the actual note from root + interval
  String _getNoteFromRoot(String root, int step) {
    List<String> scale = ["C", "C#", "D", "D#", "E", "F", "F#", "G", "G#", "A", "A#", "B"];
    int rootIndex = scale.indexOf(root);
    return scale[(rootIndex + step) % scale.length];
  }
}
