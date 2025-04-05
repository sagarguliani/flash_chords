class Chord {
  final String root;
  final String type;
  final bool isInversion;

  Chord({
    required this.root,
    required this.type,
    this.isInversion = false,
  });

  @override
  String toString() {
    return '$root$type${isInversion ? " (inv)" : ""}';
  }
}
