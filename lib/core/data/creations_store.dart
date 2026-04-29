class Creation {
  final String imageUrl;
  final String featureLabel;
  final DateTime date;

  Creation({
    required this.imageUrl,
    required this.featureLabel,
    required this.date,
  });
}

class CreationsStore {
  static final CreationsStore _instance = CreationsStore._internal();
  factory CreationsStore() => _instance;
  CreationsStore._internal();

  final List<Creation> creations = [];

  void addCreation(Creation creation) {
    creations.insert(0, creation);
  }
}
