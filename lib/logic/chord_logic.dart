import 'dart:math';

class ChordLogic {
  final List<String> naturalRoots = ['C', 'D', 'E', 'F', 'G', 'A', 'B'];
  final List<String> accidentals = ['#', 'b']; // Sharps and flats
  final List<String> chordTypes = [
    '', 'maj7', 'min', 'min7', '6', '9', '11', 'sus2', 'sus4', 'dim', 'aug'
  ];
  final List<String> inversions = ['', '1st Inversion', '2nd Inversion'];

  bool useFlats = false;
  bool includeInversions = false;
  List<String> allowedChordTypes = [];

  ChordLogic({this.useFlats = false, this.includeInversions = false, this.allowedChordTypes = const []});

  /// Generates a random chord based on the settings
  String generateChord() {
    Random random = Random();

    // Pick a random root
    String root = naturalRoots[random.nextInt(naturalRoots.length)];

    // Decide whether to apply an accidental
    if (random.nextBool()) {
      root += useFlats ? 'b' : '#';
    }

    // Pick a chord type
    String chordType;
    if (allowedChordTypes.isNotEmpty) {
      chordType = allowedChordTypes[random.nextInt(allowedChordTypes.length)];
    } else {
      chordType = chordTypes[random.nextInt(chordTypes.length)];
    }

    // Pick an inversion if enabled
    String inversion = includeInversions ? inversions[random.nextInt(inversions.length)] : '';

    return "$root$chordType ${inversion.isNotEmpty ? '($inversion)' : ''}".trim();
  }
}
