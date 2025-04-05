import '../models/chord_model.dart';
import 'dart:math';

class ChordLogic {
  static final List<String> roots = ['C', 'C#', 'D', 'D#', 'E', 'F', 'F#', 'G', 'G#', 'A', 'A#', 'B'];
  static final List<String> types = ['maj', 'min', '7', 'maj7', '6', '9', '11', 'dim', 'sus2', 'sus4'];

  static final Random _random = Random();

  static Chord generateRandomChord({
    bool allowInversions = false,
    List<String>? allowedTypes,
    List<String>? allowedRoots,
  }) {
    final filteredRoots = allowedRoots ?? roots;
    final filteredTypes = allowedTypes ?? types;

    final root = filteredRoots[_random.nextInt(filteredRoots.length)];
    final type = filteredTypes[_random.nextInt(filteredTypes.length)];
    final isInversion = allowInversions ? _random.nextBool() : false;

    return Chord(root: root, type: type, isInversion: isInversion);
  }
}
